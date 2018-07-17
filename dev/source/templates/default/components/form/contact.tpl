<form name="feedback" class="form form--ajax" autocomplete="off">
    <input type="hidden" name="action" value="web/form">
    <input type="hidden" name="subject" value="Сообщение с сайта">
    <div class="form__field">
        <label>Ваше имя:</label>
        <input type="text" name="username" class="input-field browser-default full">
    </div>
    <div class="form__field">
        <label>Электронная почта:</label>
        <input type="email" name="email" class="input-field browser-default full">
    </div>
    <div class="form__field">
        <label>Сообщение:</label>
        <textarea name="comment" class="input-field browser-default full" rows="3"></textarea>
    </div>
    <p>
        <small>Нажимая на кнопку "Отправить", Вы даете согласие на обработку своих <a href="#modal-policy" class="modal-trigger trigger-policy">персональных данных</a></small>
    </p>
    <div class="center-align">
        <button type="submit" class="form__submit form__submit--inverse" onclick="yaCounter49093180.reachGoal('write_send');">Отправить</button>
    </div>
</form>