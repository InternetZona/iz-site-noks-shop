<form name="calculation" class="form form--ajax uslugiform modxupload" autocomplete="off" method="post" action="ajax-form/upload.php" enctype="multipart/form-data">
    <input type="hidden" name="subject" value="Заказ расчета {field name=pagetitle} под свой размер">
    <input type="hidden" name="ref" value="{$smarty.cookies.ref}">
    <div class="form__field">
        <label>Ваше имя:</label>
        <input type="text" name="username" class="input-field browser-default full">
    </div>
    <div class="form__field">
        <label>Ваш телефон:</label>
        <input type="tel" name="phone" class="input-field browser-default full">
    </div>
    <div class="form__field">
        <label>Ваш e-mail:</label>
        <input type="email" name="email" class="input-field browser-default full">
    </div>
    {chunk name=file}
    <input type="hidden" class="infiles" name="files" value="">
    <div class="formweb"></div>
    <div class="form__field">
        <label>Комментарий:</label>
        <textarea name="comment" class="input-field browser-default full" rows="2" placeholder="Здесь Вы можете указать размеры вашей кухни и ее конфигурацию (прямая, угловая, П-образная)"></textarea>
    </div>
    <p>
        <small>Нажимая на кнопку "Заказать расчет", Вы даете согласие на обработку своих <a href="/policy.doc">персональных данных</a></small>
    </p>
    <div class="center-align">
        <button type="submit" class="form__submit form__submit--inverse">Заказать расчет</button>
    </div>
</form>