{extends file="basepage.tpl"}

{block name=page_content prepend}
    <div class="row row--grid">
        <div class="col s12 m6 l4">
            <div class="contacts-area width-overlay">
                <div class="block__title">Телефоны:</div>
                <ul class="phones">
                    <li class="phone valign-wrapper"><a href="tel:84952088802">8 (495) 208-88-02</a> <span>Пн.-Вс. 10:00-20:00</span></li>
                </ul>
                <span style="display: inline-block; margin: 10px 0;">Посещение шоу-рума в выходные дни по предварительной записи</span>
            </div>
        </div>
        <div class="col s12 m6 l4 valign-wrapper">
            <div class="contacts-area width-overlay">
                <div class="block__title">Мессенджеры:</div>
                <ul class="messengers">
                    <li class="phone valign-wrapper"><a href="tel:79265127861">+7 (926) 512-78-61</a>
                        <span class="text-primary">
                            <i class="fab fa-whatsapp fa-fw"></i>
                            <i class="fab fa-telegram-plane fa-fw"></i>
                            <i class="fab fa-viber fa-fw"></i>
                        </span>
                    </li>
                    <li class="app valign-wrapper">
                        <span class="text-primary">
                            <i class="fab fa-skype fa-fw"></i>
                        </span> Мебель Нокс
                    </li>
                </ul>
            </div>
        </div>
        <div class="col s12 m12 l4 valign-wrapper">
            <div class="contacts-area width-overlay">

                <a href="#modal-feedback" class="modal-trigger button" onclick="yaCounter49093180.reachGoal('write');">Написать письмо</a>

            </div>
        </div>
    </div>

    <div class="map--wrapper">
        <div class="h6"><span class="text-primary"><i class="fas fa-map-marker-alt fa-fw"></i> </span>Наш шоу-рум: <span class="text--bold">г. Одинцово, ул. Акуловская, д.2а</span></div>
        <div id="map-branch" class="map"></div>
    </div>

    <div class="row row--grid"><div class="container">{tv name="textpod1"}</div></div>

    <div class="map--wrapper">
        <div class="h6"><span class="text-primary"><i class="fas fa-map-marker-alt fa-fw"></i> </span>Наш административный офис: <span class="text--bold">125040, г. Москва, 3-я улица Ямского Поля, дом 2, корпус 3</span></div>
        <div id="map-master" class="map" style="height:270px;"></div>
    </div>

    <div class="row row--grid"><div class="container">{tv name="textpod2"}</div></div>
{/block}

{block name=aside}
    <div class="container">
        {$tvData = {tv name=images}|json_decode:true}

        {if $tvData && is_array($tvData)}
            <div class="images__feed">

                <div id="swiper-feed" class="swiper-container swiper-content images-feed__content">
                    <div class="swiper-wrapper gallery-photoswipe">
                        {foreach $tvData as $row}

                            <figure class="swiper-slide center-align">

                                {snippet name="pThumb" params=[
                                "input" => $row.image
                                ,"options" => "&w=1200&h=600&zc=0&aoe=0&far=0&q=70"
                                ] assign=thumbImage}

                                <a href="{$thumbImage}" data-size="1200x600" class="images-feed__item">

                                    {snippet name="pThumb" params=[
                                    "input" => $row.image,
                                    "options" => "&w=242&h=168&zc=1&aoe=0&far=0&q=70"
                                    ] assign=thumbImage}

                                    <img src="{$thumbImage}" class="responsive-img" />
                                </a>
                            </figure>
                        {/foreach}
                    </div>
                </div>
            </div>
        {/if}

        <div class="row">
            <div class="col s12 m6">
                <div class="contact__title left-align">Задайте нам свои вопросы</div>
                <div class="form-wrapper">
                    {include file="components/form/contact.tpl"}
                </div>
            </div>
            <div class="col s12 m6">
                <div class="contact__title left-align">Наши реквизиты</div>
                <ul class="owner-summary">
                    <li>ООО «НОКС МЕБЕЛЬ»</li>
                    <li>ИНН 5032296487, ОГРН 1185053011989</li>
                    <li>Телефон: 8 (495) 208-88-02</li>
                    <li>Эл.почта: info@noks-kuhni.ru </li>
                </ul>
            </div>
        </div>

    </div>
{/block}

{block name=js_inject prepend}
    {include file="components/photoswipe/constructor.tpl"}
{/block}