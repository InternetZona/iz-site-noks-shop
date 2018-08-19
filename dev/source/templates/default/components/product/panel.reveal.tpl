{if $productType = $modx->getObject('catalogProductType', [
    'template_id'   => $object.template
])}

    {$row = ''}

    {if $productFilters = $productType->getMany('ProductTypeFilters')}

        {foreach $productFilters as $productFilter}

            {if $filter = $productFilter->getOne('Filter')}

                {if $productType->id == 2}
                    {$excludeFilterIds = [9, 12]}

                    {elseif $productType->id == 3}
                        {$excludeFilterIds = [9, 12]}

                    {elseif $productType->id == 5}
                        {$excludeFilterIds = [8]}

                {/if}

                {if !$filter->hideonpreview && !in_array($filter->id, $excludeFilterIds|default:[])}

                    {if $value = $object['tvs'][$filter->tv_key]['value']}

                        {if $filterValue = $modx->getObject('catalogFilterValue', $value)}

                            {$row = $row|cat:"<li>{$filter->name}: {$filterValue->name}</li>"}

                        {/if}

                    {/if}

                {/if}

            {/if}

        {/foreach}

    {/if}

    {if $row ne ''}
        <div class="product__params-reveal">
            <ul class="product__params">
                {$row}
            </ul>
        </div>
    {/if}

{/if}