{if $productType = $modx->getObject('catalogProductType', [
    'template_id'   => $object.template
])}

    {$row = ''}

    {if $productFilters = $productType->getMany('ProductTypeFilters')}

        {foreach $productFilters as $productFilter}

            {if $filter = $productFilter->getOne('Filter')}

                {if $productType->id == 2}
                    {$excludeFilterIds = [9, 6]}

                    {elseif $productType->id == 3}
                        {$excludeFilterIds = [9, 6]}

                    {elseif $productType->id == 5}
                        {$excludeFilterIds = [9]}

                {/if}

                {if !$filter->hideonpreview && !in_array($filter->id, $excludeFilterIds|default:[])}

                    {if $value = $object['tvs'][$filter->tv_key]['value']}

                        {if $filter->multiple  == 'listbox'}

                            {if $filterValue = $modx->getObject('catalogFilterValue', $value)}

                                {$row = $row|cat:"<li>{$filter->name}: {$filterValue->name}</li>"}

                            {/if}

                            {else}

                            {$data = explode('||', $value)}

                            {if $data && is_array($data)}
                                {assign var=values value=[]}

                                {foreach $data as $id}
                                    {if $value = $modx->getObject('catalogFilterValue', $id)}
                                        {$values[] = $value->name}
                                    {/if}
                                {/foreach}
                                {if $values}

                                    {$row = $row|cat:"<li>{$filter->name}: {implode(', ', $values)}</li>"}
                                {/if}
                            {/if}

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