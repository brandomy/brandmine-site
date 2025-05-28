/**
 * Market Map initialization
 * Displays all markets on an interactive map with clustering and popups.
 * Uses MapLibre with the Stadia Maps tiles.
 */
document.addEventListener('DOMContentLoaded', function() {
  // Only initialize if map container exists and configuration is set
  const mapContainer = document.getElementById('marketsMap');
  const config = window.BrandmineMapConfig;

  if (!mapContainer || !config || typeof maplibregl === 'undefined') {
    console.error('Map container not found, configuration missing, or MapLibre not loaded');
    return;
  }

  // Initialize the MapLibre map
  const map = new maplibregl.Map({
    container: 'marketsMap',
    style: 'https://tiles.stadiamaps.com/styles/alidade_smooth.json?api_key=' + config.stadiaApiKey,
    center: [20, 10], // Default center
    zoom: 2 // Default zoom level
  });

  // Add navigation controls
  map.addControl(new maplibregl.NavigationControl());

  // Load the GeoJSON data
  fetch(config.geoJsonUrl)
    .then(response => response.json())
    .then(data => {
      // Handle map initialization after data is loaded
      map.on('load', function() {
        // Add the data source
        map.addSource('markets', {
          type: 'geojson',
          data: data,
          cluster: true,
          clusterMaxZoom: 14,
          clusterRadius: 50
        });

        // Add clusters layer
        map.addLayer({
          id: 'clusters',
          type: 'circle',
          source: 'markets',
          filter: ['has', 'point_count'],
          paint: {
            'circle-color': [
              'step',
              ['get', 'point_count'],
              '#7EB0D5',  // Small clusters
              10,
              '#BFD3E6',  // Medium clusters
              30,
              '#FDAE61'   // Large clusters
            ],
            'circle-radius': [
              'step',
              ['get', 'point_count'],
              15,  // Small clusters
              10,
              20,  // Medium clusters
              30,
              25   // Large clusters
            ]
          }
        });

        // Add cluster count labels
        map.addLayer({
          id: 'cluster-count',
          type: 'symbol',
          source: 'markets',
          filter: ['has', 'point_count'],
          layout: {
            'text-field': '{point_count_abbreviated}',
            'text-font': ['Open Sans Bold'],
            'text-size': 12
          },
          paint: {
            'text-color': '#ffffff'
          }
        });

        // Add unclustered market points
        map.addLayer({
          id: 'unclustered-point',
          type: 'circle',
          source: 'markets',
          filter: ['!', ['has', 'point_count']],
          paint: {
            'circle-color': '#0EA5E9',
            'circle-radius': 8,
            'circle-stroke-width': 1,
            'circle-stroke-color': '#fff'
          }
        });

        // Handle cluster clicks to zoom
        map.on('click', 'clusters', function(e) {
          const features = map.queryRenderedFeatures(e.point, { layers: ['clusters'] });
          const clusterId = features[0].properties.cluster_id;

          map.getSource('markets').getClusterExpansionZoom(clusterId, function(err, zoom) {
            if (err) return;

            map.easeTo({
              center: features[0].geometry.coordinates,
              zoom: zoom
            });
          });
        });

        // Add popup on market point click
        map.on('click', 'unclustered-point', function(e) {
          const props = e.features[0].properties;
          const coordinates = e.features[0].geometry.coordinates.slice();
          const name = props['name_' + config.currentLang] || props.name;

          // Ensure popup appears over the point
          while (Math.abs(e.lngLat.lng - coordinates[0]) > 180) {
            coordinates[0] += e.lngLat.lng > coordinates[0] ? 360 : -360;
          }

          // Create and add popup
          new maplibregl.Popup()
            .setLngLat(coordinates)
            .setHTML(`
              <div class="map-popup">
                <h3 class="map-popup__title">${name}</h3>
                <a href="${config.baseUrl}/${config.currentLang}/discover/markets/${props.slug}/" class="map-popup__link">
                  ${config.exploreText}
                </a>
              </div>
            `)
            .addTo(map);
        });

        // Change cursor on hover
        map.on('mouseenter', 'clusters', function() {
          map.getCanvas().style.cursor = 'pointer';
        });

        map.on('mouseleave', 'clusters', function() {
          map.getCanvas().style.cursor = '';
        });

        map.on('mouseenter', 'unclustered-point', function() {
          map.getCanvas().style.cursor = 'pointer';
        });

        map.on('mouseleave', 'unclustered-point', function() {
          map.getCanvas().style.cursor = '';
        });
      });
    })
    .catch(error => {
      console.error('Error loading GeoJSON data:', error);
      document.querySelector('.markets__map-loading').textContent = 'Error loading map data';
    });
});
