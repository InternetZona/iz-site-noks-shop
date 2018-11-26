<form name="request" class="form form--request form--ajax" autocomplete="off">
    <input type="hidden" name="action" value="web/form">
    <input type="hidden" name="subject" value="Заявка на бесплатный дизайн-проект">
    <input type="hidden" name="ref" value="{$smarty.cookies.ref}">
    <div class="row row--grid">
        <div class="col s12 m12 l4">
            <div class="form__title">
                Заполните заявку на бесплатный
                дизайн-проект в один клик!
            </div>
            <div class="form__title-sub">
                В течении часа с вами свяжется менеджер
            </div>
        </div>
        <div class="col s12 m4 l3 valign-wrapper">
            <div class="form__field">
                <label>Ваше имя:</label>
                <input type="text" name="username" class="input-field browser-default">
            </div>
        </div>
        <div class="col s12 m4 l3 valign-wrapper">
            <div class="form__field">
                <label>Ваш телефон:</label>
                <input type="tel" name="phone" class="input-field browser-default">
            </div>
        </div>
        <div class="col s12 m4 l2 valign-wrapper">
            <div class="form__field">
                <button type="submit" class="form__submit" onclick="yaCounter49093180.reachGoal('dizayn');">Отправить</button>
            </div>
        </div>
        <div class="col s12offset-l4 l8">
            <small>Нажимая на кнопку "Отправить", Вы даете согласие на обработку своих <a href="#modal-policy" class="modal-trigger trigger-policy">персональных данных</a></small>
        </div>
    </div>
</form>