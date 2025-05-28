/**
 * Simple Insights Search Functionality
 * Provides basic text search filtering for insights on the page
 */

class SimpleInsightsSearch {
  constructor() {
    this.searchInput = null;
    this.searchButton = null;
    this.insightCards = [];
    this.originalCards = [];
    
    this.init();
  }

  init() {
    // Wait for DOM to be ready
    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', () => this.setup());
    } else {
      this.setup();
    }
  }

  setup() {
    this.searchInput = document.getElementById('insights-search-input');
    this.searchButton = document.getElementById('insights-search-button');
    
    if (!this.searchInput) {
      console.warn('Insights search input not found');
      return;
    }

    // Get all insight cards on the page
    this.gatherInsightCards();
    
    // Set up event listeners
    this.setupEventListeners();
  }

  gatherInsightCards() {
    // Look for insight cards in the main grid
    const cardsContainers = [
      '.insights-all__grid',
      '.insights-featured__grid',
      '.insights-grid'
    ];
    
    this.insightCards = [];
    this.originalCards = [];
    
    cardsContainers.forEach(containerSelector => {
      const container = document.querySelector(containerSelector);
      if (container) {
        const cards = container.querySelectorAll('.insight-card, [class*="insight-card"]');
        cards.forEach(card => {
          this.insightCards.push({
            element: card,
            container: container,
            title: this.extractText(card, 'h3, .insight-card__title, .card__title'),
            excerpt: this.extractText(card, '.insight-card__excerpt, .card__excerpt, p'),
            category: this.extractText(card, '.insight-card__category, .card__category, .tag')
          });
        });
      }
    });
    
    // Store original state
    this.originalCards = [...this.insightCards];
    console.log(`Found ${this.insightCards.length} insight cards for search`);
  }

  extractText(card, selectors) {
    const selectorList = selectors.split(',').map(s => s.trim());
    
    for (const selector of selectorList) {
      const element = card.querySelector(selector);
      if (element) {
        return element.textContent.trim();
      }
    }
    
    return '';
  }

  setupEventListeners() {
    // Search on input with debouncing
    let searchTimeout;
    this.searchInput.addEventListener('input', (e) => {
      clearTimeout(searchTimeout);
      searchTimeout = setTimeout(() => {
        this.performSearch(e.target.value.trim());
      }, 300);
    });

    // Search on button click (disabled for now)
    if (this.searchButton) {
      // this.searchButton.addEventListener('click', () => {
      //   this.performSearch(this.searchInput.value.trim());
      // });
    }

    // Search on Enter key
    this.searchInput.addEventListener('keypress', (e) => {
      if (e.key === 'Enter') {
        e.preventDefault();
        this.performSearch(e.target.value.trim());
      }
    });

    // Clear search on Escape
    this.searchInput.addEventListener('keydown', (e) => {
      if (e.key === 'Escape') {
        this.clearSearch();
      }
    });
  }

  performSearch(searchTerm) {
    if (!searchTerm) {
      this.showAllCards();
      return;
    }

    const searchLower = searchTerm.toLowerCase();
    let visibleCount = 0;
    
    this.insightCards.forEach(cardData => {
      const searchableText = [
        cardData.title,
        cardData.excerpt,
        cardData.category
      ].join(' ').toLowerCase();
      
      const matches = searchableText.includes(searchLower);
      
      if (matches) {
        cardData.element.style.display = '';
        this.highlightSearchTerms(cardData.element, searchTerm);
        visibleCount++;
      } else {
        cardData.element.style.display = 'none';
      }
    });

    this.updateSearchResults(searchTerm, visibleCount);
  }

  highlightSearchTerms(cardElement, searchTerm) {
    // Simple highlighting - you could enhance this further
    const titleElement = cardElement.querySelector('h3, .insight-card__title, .card__title');
    if (titleElement && titleElement.dataset.originalText === undefined) {
      titleElement.dataset.originalText = titleElement.textContent;
    }
  }

  showAllCards() {
    this.insightCards.forEach(cardData => {
      cardData.element.style.display = '';
      this.removeHighlights(cardData.element);
    });
    
    this.clearSearchResults();
  }

  removeHighlights(cardElement) {
    const titleElement = cardElement.querySelector('h3, .insight-card__title, .card__title');
    if (titleElement && titleElement.dataset.originalText) {
      titleElement.textContent = titleElement.dataset.originalText;
      delete titleElement.dataset.originalText;
    }
  }

  updateSearchResults(searchTerm, count) {
    // Create or update search results indicator
    let resultsIndicator = document.getElementById('insights-search-results-indicator');
    
    if (!resultsIndicator) {
      resultsIndicator = document.createElement('div');
      resultsIndicator.id = 'insights-search-results-indicator';
      resultsIndicator.className = 'insights-search-results';
      
      // Insert after search box
      const searchContainer = this.searchInput.closest('.insights-all__search');
      if (searchContainer && searchContainer.parentNode) {
        searchContainer.parentNode.insertBefore(resultsIndicator, searchContainer.nextSibling);
      }
    }
    
    if (count === 0) {
      resultsIndicator.innerHTML = `
        <div class="search-no-results">
          <p>No insights found for "<strong>${this.escapeHtml(searchTerm)}</strong>"</p>
          <button onclick="window.simpleInsightsSearch.clearSearch()" class="btn btn--secondary btn--small">Clear Search</button>
        </div>
      `;
    } else {
      resultsIndicator.innerHTML = `
        <div class="search-results-count">
          Found <strong>${count}</strong> insight${count !== 1 ? 's' : ''} for "<strong>${this.escapeHtml(searchTerm)}</strong>"
          <button onclick="window.simpleInsightsSearch.clearSearch()" class="btn btn--secondary btn--small">Clear</button>
        </div>
      `;
    }
    
    resultsIndicator.style.display = 'block';
  }

  clearSearchResults() {
    const resultsIndicator = document.getElementById('insights-search-results-indicator');
    if (resultsIndicator) {
      resultsIndicator.style.display = 'none';
    }
  }

  clearSearch() {
    this.searchInput.value = '';
    this.showAllCards();
    this.searchInput.focus();
  }

  escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
  }

  // Public method to refresh cards (if new content is loaded dynamically)
  refresh() {
    this.gatherInsightCards();
  }
}

// Initialize and make globally available
document.addEventListener('DOMContentLoaded', () => {
  window.simpleInsightsSearch = new SimpleInsightsSearch();
});

// Also initialize if script loads after DOM is ready
if (document.readyState !== 'loading') {
  window.simpleInsightsSearch = new SimpleInsightsSearch();
}