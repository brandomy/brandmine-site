
// Search Results JavaScript
// Handles search functionality for the search results page

document.addEventListener('DOMContentLoaded', function() {
 const searchParams = new URLSearchParams(window.location.search);
 const query = searchParams.get('q');
 const resultsContainer = document.getElementById('search-results');

 // If no query parameter, show message and exit
 if (!query) {
   resultsContainer.innerHTML = '<p>Please enter a search term.</p>';
   return;
 }

 // Populate the search input with the current query
 document.getElementById('search-input').value = query;

 // Fetch and process search data
 fetch('/search.json')
   .then(response => {
     if (!response.ok) {
       throw new Error('Network response was not ok');
     }
     return response.text(); // Get raw text first for debugging
   })
   .then(text => {
     try {
       // Log raw JSON for debugging (first 500 characters)
       console.log("Raw JSON:", text.substring(0, 500) + "...");
       return JSON.parse(text);
     } catch (e) {
       console.error("JSON parse error:", e);
       throw new Error('JSON parsing failed: ' + e.message);
     }
   })
   .then(data => {
     // Filter results for current language (hardcoded to 'en' for now)
     const langData = data.filter(item => item.lang === 'en');

     // Filter for query matches in title and content
     const results = langData.filter(item => {
       const titleMatch = item.title && item.title.toLowerCase().includes(query.toLowerCase());
       const contentMatch = item.content && item.content.toLowerCase().includes(query.toLowerCase());
       return titleMatch || contentMatch;
     });

     // Handle no results case
     if (results.length === 0) {
       resultsContainer.innerHTML = '<p>No results found for "' + query + '".</p>';
       return;
     }

     // Build results HTML
     let resultsHtml = '<p>Found ' + results.length + ' results for "' + query + '":</p>';
     resultsHtml += '<ul class="search-results__list">';

     // Loop through results and build HTML
     for (let i = 0; i < results.length; i++) {
       const result = results[i];

       resultsHtml += '<li class="search-results__item search-results__item--' +
         (result.type || 'page') + '">' +
         '<a href="' + result.url + '" class="search-results__link">' +
         '<div class="search-results__type-badge">' + (result.type || 'page') + '</div>' +
         '<h3 class="search-results__title">' + (result.title || '') + '</h3>';

       // Add content excerpt if available
       if (result.content) {
         let excerpt = result.content;
         // Truncate long content to 150 characters
         if (excerpt.length > 150) {
           excerpt = excerpt.substring(0, 150) + '...';
         }
         resultsHtml += '<p class="search-results__excerpt">' + excerpt + '</p>';
       }

       resultsHtml += '</a></li>';
     }

     resultsHtml += '</ul>';
     resultsContainer.innerHTML = resultsHtml;
   })
   .catch(error => {
     // Handle any errors in the fetch/processing chain
     resultsContainer.innerHTML = '<p>Error loading search results: ' + error.message + '</p>';
     console.error("Search error:", error);
   });
});
