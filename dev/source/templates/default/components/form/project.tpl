<form name="project" class="form form--ajax" autocomplete="off">
    <input type="hidden" name="action" value="web/form">
    <input type="hidden" name="subject" value="Заказ проекта">
    <input type="hidden" name="ref" value="{$smarty.cookies.ref}">
    <div class="form__field">
        <label>Ваше имя:</label>
        <input type="text" name="username" class="input-field browser-default full">
    </div>
    <div class="row">
        <div class="col s12 m6">
            <div class="form__field">
                <label>Ваш телефон:</label>
                <input type="tel" name="phone" class="input-field browser-default full required-group">
            </div>
        </div>
        <div class="col s12 m6">
            <div class="form__field">
                <label>Электронная почта:</label>
                <input type="email" name="email" class="input-field browser-default full required-group">
            </div>
        </div>
    </div>
    <div class="form__field">
        <label>Комментарий:</label>
        <textarea name="comment" class="input-field browser-default full" rows="2"></textarea>
    </div>
    <p>
        <small>Нажимая на кнопку "Отправить", Вы даете согласие на обработку своих <a href="#modal-policy" class="modal-trigger trigger-policy">персональных данных</a></small>
    </p>
    <div class="center-align">
        <button type="submit" class="form__submit form__submit--inverse" onclick="yaCounter49093180.reachGoal('proekt_send');">Отправить</button>
    </div>
</form>