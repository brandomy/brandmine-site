// assets/js/styleguide.js

// Code copying functionality
function copyCode(button) {
    const codeBlock = button.closest('.styleguide-example-code').querySelector('code');
    const textToCopy = codeBlock.textContent;
    
    navigator.clipboard.writeText(textToCopy).then(function() {
      // Success feedback
      const originalText = button.textContent;
      button.textContent = 'Copied!';
      
      setTimeout(function() {
        button.textContent = originalText;
      }, 2000);
    }, function(err) {
      console.error('Could not copy text: ', err);
      button.textContent = 'Error';
    });
  }
  
  // Mobile navigation toggle for small screens
  document.addEventListener('DOMContentLoaded', function() {
    // Check if we're on a styleguide page
    if (document.querySelector('.styleguide-nav')) {
      // Create the toggle button if it doesn't exist
      if (!document.querySelector('.styleguide-nav-toggle')) {
        const navToggle = document.createElement('button');
        navToggle.className = 'styleguide-nav-toggle';
        navToggle.setAttribute('aria-label', 'Toggle navigation menu');
        navToggle.setAttribute('aria-expanded', 'false');
        navToggle.innerHTML = '<span></span><span></span><span></span>';
        
        const nav = document.querySelector('.styleguide-nav');
        if (nav.parentNode) {
          nav.parentNode.insertBefore(navToggle, nav);
        }
        
        // Add event listener
        navToggle.addEventListener('click', function() {
          nav.classList.toggle('is-open');
          navToggle.setAttribute('aria-expanded', 
            navToggle.getAttribute('aria-expanded') === 'true' ? 'false' : 'true'
          );
        });
        
        // Add styles for the toggle
        document.head.insertAdjacentHTML('beforeend', `
          <style>
            .styleguide-nav-toggle {
              display: none;
              position: fixed;
              top: 1rem;
              right: 1rem;
              z-index: 1000;
              background: var(--primary-600);
              border: none;
              border-radius: 0.25rem;
              padding: 0.5rem;
              cursor: pointer;
              width: 2.5rem;
              height: 2.5rem;
              flex-direction: column;
              justify-content: space-between;
              align-items: center;
            }
            
            .styleguide-nav-toggle span {
              display: block;
              height: 2px;
              width: 100%;
              background-color: white;
              transition: all 0.3s ease;
            }
            
            @media (max-width: 992px) {
              .styleguide-nav-toggle {
                display: flex;
              }
              
              .styleguide-nav {
                transform: translateX(-100%);
                transition: transform 0.3s ease;
              }
              
              .styleguide-nav.is-open {
                transform: translateX(0);
              }
            }
          </style>
        `);
      }
    }
  });