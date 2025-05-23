# _plugins/founders_json_sync.rb
# Auto-generates founders.json from founder profile YAML files
# Clean approach - no multilingual merging needed

require 'json'

Jekyll::Hooks.register :site, :post_write do |site|
  puts "🔄 Generating founders.json from YAML profiles..."

  # Get all founder pages marked for JSON generation
  founder_pages = site.collections['founders'].docs.select do |doc|
    doc.data['generate_json'] == true
  end

  puts "📄 Found #{founder_pages.length} founder profiles to process..."

  # Transform each founder page to JSON structure
  founders_json = founder_pages.map do |page|
    transform_founder_to_json(page.data, page.content)
  end

  # Group by ref to collect all languages for each founder
  founders_by_ref = {}
  founders_json.each do |founder|
    ref = founder['id']
    lang = founder.delete('lang') # Remove lang from individual record

    if founders_by_ref[ref]
      # Add this language's data to existing founder
      founders_by_ref[ref]['name'][lang] = founder['name']
      founders_by_ref[ref]['position'][lang] = founder['position']
      founders_by_ref[ref]['biography'][lang] = founder['biography']
    else
      # First language for this founder - convert to multilingual structure
      founders_by_ref[ref] = founder.dup
      founders_by_ref[ref]['name'] = { lang => founder['name'] }
      founders_by_ref[ref]['position'] = { lang => founder['position'] }
      founders_by_ref[ref]['biography'] = { lang => founder['biography'] }
    end
  end

  # Convert back to array
  final_founders = founders_by_ref.values

  # Write to _data/founders.json
  output_path = File.join(site.source, '_data', 'founders.json')
  File.write(output_path, JSON.pretty_generate(final_founders))

  puts "✅ Generated founders.json with #{final_founders.length} founders"
  puts "💾 Saved to: #{output_path}"
end

def transform_founder_to_json(data, content)
  # Extract biography from content (first paragraph)
  biography_text = extract_biography(content)

  # Build founder structure (will be converted to multilingual later)
  founder = {
    'id' => data['ref'],
    'name' => data['name'],
    'position' => data['role'] || extract_position_from_title(data['title']),
    'biography' => biography_text,
    'brands' => data['brands'] || [],
    'generation' => data['generation'],
    'country' => data['country_code'],
    'founder_led' => true, # Assume true for founder profiles
    'sample_data' => data['sample_data'] || false,
    'featured' => data['featured'] || false,
    'images' => build_images_structure(data),
    'lang' => data['lang'] # Track language for grouping
  }

  # Add optional fields if present
  founder['markets'] = data['markets'] if data['markets']
  founder['languages'] = data['languages'] if data['languages']
  founder['expertise'] = data['expertise'] if data['expertise']
  founder['achievements'] = data['achievements'] if data['achievements']
  founder['brief_bio'] = data['brief_bio'] if data['brief_bio']
  founder['cross_border_expertise'] = data['cross_border_expertise'] if data['cross_border_expertise']
  founder['social'] = data['social'] if data['social']
  founder['region'] = data['region'] if data['region']
  founder['city'] = data['city'] if data['city']

  founder
end

def build_images_structure(data)
  images = {}

  # Use semantic image data (sample data only - no legacy paths)
  if data['images']
    data['images'].each do |type, config|
      images[type] = {
        'name' => config['name'],
        'ext' => config['ext'] || 'jpg',
        'available' => true
      }
    end
  else
    # Default structure if images not specified
    images['portrait'] = {
      'name' => 'portrait',
      'ext' => 'jpg',
      'available' => false
    }

    images['headshot'] = {
      'name' => 'headshot',
      'ext' => 'jpg',
      'available' => false
    }
  end

  images
end

def extract_position_from_title(title)
  # Extract position from title format "Name - Position"
  return '' unless title
  parts = title.split(' - ')
  parts.length > 1 ? parts.last.strip : ''
end

def extract_biography(content)
  # Remove front matter
  content_without_frontmatter = content.gsub(/\A---.*?---/m, '').strip

  # Extract first substantial paragraph (skip title lines starting with #)
  lines = content_without_frontmatter.split("\n")

  first_paragraph = ""
  lines.each do |line|
    line = line.strip
    next if line.empty?
    next if line.start_with?('#')
    next if line.start_with?('<!--')
    next if line.start_with?('>')

    # Found first content paragraph
    first_paragraph = line
    break
  end

  # Truncate to reasonable length for biography
  if first_paragraph.length > 300
    first_paragraph = first_paragraph[0..297] + "..."
  end

  first_paragraph
end
