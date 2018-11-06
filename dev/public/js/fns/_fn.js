const jQuery = require('jquery');
const Inputmask = require("inputmask");

require("jquery.cookie");
require("jquery-validation");
require("jquery-validation/dist/additional-methods");

jQuery(function($) {

  let $filterControl = $('.filter__control');

  if ($filterControl.length > 0) {

    $filterControl.on('change', function(e) {
      let $this = $(this),
        $form = $this.closest('form'),
        urlParams = [];

      if (
        ($form.attr('id') === 'portfolio-controller') ||
        ($form.attr('id') === 'list-controller')
      ) {

        $form.submit();

      } else {

        $form.on('click', function() {
          let $this = $(this);

          $this.find('.filter__popup.open').removeClass('open');
        });

        $.each($form.find('select'), function() {
          let $this = $(this),
            value = $this.prop('value') || '';

          if ('' !== value) {
            urlParams.push({
              key: $this.attr('name'),
              value: value,
            });
          }
        });

        let query = urlParams.map(function(elem){
          return encodeURIComponent(elem.key) + '=' + elem.value;
        }).join('&');

        let url = getQueryUrl(query);

        if (location.href !== url) {

          if ($this.hasClass('filter__control--sorting')) {
            location.href = url;
          } else {

            let setup = Array({
              key: 'where[template]',
              value: $form.data('tpl'),
            },{
              key: 'parent',
              value: $form.data('catalog'),
            },{
              key: 'action',
              value: 'web/catalog/getdata',
            }).map(function(elem){
              return encodeURIComponent(elem.key) + '=' + elem.value;
            }).join('&');


            $.ajax({
              url: 'assets/components/modcatalog/connectors/connector.php',
              data: query + '&' + setup,
              method: 'get',
              beforeSend: function() {
                let tpl = '<div class="filter__popup">Поиск товаров ...</div>',
                  $instance = $this.closest('.select-wrapper').find('.filter__popup');

                if ($instance.length > 0) {
                  $instance.html('Поиск товаров ...');
                } else {
                  $instance = $(tpl);
                  $this.closest('.select-wrapper').append($instance);
                }

                $instance.addClass('open');
              },

              success: function(response) {
                let objectCount =  Object.keys(response.object).length,
                  total = 0;

                if (objectCount > 0 && response.total > 0) {
                  total = (objectCount > response.total) ? objectCount : response.total;
                }

                let $instanse = $this.closest('.select-wrapper').find('.filter__popup');

                if ($instanse.length > 0) {
                  let html = 'Найдено товаров: <strong class="text--bold filter--total">' + total + '</strong>';

                  if (total > 0) {
                    html += '<a href="' + url + '">Показать</a>';
                  }

                  $instanse.html(html);
                }
              }
            });
          }
        }

      }

    });
  }

  let $limitSwitchers = $('.switch-limit a:not(.active)');

  if ($limitSwitchers.length > 0) {

    $limitSwitchers.on('click', function(e) {
      e.preventDefault();

      let $this = $(this),
        limit = $this.data('limit'),
        urlData = location.href.split("#")[0].split("?"),
        urlQuery = urlData[1];

      let query = '';

      if (urlQuery) {
        let params = urlQuery.split('&');

        for (let i=0; i < params.length; i++) {
          let param = params[i].split('=');

          if (param[0] !== 'limit') {
            query += params[i] + '&';
          }
        }
      }

      query += 'limit=' + limit;
      location.href = urlData[0] + '?' + query;
    });

  }

  function showPopup(params)
  {
    let popupTpl = '<div class="filter__popup"></div>';

    let popup = params.el.find('.filter__popup');

    if (popup.length > 0) {

      $.each(popup.closest('form').find('.filter__popup.open'), function() {
        let $this = $(this);
        $this.removeClass('open');
      });
      popup.find('.filter--total').text(params.total);
      popup.addClass('open');

    } else {

      let $instance = $(popupTpl);
      params.el.append($instance);
      $instance.addClass('open');
    }
  }
});

jQuery(function($){

  const Basket = {

    add: function( params ) {

      let basketList = ($.cookie('basket') !== undefined) ? JSON.parse($.cookie('basket')) : [],
        found = false;

      $.each(basketList, function( i, data ) {

        if (data.id === params.id) {
          found = true;
          M.toast({html: 'Товар уже добавлен в корзину!'});
        }

        return !found;
      });

      if (!found) {
        basketList.push(params);
        $.cookie('basket', JSON.stringify(basketList), { path: '/' });

        M.toast({html: 'Товар добавлен в корзину.'});

        this.controllers.refresh(basketList);

        let $cart = $('.cart');

        if ($cart.length > 0) {
          window.location.reload();
        }
      }
    },

    remove: function(id) {
      let basketList = ($.cookie('basket') !== undefined) ? JSON.parse($.cookie('basket')) : [],
        found = false;

      $.each(basketList, function( index , data ) {

        if (data.id === id) {
          basketList.splice(index, 1);
          found = true;
        }

        return !found;
      });

      if (found) {

        $.cookie('basket', JSON.stringify(basketList), {path: '/'});
        let summary = this.controllers.refresh(basketList);

        $('.cart__total-price').text(number_formmat(summary.total));
      }

    },

    clear: function() {

      $.cookie('basket', JSON.stringify([]), {path: '/'});
      this.refresh();
    },

    controllers: {

      refresh: function(list) {

        let total = 0;

        let $cart = $('.quick-cart'),
          $badge = $cart.find('.quick-cart__counter-badge'),
          $cost = $cart.find('.quick-cart__counter-cost > em');

        if (list.length > 0) {

          $.each(list, function(i, data) {
            total += parseInt(data.price);
          });

          $badge.html(total);
          $cost.html(number_formmat(total))

          $cart.removeClass('quick-cart--empty');

        } else {

          $cart.addClass('quick-cart--empty');
          $badge.html(0);
          $cost.html(0);
        }

        $badge.text(list.length);

        return {
          total : total,
          count : list.length
        };
      },
    },

  };

  let $orderBtn = $('.product__order-btn');

  if ($orderBtn.length > 0) {

    $('body').on('click', '.product__order-btn', function(e) {
      e.preventDefault();

      let $this = $(this),
        data = {
          'id': $this.data('id'),
          'price': $this.data('price'),
        };

      Basket.add(data);
    });

  }

  const $removeItemBtn = $('.cart__item-remove');

  if ($removeItemBtn.length > 0) {

    $removeItemBtn.on('click', function(e) {
      e.preventDefault();

      let $this = $(this),
        $cart = $this.closest('.cart'),
        id = $this.data('id');

      if ($cart.find('.cart__item').length <= 1) {
        $cart.addClass('cart--empty');
      }

      $this.closest('.cart__item').remove();

      Basket.remove(id);

    });
  }
});

jQuery(function($){

  const Favorites = {

    controllers: {

      refresh: function(list) {

        let $favorite = $('.favorite__link'),
          $counter = $favorite.find('.favorite__counter');

        $counter.html('(' + list.length + ')');

        if (list.length > 0) {
          $favorite.removeClass('favorite--empty');
        } else {
          $favorite.addClass('favorite--empty');
        }
      }
    },

    check: function(id) {

      let favList = ($.cookie('favorite') != undefined) ? JSON.parse($.cookie('favorite')) : [];

      let idx = favList.indexOf(id);

      if (idx > -1) {

        M.toast({html: 'Товар удален из избранного.'});

        favList.splice(idx, 1);

      } else {
        M.toast({html: 'Товар добавлен в избранное.'});

        favList.push(id);
      }

      $.cookie('favorite', JSON.stringify(favList), { path: '/' });

      this.controllers.refresh(favList);
    },

  };

  let $addFavoriteBtn = $('.favorite-btn');

  if ($addFavoriteBtn.length > 0) {

    $addFavoriteBtn.on('click', function(e) {
      e.preventDefault();

      let $this = $(this);

      if ($this.hasClass('favorite--empty')) {

        $this.removeClass('favorite--empty');
        Favorites.check($this.data('id'));
      } else {

        $this.addClass('favorite--empty');
        Favorites.check($this.data('id'));
      }

      $this.blur();
    });

  }

});

jQuery(function($) {
  let $forms = $('.form--ajax');

  if ($forms.length > 0) {

    Inputmask({"mask": "+7 (999) 999-99-99"}).mask(document.querySelectorAll('input[type="tel"]'));

    $forms.each(function() {
      let $this = $(this);

      let validator = {
        ignore: [],
        submitHandler: function(form) {
          let $form = $(form),
            data = $form.serialize() + '&template=' + $form.attr('name');

          if ($form.attr('name') === 'order') {
            let basketList = ($.cookie('basket') !== undefined) ? JSON.parse($.cookie('basket')) : [];

            if (basketList.length > 0) {
              let basketData = basketList.map(function(elem){
                let key = "basket["+ elem.id +"]";
                return encodeURIComponent(key) + '=' + elem.price;
              }).join('&');

              data += '&' + basketData;
            }
          }

          $.ajax({
            url: 'assets/components/modxsite/connectors/connector.php',
            method: 'post',
            data: data,

            beforeSend: function() {
              $form.find('[type="submit"]').prop('disabled', true);
            },

            success: function(response) {
              if (response.success) {

                M.toast({
                  html: 'Сообщение успешно отправлено!'
                });

                if ($(form).attr('name') === 'order') {

                  let basketList = JSON.parse($.cookie('basket'));
                  let amount = 0;

                  basketList.map(function(elem) {
                    amount += parseInt(elem.price);
                  });

                  $('.cart__alert-content').empty();

                  $.ajax({
                    url: 'assets/components/modxsite/connectors/connector.php',
                    method: 'post',
                    data: {
                      amount: amount,
                      action: 'web/payment/create',
                      order: $form.data('order'),
                      username: $form.find('[name="username"]').val(),
                      email: $form.find('[name="email"]').val(),
                      phone: $form.find('[name="phone"]').val(),
                    },
                    success: function(response) {
                      if (response.success) {
                        let payment = response.object;

                        let itemListTpl = '';

                        $('.cart__item .cart__item-summary').each(function() {
                          let $title = $(this).find('.cart__item-title a');
                          let $price = $(this).find('.cart__item-price');

                          itemListTpl += '<li>' + $title.text() + ' - ' + $price.text() + ' руб</li>'
                        });

                        $('.cart__alert-content').append(
                          '<div class="center-align">'
                          + '<ul class="order-list__summary" style="color: #848181;">'
                          + '<li class="order-list__header"> Детализация заказа:</li>'
                          + itemListTpl + '</ul>'
                          + '<p class="h4" style="color: #848181;">Общая сумма к оплате: ' + number_formmat(amount) + ' рублей</p>'
                          + '<a href="' + payment.confirmation.confirmation_url + '" class="btn">Оплатить сейчас</a>'
                          + '<ul class="payments-list">'
                          + '<li class="payments-list__header">Другие способы оплаты:</li>'
                          + '<li class="payments-list__item">Наличными в нашем офисе</li>'
                          + '<li class="payments-list__item">Безналичным платежом в отделении банка</li>'
                          + '<li class="payments-list__item">Сертификатом «НОКС-МЕБЕЛЬ»</li>'
                          + '</ul></div>'
                        );
                      }
                    },
                  })

                  let confirmTpl = '<h3 style="color: #848181;">Спасибо ваш заказ успешно оформлен!</h3>'
                    + '<p>В ближайшее время с вами свяжется наш менеджер.</p>';

                  $('.cart__alert-content').prepend(confirmTpl);

                  $('.cart').addClass('cart--empty');

                  $('.quick-cart').addClass('quick-cart--empty');

                  $('html, body').animate({
                    scrollTop: $("h1").offset().top - 20
                  }, 1000);

                  $('.quick-cart__counter-badge').html(0);
                  $('.quick-cart__counter-cost').html(0);

                  $.cookie('basket', JSON.stringify([]), {path: '/'});
                }

                let $modal = $(form).closest('.modal');

                if ($modal.length > 0) {
                  let modalInstance = M.Modal.getInstance($modal);

                  if (modalInstance !== null) {
                    modalInstance.close();
                  }
                }

                form.reset();

              } else {
                M.toast({
                  html: 'Ошибка отправки запроса.'
                });
              }
            },

            error: function(XMLHttpRequest, textStatus, errorThrown){
              M.toast({
                html: 'Ошибка отправки запроса.'
              });
            },

            complete: function() {
              $form.find('[type="submit"]').prop('disabled', false);
            },
          });

          return false;
        },
        focusCleanup: true,
        errorClass: 'error',
        validClass: '',
        errorElement: 'span',
        focusInvalid: false,

        errorPlacement: function(error, element) {
          element.parent().append(error);
          return true;
        },

        rules: {

          username: {
            required: true,
          },
        },

        messages: {
          email: {
            require_from_group: "Укажите ваш E-mail.",
            required: "Укажите ваш E-mail.",
            email: "Неправильный формат электронной почты.",
          },

          phone: {
            require_from_group: "Укажите ваш номер телефона.",
            required: "Укажите ваш номер телефона.",
          },

          agree: {
            required: "Подтвердите согласие.",
          },

          username: {
            required: 'Напишите ваше имя.',
          },
        },
      };

      switch ($this.attr('name')) {
        case 'callback':
        case 'request':

          validator.rules = Object.assign({}, validator.rules, {
            phone: {
              required: true,
            },
          });
          break;

        case 'feedback':

          validator.rules = Object.assign({}, validator.rules, {
            email: {
              required: true,
              email: true,
            },
          })
          break;

        case 'visit':
        case 'project':
        case 'order':

          validator.rules = Object.assign({}, validator.rules, {
            phone: {
              require_from_group: [1, ".required-group"],
            },

            email: {
              require_from_group: [1, ".required-group"],
              email: true,
            },
          });
          break;

        default: ;
      }

      $this.validate(validator);
    });

  }

});

jQuery(function($) {

  let $infinityBtn = $('.catalog-infinity');

  if ($infinityBtn.length > 0) {

    $infinityBtn.on('click', function(e) {
      e.preventDefault();

      let $currBtn = $(this),
        currentPage = parseInt($currBtn.data('page')),
        $catalogContainer = $('.catalog-grid'),
        hasNext = $catalogContainer.data('getpage');

      if (hasNext) {
        let urlData = location.href.split("#")[0].split("?"),
          urlQuery = urlData[1],
          query = '';

        if (urlQuery) {
          let params = urlQuery.split('&');

          for (let i=0; i < params.length; i++) {
            let param = params[i].split('=');

            if (param[0] !== 'page') {
              query += params[i] + '&';
            }
          }
        }

        query += 'page=' + (currentPage + 1);

        let url = urlData[0] + '?' + query;

        $.ajax({
          url: url,
          method: 'get',
          beforeSend: function() {
            $currBtn.addClass('disabled');
            $currBtn.find('[data-fa-i2svg]').addClass('fa-spin');
          },
          success: function(res) {
            let $page = $(res),
              $pageCatalog = $page.find('.catalog-grid'),
              $products = $pageCatalog.children();

            $products.css('display', 'none');
            $catalogContainer.append($products);
            $products.fadeIn(800);

            $catalogContainer.data('getpage', $pageCatalog.data('getpage'));

            if (!$pageCatalog.data('getpage')) {
              $currBtn.hide();
            } else {
              $currBtn.data('page', currentPage + 1);
              $currBtn.removeClass('disabled');
              $currBtn.find('[data-fa-i2svg]').removeClass('fa-spin');
            }
          }
        });
      }
    });
  }
});

function getQueryUrl(str)
{
  let search = (str) ? '?' + str : '';
  return location.origin + location.pathname + search;
}

function number_formmat (number) {
  let num = number.toFixed(0),
    str = num.toString();
  let rgx = /(\d+)(\d{3})/;

  while (rgx.test(str)) {
    str = str.replace(rgx, '$1' + ' ' + '$2');
  }

  return str;
}


jQuery(function($) {
  let $scrollUp = $('.scroll-up');

  if ($scrollUp.length > 0) {

    $(window).on('scroll', function() {
      if($(window).scrollTop() >= 100 ){
        $scrollUp.show();
      } else {
        $scrollUp.hide();
      }
    })

    $scrollUp.on('click', function(e) {
      e.preventDefault();

      $("html, body").animate({ scrollTop: 0 }, "slow");
    });
  }
});