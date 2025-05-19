// scripts/generate-russian-market-sector-pages.js
const fs = require('fs');
const path = require('path');
const yaml = require('js-yaml');

// Define languages and directories
const languages = ['en', 'ru', 'zh'];
const pagesDir = './pages';
const dataDir = './_data';

// Helper function to ensure directory exists
function ensureDirectoryExists(dirPath) {
  if (!fs.existsSync(dirPath)) {
    fs.mkdirSync(dirPath, { recursive: true });
  }
}

// Load JSON data from file
function loadJsonData(filename) {
  try {
    const filePath = path.join(dataDir, filename);
    const fileContents = fs.readFileSync(filePath, 'utf8');
    return JSON.parse(fileContents);
  } catch (error) {
    console.error(`Error loading ${filename}:`, error);
    return null;
  }
}

// Generate Russian market-sector pages
function generateRussianMarketSectorPages() {
  const marketSectorMap = loadJsonData('market_sector_map.json');
  if (!marketSectorMap) return;

  const russianSectors = marketSectorMap.market_sector_map.filter(mapping =>
    mapping.market === 'russia' && (!mapping.hasOwnProperty('featured') || mapping.featured === true)
  );

  console.log(`Found ${russianSectors.length} Russian sectors to generate pages for`);

  russianSectors.forEach(mapping => {
    languages.forEach(lang => {
      const dirPath = path.join(pagesDir, lang, 'discover', 'markets', mapping.market, 'sectors');
      ensureDirectoryExists(dirPath);

      const permalink = `/${lang}/discover/markets/${mapping.market}/sectors/${mapping.sector}/`;
      const filePath = path.join(dirPath, `${mapping.sector}.md`);

      // Check if this sector has a hero image
      const hasHeroImage = mapping.hasOwnProperty('hero_image') && mapping.hero_image;

      // Create sections array with conditional hero-image inclusion
      const sections = ['hero'];
      if (hasHeroImage) sections.push('hero-image');
      sections.push('overview', 'statistics', 'regions', 'related-brands', 'cross-navigation');

      const frontMatter = {
        layout: 'market-sector',
        lang: lang,
        title: mapping.translations[lang].title,
        subtitle: mapping.translations[lang].subtitle,
        permalink: permalink,
        market: mapping.market,
        sector: mapping.sector,
        sections: sections
      };

      // Add hero_image if present
      if (hasHeroImage) {
        frontMatter.hero_image = mapping.hero_image;
      }

      const content = `---\n${yaml.dump(frontMatter)}---\n`;

      fs.writeFileSync(filePath, content);
      console.log(`Generated: ${filePath}`);
    });
  });
}

// Main execution
console.log("Starting Russian market-sector page generation...");
generateRussianMarketSectorPages();
console.log("Russian market-sector page generation complete!");
