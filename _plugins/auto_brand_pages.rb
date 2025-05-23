# Auto-generate pages for Level 0 brands from JSON data
# This plugin creates pages for basic brands without requiring individual markdown files

Jekyll::Hooks.register :site, :pre_render do |site|
  # Load brands from JSON
  brands_file = File.join(site.source, '_data', 'brands.json')
  
  if File.exist?(brands_file)
    brands_data = JSON.parse(File.read(brands_file))
    
    # Filter for Level 0 brands (basic data only)
    level_0_brands = brands_data.select { |brand| brand['data_level'] == 0 }
    
    level_0_brands.each do |brand_data|
      ['en', 'ru', 'zh'].each do |lang|
        # Create a page object for each Level 0 brand
        page = Jekyll::Page.new(site, site.source, '', "brand-#{brand_data['id']}-#{lang}.html")
        
        # Set page data
        page.data['layout'] = 'brand-basic'
        page.data['lang'] = lang
        page.data['permalink'] = "/#{lang}/brands/#{brand_data['id']}/"
        page.data['title'] = brand_data['name'][lang] || brand_data['name']['en']
        page.data['name'] = brand_data['name'][lang] || brand_data['name']['en']
        page.data['description'] = brand_data['description'][lang] || brand_data['description']['en']
        page.data['founding_year'] = brand_data['founding_year']
        page.data['website'] = brand_data['website']
        page.data['sectors'] = brand_data['sectors'] || []
        page.data['markets'] = brand_data['markets'] || []
        page.data['attributes'] = brand_data['attributes'] || []
        page.data['signals'] = brand_data['signals'] || []
        page.data['location'] = brand_data['location'] || {}
        page.data['featured'] = brand_data['featured'] || false
        page.data['data_level'] = brand_data['data_level']
        page.data['id'] = brand_data['id']
        page.data['ref'] = brand_data['id'] # For language switching
        
        # SEO data
        page.data['seo'] = {
          'title' => "#{brand_data['name'][lang] || brand_data['name']['en']} - Brandmine",
          'description' => brand_data['description'][lang] || brand_data['description']['en'],
          'type' => 'organization'
        }
        
        # Set empty content (layout handles everything)
        page.content = ''
        
        # Add to site pages
        site.pages << page
        
        # Also add to brands collection for search/filtering
        unless site.collections['brands']
          site.collections['brands'] = Jekyll::Collection.new(site, 'brands')
        end
        
        # Create a document for the collection
        doc_path = "_brands/#{lang}/#{brand_data['id']}.md"
        doc = Jekyll::Document.new(doc_path, {
          site: site,
          collection: site.collections['brands']
        })
        doc.data = page.data.dup
        doc.content = page.content
        
        site.collections['brands'].docs << doc
      end
    end
    
    puts "✅ Auto-generated #{level_0_brands.length * 3} basic brand pages"
  end
end