<div id="modal-filter" class="modal right-sheet modal-filter">
    <div class="modal-content">
        <div class="modal-header">
            <button class="modal-close left white-text" title="Закрыть (Esc)">
                <i class="fas fa-times"></i>
            </button>
            Фильтры
        </div>
        <form id="mobile-controller" class="form form-catalog-controller" data-catalog="21" data-tpl="{$productType->template_id}">
            <input type="hidden" name="limit" value="{$limit}">

            {if $productFilters = $productType->getMany('ProductTypeFilters')}
                {include file="components/filter/index.tpl" productFilters=$productFilters}
            {/if}
            <div class="sorting-control--wrapper">
                <label>Сортировать</label>
                {include file="components/filter/sort.tpl"}
            </div>
        </form>
    </div>
</div>