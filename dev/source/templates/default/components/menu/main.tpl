<ul id="desktop-menu" class="hide-on-med-and-down">
    <li>
        <a class="dropdown-trigger dd-panel" href="#" data-target="dd-catalog-style">Кухни</a>
        <div id="dd-catalog-style" class="dropdown-content">
            <div class="row row--grid">

                {$params = [
                'parent'    => 24
                ,'limit'    => 0
                ,'cached'   => true
                ]}

                {processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

                {if $result.success && $result.count > 0}

                    <div class="col l4 xl3">

                        {if {field name=id} == 24}
                            <a class="dd-panel__title left-align active" href="{$modx->makeUrl(24)}">Все кухни</a>
                        {else}
                            <a class="dd-panel__title left-align" href="{$modx->makeUrl(24)}">Все кухни</a>
                        {/if}

                        {include file="components/menu/main.item.tpl" tv="itemMaterial" title="Материал фасадов" objects=$result.object}
                    </div>

                    <div class="col l4 xl3">

                        {include file="components/menu/main.item.tpl" tv="itemStyle" title="Стиль" objects=$result.object}
                        {include file="components/menu/main.item.tpl" tv="itemSolution" title="Решения" objects=$result.object}
                        {include file="components/menu/main.item.tpl" tv="itemCoating" title="Вид покрытия" objects=$result.object}
                    </div>

                {/if}

                <div class="col l4 xl3">

                    {$params = [
                    'parent'    => 23
                    ,'where'     =>  [
                        'id:IN'  => [41,42,43,44,45,46]
                    ]
                        ,'limit'    => 0
                        ,'cached'   => true
                    ]}

                    {processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=resultMenu}

                    {if $resultMenu.success && $resultMenu.count > 0}

                        <div class="dd-panel__title left-align">Сопутствующие товары</div>

                        <ul class="nav-inner">

                            {foreach $resultMenu.object as $object}
                                {if $object.id == {field name=id}}
                                    <li class="active">
                                        <a href="{$object.uri}">{$object.menutitle|default:$object.pagetitle}</a>
                                    </li>
                                {else}
                                    <li>
                                        <a href="{$object.uri}">{$object.menutitle|default:$object.pagetitle}</a>
                                    </li>
                                {/if}
                            {/foreach}
                        </ul>

                    {/if}

                    {if {field name=id} == 24}
                        <a class="dd-panel__title left-align active" href="{$modx->makeUrl(12)}">Полезные советы</a>
                    {else}
                        <a class="dd-panel__title left-align" href="{$modx->makeUrl(12)}">Полезные советы</a>
                    {/if}

                    {*
                        {if {field name=id} == 24}
                            <a class="dd-panel__title left-align active" href="{$modx->makeUrl(17, 'web', 'type=1')}">Портфолио</a>
                        {else}
                            <a class="dd-panel__title left-align" href="{$modx->makeUrl(17, 'web', 'type=1')}">Портфолио</a>
                        {/if}
                    *}

                </div>

                <div class="col hide-on-large-only show-on-extra-large xl3">

                    {include file="components/menu/rotation.tpl" rotatorTitle="Купи с выгодой" id=24}

                </div>

            </div>
        </div>
    </li>

    <li>
        <a class="dropdown-trigger dd-panel" href="#" data-target="dd-catalog-cupboard">Распашные шкафы</a>
        <div id="dd-catalog-cupboard" class="dropdown-content">
            <div class="row row--grid">

                {$params = [
                'parent'    => 274
                ,'limit'    => 0
                ,'cached'   => true
                ]}

                {processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

                {if $result.success && $result.count > 0}

                    <div class="col l4 xl3">

                        {if {field name=id} == 274}
                            <a class="dd-panel__title left-align active" href="{$modx->makeUrl(274)}">Все распашные шкафы</a>
                        {else}
                            <a class="dd-panel__title left-align" href="{$modx->makeUrl(274)}">Все распашные шкафы</a>
                        {/if}

                        {include file="components/menu/main.item.tpl" tv="itemMaterial" title="Материал фасадов" objects=$result.object}
                    </div>

                    <div class="col l4 xl3">

                        {include file="components/menu/main.item.tpl" tv="itemLocation" title="Помещение" objects=$result.object}
                        {include file="components/menu/main.item.tpl" tv="itemConstruction" title="Конструкция" objects=$result.object}
                    </div>

                    <div class="col l4 xl3">

                        {include file="components/menu/main.item.tpl" tv="itemConfiguration" title="Конфигурация" objects=$result.object}
                        {include file="components/menu/main.item.tpl" tv="itemStyle" title="Стиль" objects=$result.object}

                        {if {field name=id} == 24}
                            <a class="dd-panel__title left-align active" href="{$modx->makeUrl(12)}">Полезные советы</a>
                        {else}
                            <a class="dd-panel__title left-align" href="{$modx->makeUrl(12)}">Полезные советы</a>
                        {/if}

                        {*
                            {if {field name=id} == 24}
                                <a class="dd-panel__title left-align active" href="{$modx->makeUrl(17, 'web', 'type=2')}">Портфолио</a>
                            {else}
                                <a class="dd-panel__title left-align" href="{$modx->makeUrl(17, 'web', 'type=2')}">Портфолио</a>
                            {/if}
                        *}

                    </div>

                {/if}

                <div class="col hide-on-large-only show-on-extra-large xl3">

                    {include file="components/menu/rotation.tpl" rotatorTitle="Купи с выгодой" id=274}

                </div>

            </div>
        </div>
    </li>

    <li>
        <a class="dropdown-trigger dd-panel" href="#" data-target="dd-catalog-cupeboard">Шкафы-купе</a>
        <div id="dd-catalog-cupeboard" class="dropdown-content">
            <div class="row row--grid">

                {$params = [
                'parent'    => 280
                ,'limit'    => 0
                ,'cached'   => true
                ]}

                {processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

                {if $result.success && $result.count > 0}

                    <div class="col l4 xl3">

                        {if {field name=id} == 280}
                            <a class="dd-panel__title left-align active" href="{$modx->makeUrl(280)}">Все шкафы-купе</a>
                        {else}
                            <a class="dd-panel__title left-align" href="{$modx->makeUrl(280)}">Все шкафы-купе</a>
                        {/if}

                        {include file="components/menu/main.item.tpl" tv="itemMaterial" title="Материал фасадов" objects=$result.object}
                    </div>

                    <div class="col l4 xl3">

                        {include file="components/menu/main.item.tpl" tv="itemLocation" title="Помещение" objects=$result.object}
                        {include file="components/menu/main.item.tpl" tv="itemConstruction" title="Конструкция" objects=$result.object}
                    </div>

                    <div class="col l4 xl3">

                        {include file="components/menu/main.item.tpl" tv="itemConfiguration" title="Конфигурация" objects=$result.object}
                        {include file="components/menu/main.item.tpl" tv="itemStyle" title="Стиль" objects=$result.object}

                        {if {field name=id} == 24}
                            <a class="dd-panel__title left-align active" href="{$modx->makeUrl(12)}">Полезные советы</a>
                        {else}
                            <a class="dd-panel__title left-align" href="{$modx->makeUrl(12)}">Полезные советы</a>
                        {/if}

                        {*
                            {if {field name=id} == 24}
                                <a class="dd-panel__title left-align active" href="{$modx->makeUrl(17, 'web', 'type=3')}">Портфолио</a>
                            {else}
                                <a class="dd-panel__title left-align" href="{$modx->makeUrl(17, 'web', 'type=3')}">Портфолио</a>
                            {/if}
                        *}

                    </div>

                {/if}

                <div class="col hide-on-large-only show-on-extra-large xl3">

                    {include file="components/menu/rotation.tpl" rotatorTitle="Купи с выгодой" id=280}

                </div>

            </div>
        </div>
    </li>

    <li>
        <a class="dropdown-trigger dd-panel" href="#" data-target="dd-catalog-wardrobe">Гардеробные</a>
        <div id="dd-catalog-wardrobe" class="dropdown-content">
            <div class="row row--grid">

                {$params = [
                'parent'    => 286
                    ,'limit'    => 0
                    ,'cached'   => true
                ]}

                {processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

                {if $result.success && $result.count > 0}

                    <div class="col l4 xl3">

                        {if {field name=id} == 286}
                            <a class="dd-panel__title left-align active" href="{$modx->makeUrl(286)}">Все гардеробные</a>
                        {else}
                            <a class="dd-panel__title left-align" href="{$modx->makeUrl(286)}">Все гардеробные</a>
                        {/if}

                        {include file="components/menu/main.item.tpl" tv="itemConfiguration" title="Конфигурация" objects=$result.object}
                    </div>

                    <div class="col l4 xl3">
                        {include file="components/menu/main.item.tpl" tv="itemMaterial" title="Материал" objects=$result.object}

                        {if {field name=id} == 832}
                            <a class="dd-panel__title left-align active" href="{$modx->makeUrl(832)}">Варианты наполения</a>
                        {else}
                            <a class="dd-panel__title left-align" href="{$modx->makeUrl(832)}">Варианты наполения</a>
                        {/if}

                        {if {field name=id} == 24}
                            <a class="dd-panel__title left-align active" href="{$modx->makeUrl(12)}">Полезные советы</a>
                        {else}
                            <a class="dd-panel__title left-align" href="{$modx->makeUrl(12)}">Полезные советы</a>
                        {/if}


                    </div>

                    <div class="col l4 xl3">

                        {include file="components/menu/main.item.tpl" tv="itemSize" title="Популярные размеры" objects=$result.object}

                        {*
                            {if {field name=id} == 24}
                                <a class="dd-panel__title left-align active" href="{$modx->makeUrl(17, 'web', 'type=4')}">Портфолио</a>
                            {else}
                                <a class="dd-panel__title left-align" href="{$modx->makeUrl(17, 'web', 'type=4')}">Портфолио</a>
                            {/if}
                        *}

                    </div>

                {/if}

                <div class="col hide-on-large-only show-on-extra-large xl3">

                    {include file="components/menu/rotation.tpl" rotatorTitle="Купи с выгодой" id=286}

                </div>

            </div>
        </div>
    </li>

    <li>
        <a class="dropdown-trigger dd-panel" href="#" data-target="dd-catalog-hallway">Прихожие</a>
        <div id="dd-catalog-hallway" class="dropdown-content">
            <div class="row row--grid">

                {$params = [
                'parent'    => 290
                ,'limit'    => 0
                ,'cached'   => true
                ]}

                {processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

                {if $result.success && $result.count > 0}

                    <div class="col l4 xl3">

                        {if {field name=id} == 290}
                            <a class="dd-panel__title left-align active" href="{$modx->makeUrl(290)}">Все прихожие</a>
                        {else}
                            <a class="dd-panel__title left-align" href="{$modx->makeUrl(290)}">Все прихожие</a>
                        {/if}

                        {include file="components/menu/main.item.tpl" tv="furnitureType" title="Вид мебели" objects=$result.object}
                        {include file="components/menu/main.item.tpl" tv="itemSolution" title="Решения" objects=$result.object}
                    </div>

                    <div class="col l4 xl3">
                        {include file="components/menu/main.item.tpl" tv="itemMaterial" title="Материал" objects=$result.object}
                    </div>

                    <div class="col l4 xl3">

                        {include file="components/menu/main.item.tpl" tv="itemStyle" title="Стиль" objects=$result.object}

                        {if {field name=id} == 24}
                            <a class="dd-panel__title left-align active" href="{$modx->makeUrl(12)}">Полезные советы</a>
                        {else}
                            <a class="dd-panel__title left-align" href="{$modx->makeUrl(12)}">Полезные советы</a>
                        {/if}

                        {*
                            {if {field name=id} == 24}
                                <a class="dd-panel__title left-align active" href="{$modx->makeUrl(17, 'web', 'type=5')}">Портфолио</a>
                            {else}
                                <a class="dd-panel__title left-align" href="{$modx->makeUrl(17, 'web', 'type=5')}">Портфолио</a>
                            {/if}
                        *}

                    </div>

                {/if}

                <div class="col hide-on-large-only show-on-extra-large xl3">

                    {include file="components/menu/rotation.tpl" rotatorTitle="Купи с выгодой" id=290}

                </div>

            </div>
        </div>
    </li>

    <li>
        <a class="dropdown-trigger dd-panel" href="#" data-target="dd-catalog-childroom">Детские</a>
        <div id="dd-catalog-childroom" class="dropdown-content">
            <div class="row row--grid">

                {$params = [
                'parent'    => 295
                ,'limit'    => 0
                ,'cached'   => true
                ]}

                {processor action="site/web/resources/getdata" ns="modxsite" params=$params assign=result}

                {if $result.success && $result.count > 0}

                    <div class="col l4 xl3">

                        {if {field name=id} == 295}
                            <a class="dd-panel__title left-align active" href="{$modx->makeUrl(295)}">Все детские</a>
                        {else}
                            <a class="dd-panel__title left-align" href="{$modx->makeUrl(295)}">Все детские</a>
                        {/if}

                        {include file="components/menu/main.item.tpl" tv="furnitureType" title="Вид мебели" objects=$result.object}
                    </div>

                    <div class="col l4 xl3">
                        {include file="components/menu/main.item.tpl" tv="itemMaterial" title="Материал" objects=$result.object}
                    </div>

                    <div class="col l4 xl3">

                        {include file="components/menu/main.item.tpl" tv="itemSolution" title="Решения" objects=$result.object}

                        {include file="components/menu/main.item.tpl" tv="itemGender" title="Пол ребенка" objects=$result.object}

                        {if {field name=id} == 24}
                            <a class="dd-panel__title left-align active" href="{$modx->makeUrl(12)}">Полезные советы</a>
                        {else}
                            <a class="dd-panel__title left-align" href="{$modx->makeUrl(12)}">Полезные советы</a>
                        {/if}

                        {*
                            {if {field name=id} == 24}
                                <a class="dd-panel__title left-align active" href="{$modx->makeUrl(17, 'web', 'type=6')}">Портфолио</a>
                            {else}
                                <a class="dd-panel__title left-align" href="{$modx->makeUrl(17, 'web', 'type=6')}">Портфолио</a>
                            {/if}
                        *}

                    </div>

                {/if}

                <div class="col hide-on-large-only show-on-extra-large xl3">

                    {include file="components/menu/rotation.tpl" rotatorTitle="Купи с выгодой" id=295}

                </div>

            </div>
        </div>
    </li>

    <li>
        <a href="{$modx->makeUrl(38)}">Акции</a>
    </li>
</ul>