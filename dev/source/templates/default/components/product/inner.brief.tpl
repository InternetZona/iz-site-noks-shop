<div class="row product-tabs">
    <div class="col s12">
        <ul id="product-overview-detail" class="tabs">
            <li class="tab col s12 m3"><a href="#tab-detail">Подробно</a></li>
        </ul>
    </div>
    <div id="tab-detail" class="tab__item col s12" style="margin-top: 20px;">
        <div class="row row--grid">
            <div class="col s12 m4">
                <div class="content-wrapper">
                    {field name=content}
                </div>
            </div>
            <div class="col s12 m4">
                <div class="content-wrapper">
                    {tv name=detail_colors}
                </div>
            </div>
            <div class="col s12 m4">
                <div class="content-wrapper">
                    {tv name=detail_config}
                </div>
            </div>
        </div>
    </div>
</div>