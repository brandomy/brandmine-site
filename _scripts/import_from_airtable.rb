#!/usr/bin/env ruby
# Import brands from Airtable to Jekyll JSON
# Usage: ruby _scripts/import_from_airtable.rb

require 'net/http'
require 'json'
require 'uri'
require 'fileutils'

class AirtableBrandImporter
  def initialize
    @api_key = ENV['AIRTABLE_PERSONAL_ACCESS_TOKEN']
    @base_id = ENV['AIRTABLE_BASE_ID']
    @table_id = ENV['AIRTABLE_BRAND_DATABASE_TABLE_ID']
    @api_url = "https://api.airtable.com/v0/#{@base_id}/#{@table_id}"
    
    unless @api_key && @base_id && @table_id
      puts "Error: Missing Airtable credentials in environment variables"
      exit 1
    end
  end

  def import_brands
    puts "🔄 Importing brands from Airtable..."
    
    all_records = fetch_all_records
    level_0_brands = process_records(all_records)
    
    # Load existing brands (levels 1-2)
    existing_brands = load_existing_brands
    
    # Merge and save
    merged_brands = merge_brand_data(existing_brands, level_0_brands)
    save_brands_json(merged_brands)
    
    puts "✅ Successfully imported #{level_0_brands.length} Level 0 brands"
    puts "📊 Total brands: #{merged_brands.length}"
  end

  private

  def fetch_all_records
    records = []
    offset = nil
    
    loop do
      url = URI(@api_url)
      url.query = URI.encode_www_form({
        'filterByFormula' => "AND({Status} = 'Published', {Data Level} = '0-Basic')",
        'offset' => offset
      }.compact)

      request = Net::HTTP::Get.new(url)
      request['Authorization'] = "Bearer #{@api_key}"
      
      response = Net::HTTP.start(url.hostname, url.port, use_ssl: true) do |http|
        http.request(request)
      end

      if response.code == '200'
        data = JSON.parse(response.body)
        records.concat(data['records'])
        offset = data['offset']
        break unless offset
        
        puts "📥 Fetched #{records.length} records so far..."
      else
        puts "❌ Error fetching data: #{response.code} #{response.body}"
        exit 1
      end
    end
    
    records
  end

  def process_records(records)
    brands = []
    
    records.each do |record|
      fields = record['fields']
      
      # Generate slug from brand name
      slug = generate_slug(fields['Brand Name EN'])
      
      brand = {
        'id' => slug,
        'name' => {
          'en' => fields['Brand Name EN'],
          'ru' => fields['Brand Name RU'] || fields['Brand Name EN'],
          'zh' => fields['Brand Name ZH'] || fields['Brand Name EN']
        },
        'description' => {
          'en' => fields['Description EN'] || "A #{fields['Sector']} brand from #{fields['Country']}.",
          'ru' => fields['Description RU'] || fields['Description EN'] || "Бренд #{fields['Sector']} из #{fields['Country']}.",
          'zh' => fields['Description ZH'] || fields['Description EN'] || "来自#{fields['Country']}的#{fields['Sector']}品牌。"
        },
        'founding_year' => fields['Founding Year'],
        'website' => fields['Website'],
        'founders' => [], # Level 0 brands don't have founder profiles yet
        'founder_led' => nil,
        'sectors' => fields['Sector'] ? [slugify(fields['Sector'])] : [],
        'markets' => fields['Country'] ? [slugify(fields['Country'])] : [],
        'attributes' => [], # To be filled when promoted to Level 1
        'signals' => [], # To be filled when promoted to Level 1
        'location' => {
          'city' => fields['City'],
          'region' => fields['Region'],
          'country' => country_code_from_name(fields['Country']),
          'lat' => nil, # To be geocoded later
          'lng' => nil
        },
        'featured' => fields['Featured'] || false,
        'featured_level' => 0,
        'data_level' => 0,
        'airtable_id' => record['id'],
        'last_updated' => fields['Last Updated'] || Time.now.strftime('%Y-%m-%d'),
        'sample_data' => false
      }
      
      brands << brand
    end
    
    brands
  end

  def load_existing_brands
    brands_file = File.join(File.dirname(__FILE__), '..', '_data', 'brands.json')
    
    if File.exist?(brands_file)
      JSON.parse(File.read(brands_file))
    else
      []
    end
  end

  def merge_brand_data(existing_brands, level_0_brands)
    # Remove any existing Level 0 brands (they'll be replaced)
    filtered_existing = existing_brands.reject { |brand| brand['data_level'] == 0 }
    
    # Merge with new Level 0 brands
    merged = filtered_existing + level_0_brands
    
    # Sort by featured status, then data level, then name
    merged.sort_by do |brand|
      [
        brand['featured'] ? 0 : 1,
        -(brand['data_level'] || 0),
        brand['name']['en'] || ''
      ]
    end
  end

  def save_brands_json(brands)
    output_file = File.join(File.dirname(__FILE__), '..', '_data', 'brands.json')
    
    # Backup existing file
    if File.exist?(output_file)
      backup_file = "#{output_file}.backup.#{Time.now.strftime('%Y%m%d_%H%M%S')}"
      FileUtils.cp(output_file, backup_file)
      puts "📁 Backup created: #{backup_file}"
    end
    
    # Write new file
    File.write(output_file, JSON.pretty_generate(brands))
    puts "💾 Saved to #{output_file}"
  end

  def generate_slug(name)
    return '' unless name
    
    name.downcase
        .gsub(/[^\w\s-]/, '') # Remove special characters
        .gsub(/\s+/, '-')     # Replace spaces with hyphens
        .gsub(/-+/, '-')      # Replace multiple hyphens with single
        .strip.chomp('-')     # Remove leading/trailing hyphens
  end

  def slugify(text)
    generate_slug(text)
  end

  def country_code_from_name(country_name)
    country_map = {
      'Brazil' => 'br',
      'Russia' => 'ru', 
      'India' => 'in',
      'China' => 'cn',
      'South Africa' => 'za',
      'Iran' => 'ir',
      'Egypt' => 'eg',
      'Ethiopia' => 'et',
      'Indonesia' => 'id',
      'UAE' => 'ae'
    }
    
    country_map[country_name] || country_name&.downcase&.slice(0, 2)
  end
end

# Run the import
if __FILE__ == $0
  importer = AirtableBrandImporter.new
  importer.import_brands
end