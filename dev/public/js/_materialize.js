require('materialize-css');
const Plyr = require('plyr');

(function() {

  let config = {};

  Array.from(document.querySelectorAll('.modal')).map((elem) => {

    let config = {};

    switch (elem.id) {
      case 'modal-testimonial-video':
        let player = new Plyr('#testimonial-player', {
          autoplay: true,
          settings: [],
        });

        config = {
          onOpenStart: function() {
            let trigger = this._openingTrigger;
            player.source = {
              type: 'video',
              sources: [
                {
                  src: trigger.dataset.testimonialVideo,
                  provider: 'youtube'
                }
              ]
            };
          },
          onCloseStart: function() {
            player.stop();
          }
        };
        break;
      case 'modal-testimonial-text':
        config = {
          onOpenStart: function() {
            let trigger = this._openingTrigger,
              content = document.createElement('p'),
              avatar = trigger.parentElement.querySelector('.collection').cloneNode(true);

            content.innerText = testimonialsList[trigger.dataset.testimonialId].text;

            this.el.querySelector('.modal-content .testimonial-text').appendChild(content);
            this.el.querySelector('.modal-content .testimonial-avatar').appendChild(avatar);
          },
          onCloseEnd: function() {
            this.el.querySelector('.modal-content .testimonial-text').innerHTML = "";
            this.el.querySelector('.modal-content .testimonial-avatar').innerHTML = "";
          }
        };
        break;
      default:
    }

    M.Modal.init(elem, config);

  });

  Array.from(document.querySelectorAll('.tabs')).map((elem) => {
    let options = {};

    M.Tabs.init(elem, options);
  });

  Array.from(document.querySelectorAll('.sidenav')).map((elem) => {

    let closeBtn = elem.querySelector('.sidenav__close');

    closeBtn.addEventListener('click', function(e) {
      e.preventDefault();

      let instance = M.Sidenav.getInstance(this.closest('.sidenav'));

      instance.close();
    });

    M.Sidenav.init(elem, {});

  });

  Array.from(document.querySelectorAll('select')).map((elem) => {
    M.FormSelect.init(elem);
  });

  let collapsible = document.querySelectorAll('.collapsible');

  if (collapsible !== null) {
    M.Collapsible.init(collapsible, {});
  }

  Array.from(document.querySelectorAll('.dropdown-trigger')).map((elem) => {
    let config = {};

    if (elem.classList.contains('dd-panel')) {
      config = {
        constrainWidth: false,
        coverTrigger: false,
        hover: (window.innerWidth > 1140),
        onOpenStart: function() {
          this.el.classList.add('open');
        },
        onCloseStart: function() {
          this.el.classList.remove('open');
        }
      }

      elem.addEventListener('click', function(event) {
        event.preventDefault();
        if (window.outerWidth > 992) {
          this.click();
        }
      });
    }

    M.Dropdown.init(elem, config);
  });
})();