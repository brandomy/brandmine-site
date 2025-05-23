# Jekyll plugin to sync insights collection to JSON for search and performance
# Maintains YAML front matter for human editing while generating JSON for machine processing

Jekyll::Hooks.register :site, :post_write do |site|
  insights_data = []
  
  # Process insights from all languages
  ['en', 'ru', 'zh'].each do |lang|
    lang_insights = site.collections['insights'].docs.select { |doc| doc.data['lang'] == lang }
    
    lang_insights.each do |insight|
      # Extract and clean data
      insight_data = {
        'id' => insight.data['ref'] || insight.basename_without_ext,
        'title' => {
          lang => insight.data['title']
        },
        'excerpt' => {
          lang => insight.data['excerpt']
        },
        'content' => {
          lang => strip_liquid_tags(insight.content)
        },
        'date' => insight.data['date']&.strftime('%Y-%m-%d'),
        'author' => insight.data['author'],
        'category' => insight.data['category'],
        'reading_time' => insight.data['reading_time'],
        'brands' => insight.data['brands'] || [],
        'founders' => insight.data['founders'] || [],
        'sectors' => insight.data['sectors'] || [],
        'markets' => insight.data['markets'] || [],
        'attributes' => insight.data['attributes'] || [],
        'signals' => insight.data['signals'] || [],
        'featured' => insight.data['featured'] || false,
        'premium' => insight.data['premium'] || false,
        'sample_data' => insight.data['sample_data'] || false,
        'permalink' => {
          lang => insight.data['permalink'] || "/#{lang}/insights/#{insight.data['ref']}/"
        },
        'last_modified' => insight.data['last_modified'] || insight.data['date']&.strftime('%Y-%m-%d'),
        'word_count' => count_words(insight.content),
        'tags' => generate_search_tags(insight.data),
        'related_content' => {
          'brands' => insight.data['brands'] || [],
          'founders' => insight.data['founders'] || [],
          'dimensions' => (insight.data['sectors'] || []) + 
                         (insight.data['markets'] || []) + 
                         (insight.data['attributes'] || []) + 
                         (insight.data['signals'] || [])
        }
      }
      
      # Find existing insight or create new
      existing = insights_data.find { |i| i['id'] == insight_data['id'] }
      if existing
        # Merge language data
        existing['title'][lang] = insight_data['title'][lang]
        existing['excerpt'][lang] = insight_data['excerpt'][lang]
        existing['content'][lang] = insight_data['content'][lang]
        existing['permalink'][lang] = insight_data['permalink'][lang]
      else
        insights_data << insight_data
      end
    end
  end
  
  # Save insights JSON
  output_dir = File.join(site.dest, 'assets', 'data')
  FileUtils.mkdir_p(output_dir)
  
  insights_file = File.join(output_dir, 'insights.json')
  File.write(insights_file, JSON.pretty_generate(insights_data.sort_by { |i| i['date'] }.reverse))
  
  # Also save to source _data for Jekyll access
  source_data_dir = File.join(site.source, '_data')
  source_insights_file = File.join(source_data_dir, 'insights.json')
  File.write(source_insights_file, JSON.pretty_generate(insights_data.sort_by { |i| i['date'] }.reverse))
  
  puts "✅ Generated insights.json with #{insights_data.length} insights"
end

# Helper methods
def strip_liquid_tags(content)
  # Remove liquid tags but keep the content for search
  content.gsub(/\{%.*?%\}/, '').gsub(/\{\{.*?\}\}/, '').strip
end

def count_words(content)
  strip_liquid_tags(content).split.length
end

def generate_search_tags(data)
  tags = []
  
  # Add category as tag
  tags << data['category'] if data['category']
  
  # Add author as tag
  tags << "author:#{data['author']}" if data['author']
  
  # Add content flags
  tags << 'featured' if data['featured']
  tags << 'premium' if data['premium']
  
  # Add reading time ranges
  if data['reading_time']
    case data['reading_time'].to_i
    when 0..3
      tags << 'quick-read'
    when 4..7
      tags << 'medium-read'
    else
      tags << 'long-read'
    end
  end
  
  tags
end