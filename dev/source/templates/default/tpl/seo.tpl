{extends file="basepage.tpl"}

{block name=page_content prepend}

    {assign var=productType value=$modx->getObject('catalogProductType', [
        'seo_template_id'   => {field name=template}
    ])}

    {if $productType}

        {$limit = 15}

        {if isset($smarty.get.limit)}
            {$limit = (in_array($smarty.get.limit, [0, 15, 30, 45])) ? $smarty.get.limit : $limit }
        {/if}

        {block name=catalogParams}
            {$params=[
            'parent'    => 21
            ,'where'    => [
                'template' => $productType->template_id
            ]
            ,'sort' => 'publishedon'
            ,'dir'  => 'desc'
            ,'limit'    => $limit
            ,'filter' => {snippet name="getSeoFilter"}
            ,'sorting'  => $smarty.get.sorting|default:false
            ,'getPage'  => true
            ,'page'     => $smarty.get.page|default:1
            ]}
        {/block}

        {processor action="web/catalog/getdata" ns="modcatalog" params=$params assign=result}

        <div class="hide-on-med-and-down">
            <form id="desktop-controller" class="form form-catalog-controller" data-catalog="21" data-tpl="{$productType->template_id}">
                <input type="hidden" name="limit" value="{$limit}">

                {$c = $modx->newQuery('catalogProductFilter')}
                {$c->sortby('filter_id', 'ASC')}

                {if $productFilters = $productType->getMany('ProductTypeFilters', $c)}
                    {include file="components/filter/index.tpl" productFilters=$productFilters}
                {/if}
                <div class="sorting--wrapper">
                    <div class="row row--grid">
                        <div class="col m6 valign-wrapper">
                            <div class="summary-wrapper">
                                Всего товаров: <strong class="text--bold">{$result.total}</strong>
                            </div>
                        </div>
                        <div class="col m6 valign-wrapper">
                            <div class="right-align width-overlay">
                                <div class="sorting-control--wrapper">
                                    Сортировать
                                    {include file="components/filter/sort.tpl"}
                                </div>
                                <div class="switch-limit--wrapper">
                                    Выводить по:
                                    <ul class="switch-limit">
                                        {$active = ($limit == 15) ? 'active' :''}
                                        <li><a href="#" data-limit="15" class="{$active}">15</a></li>
                                        {$active = ($limit == 30) ? 'active' :''}
                                        <li><a href="#" data-limit="30" class="{$active}">30</a></li>
                                        {$active = ($limit == 45) ? 'active' :''}
                                        <li><a href="#" data-limit="45" class="{$active}">45</a></li>
                                        {$active = ($limit == 0) ? 'active' :''}
                                        <li><a href="#" data-limit="0" class="{$active}">Все</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <div class="hide-on-large-only row row--grid">
            <div class="col s8 m10 valign-wrapper">
                <div class="summary-wrapper">
                    Всего товаров: <strong class="text--bold">{$result.total}</strong>
                </div>
            </div>
            <div class="col s4 m2 valign-wrapper">
                <a href="#modal-filter" class="modal-trigger filter__modal-trigger">Фильтр</a>
            </div>
        </div>

        {if in_array({field name=template}, [10,34,36]) AND ($smarty.get.filter.itemMaterial == 2 OR {tv name=itemMaterial} == 2) }

            {include file="components/alert/danger.tpl" text="Все представленные модели возможно исполнить в любом желаемом цвете"}

        {/if}

        {if $result.success && $result.count > 0}

            {$paging = false}
            {$page = $smarty.get.page|default:1}

            {if $page > 1}
                {$paging = ($result.total > ($limit * $page)) ? 'true' : 'false'}
            {elseif $page}
                {$paging = ($result.total > $limit) ? 'true' : 'false'}
            {/if}

            <div class="row catalog-grid" data-getpage="{$paging}">
                {foreach $result.object as $object}
                    <div class="col s12 m6 l4">
                        {include file="components/product/item.tpl" object=$object}
                    </div>
                {/foreach}
            </div>

            [[+page.nav:notempty=`<div class="center-align"><a href="#" class="catalog-infinity btn" data-page="{$smarty.get.page|default:1}">Показать еще <i class="fas fa-sync fa-fw"></i></a></div>`]]

        {/if}

    {/if}
{/block}

{block name=aside}
    <div class="grey-bg">
        <div class="container">
            {include file="blocks/sales.inner.tpl"}
        </div>
    </div>
    <div class="container">
        {include file="blocks/blog.tpl"}
        {include file="blocks/testimonials.tpl"}
        {include file="blocks/request.tpl"}
    </div>
{/block}

{block name=modals append}
    {include file="components/modals/testimonials.tpl"}
    {include file="components/modals/filter.tpl"}
{/block}