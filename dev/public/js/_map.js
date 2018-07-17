(function() {
  let maps = document.querySelectorAll('.map');

  if (maps.length> 0) {
    let script = document.createElement('script');

    script.src = "https://api-maps.yandex.ru/2.1/?lang=ru_RU";
    script.async = true;
    
    script.onload = function() {
      
      ymaps.ready(function(){
        
        let master = new ymaps.Map("map-master", {
            center: [55.781839, 37.581987],
            zoom: 14,
            controls: ['zoomControl'],
          }),
          
          placemarkMaster = new ymaps.Placemark(master.getCenter());

        master.behaviors.disable('scrollZoom');
        master.behaviors.disable('multiTouch');

        master.geoObjects
          .add(placemarkMaster);

        let branch = new ymaps.Map("map-branch", {
            center: [55.660546, 37.246317],
            zoom: 14,
            controls: ['zoomControl'],
          }),

          placemarkBranch = new ymaps.Placemark(branch.getCenter());

        branch.behaviors.disable('scrollZoom');
        branch.behaviors.disable('multiTouch');

        branch.geoObjects
          .add(placemarkBranch);
      });
    }

    document.body.appendChild(script);
  }
})();