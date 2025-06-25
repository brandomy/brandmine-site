/**
 * Brandmine Styleguide Navigation JavaScript
 * Handles interactive elements like the mobile navigation, code copying,
 * and responsive behavior adjustments.
 */
document.addEventListener('DOMContentLoaded', function() {
    // Initialize all interactive features
    initNavigation();
    initCodeCopy();
    highlightActiveNavigation();
    
    // Log initialization
    console.log('Styleguide JavaScript initialized');
  });
  
  /**
   * Sets up the mobile navigation system including toggle button,
   * overlay, and responsive behavior
   */
  function initNavigation() {
    // Get the key elements
    const nav = document.querySelector('.styleguide-nav');
    const navToggle = document.querySelector('.styleguide-nav-toggle');
    const overlay = document.querySelector('.styleguide-overlay');
    
    // Exit if navigation elements are not found
    if (!nav || !navToggle) {
      console.warn('Navigation elements not found, skipping initialization');
      return;
    }
    
    // Update toggle visibility based on viewport width
    function updateNavVisibility() {
      const isMobile = window.innerWidth < 992;
      
      // Handle visibility of the toggle button
      if (navToggle) {
        navToggle.style.display = isMobile ? 'block' : 'none';
      }
      
      // Reset navigation state when switching to desktop
      if (!isMobile && nav.classList.contains('is-open')) {
        nav.classList.remove('is-open');
        if (overlay) overlay.classList.remove('is-active');
        document.body.classList.remove('nav-open');
        navToggle.setAttribute('aria-expanded', 'false');
      }
    }
    
    // Toggle the navigation open/closed
    function toggleNavigation() {
      const isCurrentlyOpen = nav.classList.contains('is-open');
      
      // Toggle classes
      nav.classList.toggle('is-open');
      if (overlay) overlay.classList.toggle('is-active');
      document.body.classList.toggle('nav-open');
      
      // Update ARIA attributes for accessibility
      navToggle.setAttribute('aria-expanded', !isCurrentlyOpen);
    }
    
    // Close navigation when clicking the overlay
    function handleOverlayClick(event) {
      nav.classList.remove('is-open');
      if (overlay) overlay.classList.remove('is-active');
      document.body.classList.remove('nav-open');
      navToggle.setAttribute('aria-expanded', 'false');
    }
    
    // Handle keyboard escape key
    function handleEscapeKey(event) {
      if (event.key === 'Escape' && nav.classList.contains('is-open')) {
        nav.classList.remove('is-open');
        if (overlay) overlay.classList.remove('is-active');
        document.body.classList.remove('nav-open');
        navToggle.setAttribute('aria-expanded', 'false');
      }
    }
    
    // Attach event listeners
    navToggle.addEventListener('click', toggleNavigation);
    if (overlay) overlay.addEventListener('click', handleOverlayClick);
    window.addEventListener('resize', updateNavVisibility);
    document.addEventListener('keydown', handleEscapeKey);
    
    // Initial setup
    navToggle.setAttribute('aria-expanded', 'false');
    updateNavVisibility();
  }
  
  /**
   * Sets up code copying functionality for example blocks
   */
  function initCodeCopy() {
    const copyButtons = document.querySelectorAll('.copy-button');
    
    copyButtons.forEach(button => {
      button.addEventListener('click', function() {
        // Find the associated code element
        const codeBlock = this.closest('.example-code').querySelector('code');
        if (!codeBlock) return;
        
        // Get the text content
        const textToCopy = codeBlock.textContent;
        
        // Copy to clipboard
        navigator.clipboard.writeText(textToCopy)
          .then(() => {
            // Provide visual feedback
            const originalText = this.textContent;
            this.textContent = 'Copied!';
            
            // Reset after a delay
            setTimeout(() => {
              this.textContent = originalText;
            }, 2000);
          })
          .catch(err => {
            console.error('Failed to copy text:', err);
            this.textContent = 'Error';
          });
      });
    });
  }
  
  /**
   * Highlights the active navigation item based on current URL
   */
  function highlightActiveNavigation() {
    // Get the current path
    const currentPath = window.location.pathname;
    
    // Find all navigation links
    const navLinks = document.querySelectorAll('.styleguide-nav a');
    
    // Check each link against the current path
    navLinks.forEach(link => {
      const linkPath = link.getAttribute('href');
      
      // Check if the current path matches or starts with the link path
      // (excluding the base '/' path which would match everything)
      if (linkPath && linkPath !== '/' && (
          currentPath === linkPath ||
          currentPath.startsWith(linkPath + '/')
        )) {
        link.classList.add('active');
      }
    });
  }