
# _plugins/brands_json_sync.rb
# Auto-generates brands.json from brand profile YAML files
# Matches the founder plugin pattern exactly

require 'json'

Jekyll::Hooks.register :site, :post_write do |site|
  puts "🔄 Generating brands.json from YAML profiles..."

  # Get all brand pages marked for JSON generation
  brand_pages = site.collections['brands'].docs.select do |doc|
    doc.data['generate_json'] == true
  end

  puts "📄 Found #{brand_pages.length} brand profiles to process..."

  # Transform each brand page to JSON structure
  brands_json = brand_pages.map do |page|
    transform_brand_to_json(page.data, page.content)
  end

  # Group by ref to collect all languages for each brand
  brands_by_ref = {}
  brands_json.each do |brand|
    ref = brand['id']
    lang = brand.delete('lang') # Remove lang from individual record

    if brands_by_ref[ref]
      # Add this language's data to existing brand
      brands_by_ref[ref]['name'][lang] = brand['name']
      brands_by_ref[ref]['description'][lang] = brand['description']
    else
      # First language for this brand - convert to multilingual structure
      brands_by_ref[ref] = brand.dup
      brands_by_ref[ref]['name'] = { lang => brand['name'] }
      brands_by_ref[ref]['description'] = { lang => brand['description'] }
    end
  end

  # Convert back to array
  final_brands = brands_by_ref.values

  # Write to _data/brands.json
  output_path = File.join(site.source, '_data', 'brands.json')
  File.write(output_path, JSON.pretty_generate(final_brands))

  puts "✅ Generated brands.json with #{final_brands.length} brands"
  puts "💾 Saved to: #{output_path}"
end

def transform_brand_to_json(data, content)
  # Extract description from content (first paragraph)
  description_text = extract_description(content)

  # Build brand structure (will be converted to multilingual later)
  brand = {
    'id' => data['ref'],
    'name' => data['title'],
    'description' => description_text,
    'founders' => data['founders'] || [],
    'founding_year' => data['founding_year'],
    'website' => data['website'],
    'sectors' => data['sectors'] || [],
    'markets' => data['markets'] || [],
    'attributes' => data['attributes'] || [],
    'signals' => data['signals'] || [],
    'featured' => data['featured'] || false,
    'featured_level' => data['featured_level'] || 0,
    'sample_data' => data['sample_data'] || false,
    'images' => build_brand_images_structure(data),
    'lang' => data['lang'] # Track language for grouping
  }

  # Add optional fields if present
  brand['slogan'] = data['slogan'] if data['slogan']
  brand['email'] = data['email'] if data['email']
  brand['location'] = build_location_structure(data['location']) if data['location']
  brand['social_media'] = data['social_media'] if data['social_media']
  brand['export_ready'] = data['export_ready'] if data['export_ready']
  brand['export_markets'] = data['export_markets'] if data['export_markets']
  brand['distribution_models'] = data['distribution_models'] if data['distribution_models']
  brand['timeline'] = data['timeline'] if data['timeline']
  brand['certifications'] = data['certifications'] if data['certifications']
  brand['awards'] = data['awards'] if data['awards']
  brand['gallery'] = data['gallery'] if data['gallery']

  brand
end

def build_brand_images_structure(data)
  images = {}

  # Use semantic image data if available
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
    %w[logo hero founder].each do |type|
      images[type] = {
        'name' => type,
        'ext' => type == 'logo' ? 'png' : 'jpg',
        'available' => false
      }
    end
  end

  images
end

def build_location_structure(location_data)
  return nil unless location_data

  {
    'lat' => location_data['lat'],
    'lng' => location_data['lng'],
    'city' => location_data['city'],
    'region' => location_data['region'],
    'country' => location_data['country']
  }
end

def extract_description(content)
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

  # Truncate to reasonable length for description
  if first_paragraph.length > 300
    first_paragraph = first_paragraph[0..297] + "..."
  end

  first_paragraph
end
