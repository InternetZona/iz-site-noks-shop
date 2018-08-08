require('@fortawesome/fontawesome');
require('@fortawesome/fontawesome-free-solid');
require('@fortawesome/fontawesome-free-regular');
require('@fortawesome/fontawesome-free-brands');

FontAwesomeConfig = {
  searchPseudoElements: true,
};

(function() {

  Array.from(document.querySelectorAll('#mobile-menu .collapsible-header')).map((elem) => {
    elem.onclick = function() {
      let icon = this.querySelector('[data-fa-i2svg]');

      icon
        .classList
        .toggle('fa-angle-down');

      icon
        .classList
        .toggle('fa-angle-right');
    }
  });

})();