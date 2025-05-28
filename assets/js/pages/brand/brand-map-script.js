// Initialize map for location intelligence section

  document.addEventListener('DOMContentLoaded', function() {
    // Check if map element and coordinates exist
    const mapElement = document.getElementById('brandLocationMap');
    if (mapElement && mapElement.dataset.lat && mapElement.dataset.lng) {
      const lat = parseFloat(mapElement.dataset.lat);
      const lng = parseFloat(mapElement.dataset.lng);
      const brandName = mapElement.dataset.name;

      // Initialize map if MapLibre is available
      if (typeof maplibregl !== 'undefined') {
        const map = new maplibregl.Map({
          container: 'brandLocationMap',
          style: 'https://tiles.stadiamaps.com/styles/alidade_smooth.json?api_key={{ site.stadia_maps_api_key }}',
          center: [lng, lat],
          zoom: 7
        });

        // Add navigation controls
        map.addControl(new maplibregl.NavigationControl());

        // Add marker for brand location
        new maplibregl.Marker()
          .setLngLat([lng, lat])
          .setPopup(new maplibregl.Popup().setHTML(`<h3>${brandName}</h3>`))
          .addTo(map);
      } else {
        // Fallback if MapLibre is not available
        mapElement.innerHTML = `<div class="map-placeholder">
          <p>Map showing ${brandName} at coordinates ${lat}, ${lng}</p>
          <p>Interactive map loading...</p>
        </div>`;
      }
    }
  });
