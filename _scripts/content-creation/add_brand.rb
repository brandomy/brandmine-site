#!/usr/bin/env ruby
# add_brand.rb
# Purpose: Interactive script to add a new brand in English
# Usage: ruby _scripts/add_brand.rb
# Note: Only creates English version - use AI tools to translate to RU/ZH

require 'yaml'
require 'fileutils'

def prompt(message, default = nil)
  if default
    print "#{message} [#{default}]: "
  else
    print "#{message}: "
  end
  input = gets.chomp
  input.empty? && default ? default : input
end

def prompt_list(message)
  print "#{message} (comma-separated): "
  gets.chomp.split(',').map(&:strip)
end

def create_brand_file(data)
  # Create directory for English content
  dir = "_brands/en"
  FileUtils.mkdir_p(dir)

  # Create English content
  content = generate_english_content(data)

  # Write file with country code prefix
  filename = "#{dir}/#{data[:country_code]}-#{data[:brand_slug]}.md"
  File.write(filename, content)
  puts "Created #{filename}"

  # Note about translations
  puts "\nNote: English version created. Use AI tools to translate to RU and ZH:"
  puts "  - Russian: _brands/ru/#{data[:country_code]}-#{data[:brand_slug]}.md"
  puts "  - Chinese: _brands/zh/#{data[:country_code]}-#{data[:brand_slug]}.md"
end

def generate_english_content(data)
  ref = "#{data[:country_code]}-#{data[:brand_slug]}"

  front_matter = {
    'layout' => 'brand',
    'ref' => ref,
    'title' => data[:title],
    'description' => data[:description],
    'lang' => 'en',
    'permalink' => "/en/brands/#{ref}/",
    'founding_year' => data[:founding_year],
    'website' => data[:website],
    'founders' => data[:founders],
    'sectors' => data[:sectors],
    'markets' => data[:markets],
    'attributes' => data[:attributes],
    'signals' => data[:signals],
    'featured' => false,
    'featured_level' => 0,
    'location_lat' => data[:location_lat],
    'location_lng' => data[:location_lng],
    'location_city' => data[:location_city],
    'location_country' => data[:location_country],
    'logo' => "/assets/images/brands/#{ref}/logo-color.png",
    'hero_image' => "/assets/images/brands/#{ref}/hero-main.jpg"
  }

  yaml = YAML.dump(front_matter)

  <<~CONTENT
  ---
  #{yaml.chomp}
  ---

  ## About #{data[:title]}

  #{data[:about]}

  ## Founder's Journey

  #{data[:founder_journey]}

  ## Market Presence

  #{data[:market_presence]}
  CONTENT
end

# Main script
puts "=== Add New Brand (English Only) ==="
puts "This script creates the English version. Use AI to translate to RU/ZH."
puts

# Collect basic information
data = {}
data[:title] = prompt("Brand name")
data[:brand_slug] = prompt("Brand slug (no country code)", data[:title].downcase.gsub(' ', '-'))
data[:country_code] = prompt("Country code (e.g., ru, br, cn)")
data[:description] = prompt("Brief description (1-2 sentences)")
data[:founding_year] = prompt("Founding year").to_i
data[:website] = prompt("Website URL")

# Founders (with country code prefix)
puts "\nFounders (use country-code-name format, e.g., ru-alexei-sokolov)"
data[:founders] = prompt_list("Founder IDs")

# Taxonomy
puts "\nTaxonomy (use kebab-case slugs)"
data[:sectors] = prompt_list("Sectors")
data[:markets] = prompt_list("Markets")
data[:attributes] = prompt_list("Attributes (optional)")
data[:signals] = prompt_list("Signals (optional)")

# Location
puts "\nLocation"
data[:location_country] = data[:country_code]
data[:location_city] = prompt("City")
data[:location_lat] = prompt("Latitude").to_f
data[:location_lng] = prompt("Longitude").to_f

# Content sections
puts "\nContent (press Enter twice to finish each section)"
puts "About section:"
about_lines = []
while (line = gets) != "\n"
  about_lines << line.chomp
end
data[:about] = about_lines.join("\n")

puts "Founder's Journey:"
journey_lines = []
while (line = gets) != "\n"
  journey_lines << line.chomp
end
data[:founder_journey] = journey_lines.join("\n")

puts "Market Presence:"
presence_lines = []
while (line = gets) != "\n"
  presence_lines << line.chomp
end
data[:market_presence] = presence_lines.join("\n")

# Create English file only
puts "\nCreating brand file..."
create_brand_file(data)

puts "\nBrand created successfully!"
puts "Don't forget to:"
puts "1. Add images to /assets/images/brands/#{data[:country_code]}-#{data[:brand_slug]}/"
puts "2. Use AI to translate to Russian and Chinese"
puts "3. Run update_json.sh to update search indexes"
