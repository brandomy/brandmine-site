// assets/js/nav.js
function toggleMobile() {
    const menu = document.getElementById("mobileMenu");
    if (menu) {
      menu.classList.toggle("show");
    }
  }

  function toggleSubMenu() {
    const sub = document.getElementById("subMenu");
    if (sub) {
      sub.classList.toggle("show");
    }
  }