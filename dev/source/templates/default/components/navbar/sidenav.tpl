<div class="sidenav" id="mobile-menu">
    <ul>
        <li class="sidenav__header">
            <a href="#" class="sidenav__close right">
                <i class="fas fa-times"></i>
            </a>
        </li>
    </ul>
    <ul class="mobile_pages">
        {snippet name="Wayfinder" params=[
        'startId'   => 0,
        'where'     => '[{"id:not in":[1,23,924]}]',
        'outerTpl'  => 'wf.outer.tpl',
        'level'     => 1
        ]}
    </ul>
    <ul class="mobile_catalog">
        <li>

            <ul class="collapsible">

                <li>
                    <div class="collapsible-header">Стиль кухонь <span class="right"><i class="fas fa-angle-right"></i></span></div>
                    <div class="collapsible-body">
                        {include file="components/menu/sidenav.item.tpl" tv="style"}
                    </div>
                </li>
                <li>
                    <div class="collapsible-header">Виды дерева <span class="right"><i class="fas fa-angle-right"></i></span></div>
                    <div class="collapsible-body">
                        {include file="components/menu/sidenav.item.tpl" tv="material"}
                    </div>
                </li>
                <li>
                    <div class="collapsible-header">Каталог цвета <span class="right"><i class="fas fa-angle-right"></i></span></div>
                    <div class="collapsible-body">
                        {include file="components/menu/sidenav.item.tpl" tv="colour"}
                    </div>
                </li>
                <li>
                    <a href="{$modx->makeUrl(269)}">Каталог фасадов</a>
                </li>
                <li>
                    <div class="collapsible-header">Сопутствующие товары <span class="right"><i class="fas fa-angle-right"></i></span></div>
                    <div class="collapsible-body">
                        <ul class="sidenav--inner">
                            {snippet name="Wayfinder" params=[
                            'startId'   => 23,
                            'outerTpl'  => 'wf.outer.tpl',
                            'level'     => 1
                            ]}
                        </ul>
                    </div>
                </li>

            </ul>
        </li>
    </ul>
</div>