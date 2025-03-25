fetch('/brands-data.json')
  .then(response => response.json())
  .then(data => {
    initializeSearch(data);
  });

function initializeSearch(data) {
  const searchInput = document.querySelector("#search");
  searchInput.addEventListener("input", function() {
    filterResults(data, searchInput.value);
  });
}

function filterResults(data, query) {
  const filtered = data.brands.filter(brand =>
    brand.name.toLowerCase().includes(query.toLowerCase())
  );
  displayResults(filtered);
}

function displayResults(results) {
  const container = document.querySelector("#results-container");
  container.innerHTML = results.map(brand => `
    <div class="brand-card">
      <h3>${brand.name}</h3>
      <p>${brand.sector}, ${brand.country}</p>
    </div>
  `).join('');
}