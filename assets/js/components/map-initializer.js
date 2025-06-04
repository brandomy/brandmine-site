/**
 * Map Initializer Component
 * ==========================================================================
 * Handles initialization of MapLibre maps with dynamic data
 * 
 * Features:
 * - Lazy initialization when maps come into view
 * - Support for multiple map types (mini, full, markets)
 * - Error handling for missing MapLibre library
 * - Performance optimized with Intersection Observer
 */

class MapInitializer {
  constructor() {
    this.maps = new Map();
    this.apiKey = window.STADIA_MAPS_API_KEY || '';
    this.initialized = false;
    this.init();
  }

  init() {
    // Check if MapLibre is available
    if (typeof maplibregl === 'undefined') {
      console.warn('[MapInitializer] MapLibre GL JS not loaded');
      return;
    }

    // Find all map containers
    const mapContainers = document.querySelectorAll('[data-map-container]');
    if (mapContainers.length === 0) return;

    console.log(`[MapInitializer] Found ${mapContainers.length} map containers`);

    // Set up intersection observer for lazy loading
    if ('IntersectionObserver' in window) {
      const observer = new IntersectionObserver(
        (entries) => this.handleIntersection(entries),
        { rootMargin: '50px' }
      );

      mapContainers.forEach(container => observer.observe(container));
    } else {
      // Fallback: initialize all maps immediately
      mapContainers.forEach(container => this.initializeMap(container));
    }

    this.initialized = true;
  }

  /**
   * Handle intersection observer callbacks
   */
  handleIntersection(entries) {
    entries.forEach(entry => {
      if (entry.isIntersecting && !this.maps.has(entry.target.id)) {
        this.initializeMap(entry.target);
      }
    });
  }

  /**
   * Initialize a single map
   */
  initializeMap(container) {
    const config = this.parseMapConfig(container);
    if (!config) return;

    try {
      const map = new maplibregl.Map({
        container: container.id,
        style: `https://tiles.stadiamaps.com/styles/alidade_smooth.json?api_key=${this.apiKey}`,
        center: config.center,
        zoom: config.zoom,
        ...config.options
      });

      // Add navigation controls
      if (config.showControls) {
        map.addControl(new maplibregl.NavigationControl(), 'top-right');
      }

      // Add markers
      if (config.markers && config.markers.length > 0) {
        this.addMarkers(map, config.markers);
      }

      // Handle clustering for large datasets
      if (config.cluster && config.geojsonUrl) {
        this.setupClustering(map, config.geojsonUrl);
      }

      // Store map instance
      this.maps.set(container.id, map);

      // Dispatch custom event
      container.dispatchEvent(new CustomEvent('map:initialized', { 
        detail: { map, config } 
      }));

      console.log(`[MapInitializer] Initialized map: ${container.id}`);
    } catch (error) {
      console.error(`[MapInitializer] Failed to initialize map: ${container.id}`, error);
    }
  }

  /**
   * Parse map configuration from data attributes
   */
  parseMapConfig(container) {
    try {
      const config = {
        center: JSON.parse(container.dataset.mapCenter || '[0, 0]'),
        zoom: parseFloat(container.dataset.mapZoom || '8'),
        showControls: container.dataset.mapControls !== 'false',
        markers: [],
        options: {}
      };

      // Parse markers if present
      if (container.dataset.mapMarkers) {
        config.markers = JSON.parse(container.dataset.mapMarkers);
      }

      // Parse additional options
      if (container.dataset.mapOptions) {
        config.options = JSON.parse(container.dataset.mapOptions);
      }

      // Check for clustering
      config.cluster = container.dataset.mapCluster === 'true';
      config.geojsonUrl = container.dataset.mapGeojson;

      return config;
    } catch (error) {
      console.error('[MapInitializer] Invalid map configuration', error);
      return null;
    }
  }

  /**
   * Add markers to map
   */
  addMarkers(map, markers) {
    markers.forEach(markerData => {
      const marker = new maplibregl.Marker(markerData.options || {})
        .setLngLat(markerData.coordinates);

      // Add popup if provided
      if (markerData.popup) {
        const popup = new maplibregl.Popup({ offset: 25 })
          .setHTML(markerData.popup);
        marker.setPopup(popup);
      }

      marker.addTo(map);
    });
  }

  /**
   * Set up clustering for large datasets
   */
  setupClustering(map, geojsonUrl) {
    map.on('load', () => {
      // Add GeoJSON source
      map.addSource('brands', {
        type: 'geojson',
        data: geojsonUrl,
        cluster: true,
        clusterMaxZoom: 14,
        clusterRadius: 50
      });

      // Add cluster circles
      map.addLayer({
        id: 'clusters',
        type: 'circle',
        source: 'brands',
        filter: ['has', 'point_count'],
        paint: {
          'circle-color': [
            'step',
            ['get', 'point_count'],
            '#51bbd6',
            100,
            '#f1f075',
            750,
            '#f28cb1'
          ],
          'circle-radius': [
            'step',
            ['get', 'point_count'],
            20,
            100,
            30,
            750,
            40
          ]
        }
      });

      // Add cluster count labels
      map.addLayer({
        id: 'cluster-count',
        type: 'symbol',
        source: 'brands',
        filter: ['has', 'point_count'],
        layout: {
          'text-field': '{point_count_abbreviated}',
          'text-font': ['Open Sans Semibold'],
          'text-size': 12
        }
      });

      // Add unclustered points
      map.addLayer({
        id: 'unclustered-point',
        type: 'circle',
        source: 'brands',
        filter: ['!', ['has', 'point_count']],
        paint: {
          'circle-color': '#11b4da',
          'circle-radius': 6,
          'circle-stroke-width': 1,
          'circle-stroke-color': '#fff'
        }
      });

      // Handle click on clusters
      map.on('click', 'clusters', (e) => {
        const features = map.queryRenderedFeatures(e.point, {
          layers: ['clusters']
        });
        const clusterId = features[0].properties.cluster_id;
        map.getSource('brands').getClusterExpansionZoom(
          clusterId,
          (err, zoom) => {
            if (err) return;
            map.easeTo({
              center: features[0].geometry.coordinates,
              zoom: zoom
            });
          }
        );
      });

      // Handle click on points
      map.on('click', 'unclustered-point', (e) => {
        const coordinates = e.features[0].geometry.coordinates.slice();
        const properties = e.features[0].properties;
        
        new maplibregl.Popup()
          .setLngLat(coordinates)
          .setHTML(this.createPopupContent(properties))
          .addTo(map);
      });

      // Change cursor on hover
      map.on('mouseenter', 'clusters', () => {
        map.getCanvas().style.cursor = 'pointer';
      });
      map.on('mouseleave', 'clusters', () => {
        map.getCanvas().style.cursor = '';
      });
    });
  }

  /**
   * Create popup content from properties
   */
  createPopupContent(properties) {
    return `
      <div class="map-popup">
        <h3>${properties.name || 'Unknown'}</h3>
        ${properties.description ? `<p>${properties.description}</p>` : ''}
        ${properties.url ? `<a href="${properties.url}" class="btn btn--small">View Details</a>` : ''}
      </div>
    `;
  }

  /**
   * Get map instance by ID
   */
  getMap(containerId) {
    return this.maps.get(containerId);
  }

  /**
   * Destroy all maps
   */
  destroy() {
    this.maps.forEach((map, id) => {
      map.remove();
      console.log(`[MapInitializer] Destroyed map: ${id}`);
    });
    this.maps.clear();
  }
}

// Initialize when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
  window.mapInitializer = new MapInitializer();
});