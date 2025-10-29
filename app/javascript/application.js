// Configure your import map in config/importmap.rb
import "@hotwired/turbo-rails"
import "controllers"

// Cart functionality
document.addEventListener('turbo:load', () => {
  const cartButton = document.getElementById('cart-button');
  const cartOffcanvas = document.getElementById('cartOffcanvas');
  
  if (cartButton && cartOffcanvas) {
    cartButton.addEventListener('click', (e) => {
      e.preventDefault();
      const bsOffcanvas = new bootstrap.Offcanvas(cartOffcanvas);
      bsOffcanvas.show();
    });
  }

  // Handle cart item quantity updates
  document.querySelectorAll('.quantity-control').forEach(control => {
    control.addEventListener('change', (e) => {
      const form = e.target.closest('form');
      if (form) {
        form.requestSubmit();
      }
    });
  });
});