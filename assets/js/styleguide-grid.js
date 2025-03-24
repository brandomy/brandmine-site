// Brandmine Design System JavaScript
// Handles interactive features for the styleguide

document.addEventListener('DOMContentLoaded', function() {
    // Mobile Navigation Toggle and Responsive Handling
    function setupMobileNavigation() {
        const nav = document.querySelector('.styleguide-nav');
        const navToggle = document.querySelector('.styleguide-nav-toggle');
        
        // Exit if navigation elements are not found
        if (!nav || !navToggle) return;

        // Ensure toggle visibility based on screen size
        function updateNavToggleVisibility() {
            const isMobile = window.innerWidth <= 992;
            navToggle.style.display = isMobile ? 'block' : 'none';
            
            // Reset navigation state on desktop
            if (!isMobile) {
                nav.classList.remove('is-open');
                document.body.classList.remove('nav-open');
            }
        }

        // Toggle navigation open/closed
        function toggleNavigation() {
            nav.classList.toggle('is-open');
            document.body.classList.toggle('nav-open');
            
            // Update accessibility attributes
            const isExpanded = navToggle.getAttribute('aria-expanded') === 'true';
            navToggle.setAttribute('aria-expanded', !isExpanded);
        }

        // Close navigation when clicking outside
        function handleOutsideClick(event) {
            const isNavOpen = nav.classList.contains('is-open');
            const isClickInsideNav = nav.contains(event.target);
            const isClickOnToggle = navToggle.contains(event.target);

            if (isNavOpen && !isClickInsideNav && !isClickOnToggle) {
                nav.classList.remove('is-open');
                document.body.classList.remove('nav-open');
                navToggle.setAttribute('aria-expanded', 'false');
            }
        }

        // Attach event listeners
        navToggle.addEventListener('click', toggleNavigation);
        document.addEventListener('click', handleOutsideClick);
        window.addEventListener('resize', updateNavToggleVisibility);

        // Initial setup
        updateNavToggleVisibility();
    }

    // Code Copying Functionality
    function setupCodeCopy() {
        const copyButtons = document.querySelectorAll('.styleguide-copy-button');
        
        copyButtons.forEach(button => {
            button.addEventListener('click', function() {
                const codeBlock = button.closest('.styleguide-example-code').querySelector('code');
                const textToCopy = codeBlock.textContent;
                
                navigator.clipboard.writeText(textToCopy).then(function() {
                    // Provide visual feedback on successful copy
                    const originalText = button.textContent;
                    button.textContent = 'Copied!';
                    
                    // Revert button text after 2 seconds
                    setTimeout(function() {
                        button.textContent = originalText;
                    }, 2000);
                }).catch(function(err) {
                    // Handle any errors during copying
                    console.error('Could not copy text: ', err);
                    button.textContent = 'Error';
                });
            });
        });
    }

    // Active Navigation Highlighting
    function highlightActiveNavigation() {
        const currentPath = window.location.pathname;
        const navLinks = document.querySelectorAll('.styleguide-nav a');

        navLinks.forEach(link => {
            if (link.getAttribute('href') === currentPath) {
                link.classList.add('active');
            }
        });
    }

    // Initialize all interactive features
    function init() {
        setupMobileNavigation();
        setupCodeCopy();
        highlightActiveNavigation();
    }

    // Run initialization
    init();
});