# 2025-03-20 Brandmine MVP Strategy Journal: 90-Day Roadmap Development

## 1. Problem Statement

We needed to develop a comprehensive, practical strategy for Brandmine's 90-day MVP launch given significant resource constraints:

- Limited team of two people: Randal (technical, 8-12 hours/day) and Olya (sales/client management, 4 hours/day)
- Need to prioritize among many potential market sectors and features
- Technical implementation capabilities limited by Randal's learning curve
- Urgency to validate business model with paying customers within 90 days

The core challenge was creating a focused implementation plan that would:
- Target the right sectors and customer segments
- Leverage existing technical infrastructure (Jekyll, Airtable)
- Create a differentiated platform highlighting narrative-rich BRICS brands
- Generate early revenue to validate the business model
- Build toward Brandmine's long-term vision while remaining pragmatic about current constraints

## 2. Approach

We developed a multi-faceted strategy built around several key elements:

### Core Strategic Framework
- **OKR Methodology**: Organized the 90-day plan around Objectives and Key Results with specific tasks assigned to each team member
- **Phased Implementation**: Divided the 90 days into three phases (Foundation, Expansion, Conversion)
- **Sector Prioritization**: Focused on three priority sectors (Hotels & Resorts, Artisanal Spirits & Vodka, Gourmet Foods)
- **Customer Segmentation**: Targeted multi-property brands with demonstrated growth capability
- **Content-First Approach**: Emphasized thought leadership content to establish expertise
- **Social Media Strategy**: Leveraged content across multiple platforms for maximum visibility

### Key Strategic Filters
- **Founder-Led Focus**: Emphasized brands where founders maintain active leadership
- **Narrative Richness**: Prioritized brands with compelling stories beyond basic information
- **Growth Capability**: Created a verifiable growth indicator (multiple properties/locations)
- **Trilingual Implementation**: Simultaneous development in English, Russian and Chinese

### Technical Strategy
- **Jekyll + Airtable Foundation**: Utilized existing technical components rather than building new systems
- **MapLibre Integration**: Added geographic visualization as a key differentiator
- **Progressive Enhancement**: Started with static content and minimal interactivity, with plans to expand
- **Content Repurposing Workflow**: Created efficiency through structured content adaptation

## 3. Implementation Details

### Technical Implementation Architecture

The core technical architecture follows a static-site approach with database integration:

```
+----------------+      +-----------------+     +------------------+
| Airtable Base  |----->| Data Processing |---->| Jekyll Templates |
| (Brand Data)   |      | (Python Script) |     | (Static Site)    |
+----------------+      +-----------------+     +------------------+
       ^                                               |
       |                                               v
+----------------+                             +------------------+
| Data Entry     |                             | Public Website   |
| (Olya)         |                             | (brandmine.io)   |
+----------------+                             +------------------+
```

### Data Flow for MapLibre Integration

Key Python code for generating GeoJSON from Airtable data:

```python
import requests
import json
import os

# Pull data from Airtable
def get_airtable_data(base_id, table_name, api_key):
    """
    Get data from Airtable table
    
    Parameters:
    base_id (str): Airtable base ID
    table_name (str): Name of the table
    api_key (str): Airtable API key
    
    Returns:
    list: Records from Airtable
    """
    url = f"https://api.airtable.com/v0/{base_id}/{table_name}"
    headers = {
        "Authorization": f"Bearer {api_key}",
        "Content-Type": "application/json"
    }
    
    response = requests.get(url, headers=headers)
    return response.json()["records"]

# Generate GeoJSON for MapLibre
def create_geojson(records):
    """
    Convert Airtable records to GeoJSON
    
    Parameters:
    records (list): Records from Airtable with lat/long
    
    Returns:
    dict: GeoJSON object
    """
    features = []
    
    for record in records:
        # Skip records without coordinates
        if "Latitude" not in record["fields"] or "Longitude" not in record["fields"]:
            continue
            
        # Create GeoJSON feature
        feature = {
            "type": "Feature",
            "geometry": {
                "type": "Point",
                "coordinates": [
                    float(record["fields"]["Longitude"]),
                    float(record["fields"]["Latitude"])
                ]
            },
            "properties": record["fields"]
        }
        
        features.append(feature)
        
    # Create GeoJSON structure
    geojson = {
        "type": "FeatureCollection",
        "features": features
    }
    
    return geojson
```

### Content Repurposing Workflow

The content workflow follows a one-to-many model:

```
+----------------+
| Core Content   |
| (Blog Post)    |
+----------------+
        |
        v
+----------------+
| Content        |
| Adaptation     |
+----------------+
        |
        +-----------------+-----------------+-----------------+
        |                 |                 |                 |
        v                 v                 v                 v
+----------------+ +----------------+ +----------------+ +----------------+
| LinkedIn       | | X/Twitter      | | Instagram      | | VK/Telegram    |
| (Randal/Buffer)| | (Randal/Buffer)| | (Randal/Buffer)| | (Olya/Direct)  |
+----------------+ +----------------+ +----------------+ +----------------+
```

## 4. Decisions Made

### Critical Strategic Decisions

1. **Multi-Property Focus for Hotels & Resorts** 
   - **Decision**: Target only hotel brands with multiple properties (2+ locations)
   - **Rationale**: Multiple properties provide a clear, verifiable indicator of growth capability and brand maturity. This creates an efficient filter for client qualification without requiring extensive research to verify growth plans.

2. **Badge System Implementation**
   - **Decision**: Create a visual taxonomy of eight badges to highlight key brand attributes
   - **Rationale**: Badges create immediate visual recognition of important brand characteristics, enhance user experience, and create future monetization opportunities through verification services.

3. **Trilingual from Day One**
   - **Decision**: Implement all content in English, Russian, and Chinese simultaneously
   - **Rationale**: With Claude's translation capabilities and the team's language proficiency, we can present a truly international platform from the beginning while supporting Russia's "Pivot to the East" strategy.

4. **Four Initial Monetization Priorities**
   - **Decision**: Focus on Featured Brand Placement, Enhanced Profiles, Connection Facilitation, and Digital Brand Passports
   - **Rationale**: These four approaches require minimal technical complexity while creating immediate revenue potential and clear value for both brands and international partners.

5. **Social Media Integration Strategy**
   - **Decision**: Buffer for English channels (LinkedIn/X/Instagram), direct posting for Russian channels (VK/Telegram)
   - **Rationale**: Leverages each team member's strengths while maintaining consistent presence across platforms and reaching both Western and Russian audiences.

### Technical Implementation Decisions

1. **Jekyll Over Bubble.io for MVP**
   - **Decision**: Focus on Jekyll-based static site for MVP with Bubble.io as a future enhancement
   - **Rationale**: Maximizes existing progress (80% Jekyll completion), minimizes technical complexity, and creates a content foundation that can be enhanced later.

2. **MapLibre Integration with Jekyll**
   - **Decision**: Implement geographic visualization through MapLibre JavaScript library
   - **Rationale**: Creates a distinctive visual element enhancing brand narratives while remaining technically feasible with Jekyll.

3. **Content-First vs. Features-First**
   - **Decision**: Prioritize high-quality content over interactive features
   - **Rationale**: Content demonstrates Brandmine's value proposition more effectively than features and requires less technical complexity to implement.

## 5. Resources

### Strategic Framework Documents

1. **90-Day MVP Launch Roadmap**: Detailed implementation plan with objectives, key results, and tasks
   - Foundation Phase (Days 1-21)
   - Expansion Phase (Days 22-60)
   - Conversion Phase (Days 61-90)

2. **Strategic Dimensions**: Guiding principles document covering:
   - Sector prioritization logic
   - Founder-led brand focus
   - Value proposition strategy
   - Technical approach
   - Monetization framework

3. **Narrative Richness Scorecard**: Framework for evaluating brand storytelling potential across seven dimensions:
   - Founder Journey
   - Cultural Context
   - Place Connection
   - Historical Significance
   - Craft/Production Story
   - Visual Storytelling Potential
   - Innovation/Transformation Narrative

4. **Badge System Framework**: Visual taxonomy for brand attributes:
   - Founder-Led Badge
   - Heritage Certified Badge
   - Artisanal Excellence Badge
   - Regional Icon Badge
   - Innovation Leader Badge
   - Export Ready Badge
   - Cultural Ambassador Badge
   - Sustainability Pioneer Badge

5. **Monetization Opportunities**: Comprehensive monetization strategy from MVP to platform evolution:
   - Immediate opportunities (Featured Placement, Enhanced Profiles, etc.)
   - Near-term expansion (Badge Certification, Sector Reports, etc.)
   - Future evolution (Interactive Explorer, Marketplace Integration, etc.)

## 6. Insights & Learning

### Core Strategic Insights

1. **Verifiable Growth Indicators**: Using tangible evidence of growth capability (multiple locations) provides a more efficient qualification method than trying to assess potential growth readiness. This creates a simple filter that can be applied at scale.

2. **Narrative-Rich vs. Information-Rich**: The distinction between narrative-rich brands (with compelling stories) and merely information-rich brands (with basic business details) creates a clear differentiator for Brandmine. The narrative richness scorecard operationalizes this concept.

3. **Multilingual Content Efficiency**: Using Claude for translation and leveraging team language capabilities creates a cost-effective way to serve multiple markets simultaneously. This is particularly valuable given global platform challenges with Russian content due to sanctions.

4. **Founder-Led Advantage**: The prevalence of founder-led brands in BRICS countries represents a time-limited opportunity as these markets mature. This creates urgency to capture and highlight these stories before corporate consolidation.

5. **Location Intelligence as Differentiator**: Geographic visualization enhances narrative understanding and creates a distinctive technical feature that doesn't require advanced programming. This balances differentiation with implementation practicality.

### Technical Implementation Insights

1. **Static-First Approach**: Building a static Jekyll site first creates a solid content foundation while deferring more complex interactive features. This aligns with resource constraints while still delivering value.

2. **One-to-Many Content Strategy**: Creating core content once and adapting for multiple platforms maximizes impact while minimizing production time. This efficiency is critical given limited team resources.

3. **API-Based Integration**: Using Airtable's API to generate Jekyll content creates a flexible, maintainable architecture without requiring complex database systems. This matches the team's current technical capabilities.

4. **Badge System Implementation**: Visual badges provide immediate user value while creating future monetization opportunities through verification services. This dual purpose makes the badge system particularly valuable.

5. **Content Repurposing Workflow**: The structured approach to adapting content for different platforms (website → social) creates consistency while optimizing time investment.

## 7. Next Actions

### Immediate (Week 1) Tasks

For Randal:
1. Complete remaining Jekyll website implementation (finalizing the 20% still in progress)
2. Implement Airtable schema extensions for founder details and narrative elements
3. Create initial MapLibre integration for geographical visualization
4. Develop editorial calendar focused on founder narratives
5. Create first thought leadership article on "The Power of Founder-Led BRICS Brands"

For Olya:
1. Create prioritized list of boutique hotel groups (2-10 properties) with founder stories
2. Compile initial information on top 5 showcase brands per sector
3. Draft sector-specific value propositions highlighting founder narratives
4. Prepare first Russian-language content for VK and Telegram
5. Create engagement strategy for Russian platforms

### Open Questions and Considerations

1. **Monetization Testing**: What is the optimal timing for introducing paid features? Should we offer special founding member rates or begin with full pricing?

2. **Badge Verification Process**: How do we develop an efficient verification workflow that balances rigor with practicality given our limited resources?

3. **Chinese Content Strategy**: While we plan trilingual content from the beginning, should we prioritize certain content types for Chinese translation first?

4. **Wine Sector Integration**: How can we best leverage the existing wine dataset without diverting resources from Priority 1 sectors?

5. **Growth Metrics Definition**: What specific metrics will we use to evaluate progress and success of the MVP beyond simply acquiring 2-3 paying customers?

6. **Feature Prioritization After MVP**: Based on early client feedback, how will we prioritize technical feature development after the initial 90-day period?

7. **Scaling Content Production**: As the platform grows, how will we maintain content quality while increasing production volume with limited resources?

## Conclusion

The Brandmine MVP strategy provides a focused, practical approach to launching within 90 days despite significant resource constraints. By emphasizing narrative-rich, founder-led brands with verifiable growth capability across three priority sectors, we've created a clear path to market validation while building toward the broader vision of connecting BRICS brands with international partners.

The content-first approach leveraging Jekyll and Airtable creates a solid foundation that can be progressively enhanced based on user feedback and business validation. The badge system, narrative richness scorecard, and monetization framework provide structured tools for evaluating, featuring, and generating revenue from brands on the platform.

With disciplined execution of the 90-day roadmap, Brandmine should be able to secure initial paying customers, establish thought leadership position, and validate its business model while creating the foundation for future growth.
