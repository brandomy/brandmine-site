// Custom Forms JavaScript
// Handles custom contact form and newsletter form functionality

// Initialize custom contact form
function initializeCustomContactForm(formId) {
  const form = document.getElementById(formId);
  if (!form) return;

  const submitButton = form.querySelector('.form-submit');
  const submitText = submitButton.querySelector('.submit-text');
  const submitLoading = submitButton.querySelector('.submit-loading');
  const successMessage = document.getElementById(formId + '-success');
  const errorMessage = document.getElementById(formId + '-error');

  // Form validation
  function validateField(field) {
    const fieldContainer = field.closest('.form-field');
    const message = fieldContainer.querySelector('.form-message');
    let isValid = true;
    let errorText = '';

    // Remove existing error state
    fieldContainer.classList.remove('form-field--error');
    
    if (field.hasAttribute('required') && !field.value.trim()) {
      isValid = false;
      errorText = 'This field is required';
    } else if (field.type === 'email' && field.value) {
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailRegex.test(field.value)) {
        isValid = false;
        errorText = 'Please enter a valid email address';
      }
    } else if (field.type === 'tel' && field.value) {
      const phoneRegex = /^[\+]?[0-9\s\-\(\)]{10,}$/;
      if (!phoneRegex.test(field.value)) {
        isValid = false;
        errorText = 'Please enter a valid phone number';
      }
    }

    if (!isValid) {
      fieldContainer.classList.add('form-field--error');
      message.textContent = errorText;
      message.style.display = 'block';
    } else {
      message.style.display = 'none';
    }

    return isValid;
  }

  // Validate all fields
  function validateForm() {
    const fields = form.querySelectorAll('input[required], select[required], textarea[required]');
    let isValid = true;

    fields.forEach(field => {
      if (!validateField(field)) {
        isValid = false;
      }
    });

    // Check consent checkbox
    const consentField = form.querySelector('input[name="consent"]');
    if (consentField && !consentField.checked) {
      const fieldContainer = consentField.closest('.form-field');
      const message = fieldContainer.querySelector('.form-message');
      fieldContainer.classList.add('form-field--error');
      message.textContent = 'You must agree to the privacy policy';
      message.style.display = 'block';
      isValid = false;
    }

    return isValid;
  }

  // Real-time validation
  form.addEventListener('blur', function(e) {
    if (e.target.matches('input, select, textarea')) {
      validateField(e.target);
    }
  }, true);

  // Form submission
  form.addEventListener('submit', function(e) {
    e.preventDefault();
    
    if (!validateForm()) {
      return;
    }

    // Show loading state
    form.classList.add('custom-contact-form--loading');
    submitText.style.display = 'none';
    submitLoading.style.display = 'flex';

    // Collect form data
    const formData = new FormData(form);
    const data = {};
    for (let [key, value] of formData.entries()) {
      data[key] = value;
    }

    // Simulate form submission (replace with actual endpoint)
    setTimeout(() => {
      // Hide loading state
      form.classList.remove('custom-contact-form--loading');
      submitText.style.display = 'inline';
      submitLoading.style.display = 'none';

      // Show success message
      form.style.display = 'none';
      successMessage.style.display = 'block';

      // Log data for development (remove in production)
      console.log('Contact form submitted:', data);
      
      // Here you would typically send data to your server:
      // submitToServer(data);
    }, 2000);
  });
}

// Initialize custom newsletter form
function initializeCustomNewsletter(formId) {
  const form = document.getElementById(formId);
  if (!form) return;

  const submitButton = form.querySelector('.newsletter-button');
  const submitText = submitButton.querySelector('.submit-text');
  const submitLoading = submitButton.querySelector('.submit-loading');
  const successMessage = document.getElementById(formId + '-success');
  const errorMessage = document.getElementById(formId + '-error');

  // Email validation
  function validateEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
  }

  // Show field error
  function showFieldError(field, message) {
    const fieldContainer = field.closest('.newsletter-field');
    const messageEl = fieldContainer.querySelector('.newsletter-message');
    fieldContainer.classList.add('newsletter-field--error');
    messageEl.textContent = message;
    messageEl.style.display = 'block';
  }

  // Clear field error
  function clearFieldError(field) {
    const fieldContainer = field.closest('.newsletter-field');
    const messageEl = fieldContainer.querySelector('.newsletter-message');
    fieldContainer.classList.remove('newsletter-field--error');
    messageEl.style.display = 'none';
  }

  // Real-time validation
  form.addEventListener('input', function(e) {
    if (e.target.type === 'email') {
      clearFieldError(e.target);
    }
  });

  // Form submission
  form.addEventListener('submit', function(e) {
    e.preventDefault();
    
    const emailField = form.querySelector('input[name="email"]');
    const email = emailField.value.trim();

    // Clear previous errors
    clearFieldError(emailField);
    errorMessage.style.display = 'none';

    // Validate email
    if (!email) {
      showFieldError(emailField, 'Email address is required');
      return;
    }

    if (!validateEmail(email)) {
      showFieldError(emailField, 'Please enter a valid email address');
      return;
    }

    // Show loading state
    form.classList.add('custom-newsletter-form--loading');
    submitButton.disabled = true;
    if (submitText) submitText.style.display = 'none';
    if (submitLoading) submitLoading.style.display = 'flex';

    // Collect form data
    const formData = new FormData(form);
    const data = {};
    for (let [key, value] of formData.entries()) {
      data[key] = value;
    }

    // Simulate form submission (replace with actual endpoint)
    setTimeout(() => {
      // Hide loading state
      form.classList.remove('custom-newsletter-form--loading');
      submitButton.disabled = false;
      if (submitText) submitText.style.display = 'inline';
      if (submitLoading) submitLoading.style.display = 'none';

      // Show success message
      form.style.display = 'none';
      successMessage.style.display = 'block';

      // Log data for development (remove in production)
      console.log('Newsletter subscription:', data);
      
      // Here you would typically send data to your server:
      // submitToNewsletterService(data);
    }, 1500);
  });
}

// Auto-initialize forms when DOM is ready
document.addEventListener('DOMContentLoaded', function() {
  // Find and initialize custom contact forms
  const contactForms = document.querySelectorAll('[data-custom-form="true"]');
  contactForms.forEach(form => {
    if (form.id) {
      initializeCustomContactForm(form.id);
    }
  });

  // Find and initialize newsletter forms
  const newsletterForms = document.querySelectorAll('[data-newsletter-form="true"]');
  newsletterForms.forEach(form => {
    if (form.id) {
      initializeCustomNewsletter(form.id);
    }
  });
});

// Export functions for manual initialization
if (typeof window !== 'undefined') {
  window.initializeCustomContactForm = initializeCustomContactForm;
  window.initializeCustomNewsletter = initializeCustomNewsletter;
}