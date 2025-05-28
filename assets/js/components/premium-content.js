document.addEventListener('DOMContentLoaded', function() {
    // Check if user has premium access
    const hasPremiumAccess = localStorage.getItem('premiumAccess') === 'true';
    
    // Find all premium content elements
    const premiumElements = document.querySelectorAll('.premium-content');
    const premiumFilters = document.querySelectorAll('.premium-filter');
    
    // Handle premium content visibility
    function handlePremiumContent() {
      premiumElements.forEach(element => {
        if (hasPremiumAccess) {
          element.classList.remove('content-locked');
        } else {
          // Add lock overlay
          element.classList.add('content-locked');
          
          // Create and add premium notice if it doesn't exist
          if (!element.querySelector('.premium-overlay')) {
            const overlay = document.createElement('div');
            overlay.className = 'premium-overlay';
            
            const currentLang = document.documentElement.lang || 'en';
            const messages = {
              en: {
                title: 'Premium Content',
                description: 'This content is available to premium users only.',
                button: 'Upgrade Now'
              },
              ru: {
                title: 'Премиум контент',
                description: 'Этот контент доступен только премиум-пользователям.',
                button: 'Обновить сейчас'
              },
              zh: {
                title: '高级内容',
                description: '此内容仅适用于高级用户。',
                button: '立即升级'
              }
            };
            
            const msg = messages[currentLang];
            
            overlay.innerHTML = `
              <h3>${msg.title}</h3>
              <p>${msg.description}</p>
              <button class="btn-primary upgrade-button">${msg.button}</button>
            `;
            
            element.appendChild(overlay);
            
            // Add event listener to the upgrade button
            const upgradeButton = overlay.querySelector('.upgrade-button');
            upgradeButton.addEventListener('click', function() {
              // For MVP, just simulate the upgrade
              alert('This would normally redirect to the upgrade page. For demo purposes, we will grant you temporary premium access.');
              localStorage.setItem('premiumAccess', 'true');
              handlePremiumContent();
            });
          }
        }
      });
      
      // Handle premium filters
      premiumFilters.forEach(filter => {
        const checkboxes = filter.querySelectorAll('input[type="checkbox"]');
        const notice = filter.querySelector('.premium-notice');
        
        if (hasPremiumAccess) {
          checkboxes.forEach(checkbox => {
            checkbox.disabled = false;
          });
          if (notice) {
            notice.style.display = 'none';
          }
        } else {
          checkboxes.forEach(checkbox => {
            checkbox.disabled = true;
          });
          if (notice) {
            notice.style.display = 'block';
          }
        }
      });
    }
    
    // Initialize premium content handling
    handlePremiumContent();
    
    // Add premium access toggle for testing (remove in production)
    if (document.querySelector('.debug-controls')) {
      const toggleButton = document.createElement('button');
      toggleButton.className = 'btn-secondary';
      toggleButton.textContent = hasPremiumAccess ? 'Disable Premium (Debug)' : 'Enable Premium (Debug)';
      toggleButton.addEventListener('click', function() {
        localStorage.setItem('premiumAccess', (!hasPremiumAccess).toString());
        location.reload();
      });
      document.querySelector('.debug-controls').appendChild(toggleButton);
    }
  });
  