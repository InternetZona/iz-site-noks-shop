import Swiper from 'swiper';

(function () {

  Array.from(document.querySelectorAll('.swiper-content')).map((elem) => {

    if (elem.id === 'swiper-banner') {
      setTimeout(new Swiper('#' + elem.id, {
        loop: true,
        autoplay: {
          delay: 6000,
        },
        pagination: {
          el: '.swiper-pagination',
          hideOnClick: false,
          clickable: true,
        },
      }), 100);

    } else if (
      elem.id === 'swiper-blog' ||
      elem.id === 'swiper-testimonials' ||
      elem.id === 'swiper-related' ||
      elem.id === 'swiper-feed'
    ) {
      setTimeout(new Swiper('#' + elem.id, {
        autoplay: false,
        slidesPerView: 4,
        spaceBetween: 30,
        breakpoints: {
          480: {
            slidesPerView: 1,
            spaceBetween: 0,
          },
          768: {
            slidesPerView: 2,
            spaceBetween: 15,
          },
          992: {
            slidesPerView: 3,
          }
        },
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
        },
      }), 100);
    } else if (elem.id === 'swiper-portfolio') {
      setTimeout(new Swiper('#' + elem.id, {
        autoplay: false,
        slidesPerView: 5,
        spaceBetween: 30,
        breakpoints: {
          480: {
            slidesPerView: 1,
            spaceBetween: 0,
          },
          768: {
            slidesPerView: 3,
            spaceBetween: 15,
          },
          992: {
            slidesPerView: 3,
          }
        },
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
        },
      }), 100);
    } else if (
      elem.id === 'swiper-sales' ||
      elem.id === 'swiper-semi' ||
      elem.id == 'swiper-recomendation'
    ) {
      setTimeout(new Swiper('#' + elem.id, {
        autoplay: false,
        slidesPerView: 3,
        spaceBetween: 30,
        breakpoints: {
          480: {
            slidesPerView: 1,
            spaceBetween: 0,
          },
          768: {
            slidesPerView: 2,
            spaceBetween: 15,
          },
          992: {
            slidesPerView: 2,
          }
        },
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
        },
      }), 100);
    } else if ((-1 !== elem.id.indexOf('swiper-gallery')) ||
      (-1 !== elem.id.indexOf('swiper-catalog')) ||
      (-1 !== elem.id.indexOf('swiper-fasade')) ) {
      setTimeout(new Swiper('#' + elem.id, {
        autoplay: false,
        slidesPerView: 5,
        spaceBetween: 10,
        breakpoints: {
          480: {
            slidesPerView: 1,
            spaceBetween: 0,
          },
          768: {
            slidesPerView: 2,
            spaceBetween: 10,
          },
          992: {
            slidesPerView: 4,
            spaceBetween: 10,
          }
        },
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
        },
      }), 100);
    }
  });

  let galleryThumbs = null,
    galleryImages = null;

  Array.from(document.querySelectorAll('.swiper-gallery')).map((elem) => {
    if (elem.classList.contains('gallery-thumbs')) {

      setTimeout(function() {
        galleryThumbs = new Swiper(elem, {
          direction: 'vertical',
          spaceBetween: 10,
          slidesPerView: 4,
          touchRatio: 0.2,
          breakpoints: {
            992: {
              slidesPerView: 4,
              direction: 'horizontal',
              spaceBetween: 10,
            }
          },
          navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
          },
          on:{
            init: function() {
              this.slides[0].classList.add('gallery__thumb--active');
            },
            resize: function() {
              if (document.body.clientWidth < 993) {
                let el = this.el;
                el.classList.remove('swiper-container-vertical');
                el.classList.add('swiper-container-horizontal');
                el.removeAttribute('style');

                this.update();
              } else {
                let el = this.el;
                el.classList.remove('swiper-container-horizontal');
                el.classList.add('swiper-container-vertical');

                this.update();
                this.el.style.height =
                  this.el.closest('.product-gallery')
                    .querySelector('.gallery-images .swiper-slide img')
                    .height - 45 + 'px';
              }
            },
            click: function(event) {
              let currentSlideIndex = this.clickedIndex;

              if (typeof(currentSlideIndex) !== 'undefined') {
                galleryImages.slideTo(currentSlideIndex);

                let currentSlide = this.clickedSlide;
                let slides = this.slides;

                for (let i = 0; i < slides.length; i++) {
                  if (slides[i].classList.contains('gallery__thumb--active')) {
                    slides[i].classList.remove('gallery__thumb--active');
                    i = slides.length;
                  }
                }

                currentSlide.classList.add('gallery__thumb--active');
              }
            }
          }
        });
      }, 100);

    } else if (elem.classList.contains('gallery-images')) {
      setTimeout(function() {
        galleryImages = new Swiper(elem, {
          effect: 'fade',
          allowTouchMove: false,
        }, 100);
      });
    }
  });

})();