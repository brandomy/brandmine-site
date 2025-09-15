// This file generates the map data from your markets.json data
// It should be run before the site build

const fs = require('fs');
const path = require('path');

// Define paths
const dataDir = path.join(__dirname, '../../../_data');
const outputDir = path.join(__dirname, '../../../assets/data');

// Ensure output directory exists
if (!fs.existsSync(outputDir)) {
  fs.mkdirSync(outputDir, { recursive: true });
  console.log(`Created output directory: ${outputDir}`);
}

try {
  // Read the markets data
  const marketsFile = path.join(dataDir, 'markets.json');
  console.log(`Reading markets data from: ${marketsFile}`);
  const marketsData = JSON.parse(fs.readFileSync(marketsFile, 'utf8'));

  // Create GeoJSON structure
  const geoJson = {
    type: 'FeatureCollection',
    features: []
  };

  // Process each market
  if (marketsData.markets && Array.isArray(marketsData.markets)) {
    console.log(`Found ${marketsData.markets.length} markets to process`);

    marketsData.markets.forEach(market => {
      if (market.coordinates && Array.isArray(market.coordinates) && market.coordinates.length >= 2) {
        // Create a GeoJSON feature
        const feature = {
          type: 'Feature',
          geometry: {
            type: 'Point',
            // GeoJSON uses [longitude, latitude] order
            coordinates: [market.coordinates[1], market.coordinates[0]]
          },
          properties: {
            id: market.id,
            name_en: market.name.en,
            name_ru: market.name.ru,
            name_zh: market.name.zh,
            type: market.type
          }
        };

        geoJson.features.push(feature);
      } else {
        console.log(`Skipping market "${market.id}" - missing or invalid coordinates`);
      }
    });
  } else {
    console.warn('No markets found or invalid markets data structure');
  }

  // Write the GeoJSON to a file
  const outputFile = path.join(outputDir, 'markets-geojson.json');
  fs.writeFileSync(outputFile, JSON.stringify(geoJson, null, 2));
  console.log(`Map data generated successfully! Written to: ${outputFile}`);
  console.log(`Generated ${geoJson.features.length} map features`);

} catch (error) {
  console.error('Error generating map data:', error);
  process.exit(1);
}
