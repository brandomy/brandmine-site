/**
 * Modal Component
 * ==========================================================================
 * Accessible modal dialog functionality
 * 
 * Features:
 * - Focus management
 * - Keyboard navigation (ESC to close)
 * - Backdrop click to close
 * - Scroll lock when open
 */

class ModalManager {
  constructor() {
    this.activeModal = null;
    this.previousFocus = null;
    this.init();
  }

  init() {
    // Set up event listeners
    document.addEventListener('keydown', this.handleKeyDown.bind(this));
    
    // Make modal functions globally available for onclick handlers
    window.openModal = this.open.bind(this);
    window.closeModal = this.close.bind(this);
    
    console.log('[Modal] Manager initialized');
  }

  /**
   * Open a modal by ID
   */
  open(modalId) {
    const modal = document.getElementById(modalId);
    if (!modal) {
      console.error(`[Modal] Modal with ID "${modalId}" not found`);
      return;
    }

    // Store previous focus for restoration
    this.previousFocus = document.activeElement;

    // Open the modal
    modal.classList.add('modal--open');
    modal.setAttribute('aria-hidden', 'false');
    this.activeModal = modal;

    // Focus management
    const firstFocusable = modal.querySelector(
      'button, input, select, textarea, [href], [tabindex]:not([tabindex="-1"])'
    );
    if (firstFocusable) {
      firstFocusable.focus();
    }

    // Prevent body scroll
    document.body.style.overflow = 'hidden';

    // Trap focus within modal
    this.trapFocus(modal);

    console.log(`[Modal] Opened modal: ${modalId}`);
  }

  /**
   * Close a modal by ID
   */
  close(modalId) {
    const modal = document.getElementById(modalId);
    if (!modal) return;

    // Close the modal
    modal.classList.remove('modal--open');
    modal.setAttribute('aria-hidden', 'true');
    this.activeModal = null;

    // Restore body scroll
    document.body.style.overflow = '';

    // Restore focus to previous element
    if (this.previousFocus && this.previousFocus.focus) {
      this.previousFocus.focus();
    }

    console.log(`[Modal] Closed modal: ${modalId}`);
  }

  /**
   * Close all open modals
   */
  closeAll() {
    const openModals = document.querySelectorAll('.modal.modal--open');
    openModals.forEach(modal => this.close(modal.id));
  }

  /**
   * Handle keyboard events
   */
  handleKeyDown(event) {
    // Close on Escape key
    if (event.key === 'Escape' && this.activeModal) {
      this.close(this.activeModal.id);
    }

    // Tab key focus trapping
    if (event.key === 'Tab' && this.activeModal) {
      this.handleTabKey(event);
    }
  }

  /**
   * Trap focus within the modal
   */
  trapFocus(modal) {
    const focusableElements = modal.querySelectorAll(
      'a[href], button, textarea, input, select, [tabindex]:not([tabindex="-1"])'
    );
    
    if (focusableElements.length === 0) return;

    const firstFocusable = focusableElements[0];
    const lastFocusable = focusableElements[focusableElements.length - 1];

    // Store for tab handling
    this.firstFocusable = firstFocusable;
    this.lastFocusable = lastFocusable;
  }

  /**
   * Handle tab key navigation
   */
  handleTabKey(event) {
    if (!this.firstFocusable || !this.lastFocusable) return;

    if (event.shiftKey) {
      // Shift + Tab
      if (document.activeElement === this.firstFocusable) {
        this.lastFocusable.focus();
        event.preventDefault();
      }
    } else {
      // Tab
      if (document.activeElement === this.lastFocusable) {
        this.firstFocusable.focus();
        event.preventDefault();
      }
    }
  }

  /**
   * Toggle modal state
   */
  toggle(modalId) {
    const modal = document.getElementById(modalId);
    if (!modal) return;

    if (modal.classList.contains('modal--open')) {
      this.close(modalId);
    } else {
      this.open(modalId);
    }
  }
}

// Initialize when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
  window.modalManager = new ModalManager();
});