<form name="showcallback" class="form form--ajax row" autocomplete="off">
    <input type="hidden" name="action" value="web/form">
    <input type="hidden" name="subject" value="Заказ обратного звонка">
    <input type="hidden" name="ref" value="{$smarty.cookies.ref}">
    <div class="form__field col s12 m6 l6">
        <label>Ваше имя:</label>
        <input type="text" name="username" class="input-field browser-default full">
    </div>
    <div class="form__field col s12 m6 l6">
        <label>Ваш номер телефона:</label>
        <input placeholder="+7..." type="tel" name="phone" class="input-field browser-default full" required>
    </div>
    <div class="clear"></div>
    <div class="center-align col s12 m4 l4">
        <button type="submit" class="form__submit form__submit--inverse" onclick="yaCounter49093180.reachGoal('call_send');">Отправить</button>
    </div>
    <div class="col s12 m8 l8 soglasie">
        <small>Нажимая на кнопку "Отправить", Вы даете согласие на обработку своих <a href="#modal-policy" class="modal-trigger trigger-policy">персональных данных</a></small>
    </div>
</form>