<div class="filter-wrapper">
    <ul class="filter">
        {if $productFilters}
            {foreach $productFilters as $productFilter}

                {if $filter = $productFilter->getOne('Filter')}

                    {if $productFilter->product_type_id == 2}
                        {$excludeFilterIds = [9]}

                        {elseif $productFilter->product_type_id == 3}
                        {$excludeFilterIds = [9]}

                    {/if}

                    {if !$filter->hideonfilter && !in_array($filter->id, $excludeFilterIds|default:[])}

                        <li class="filter__item">
                            <select name="filter[{$filter->tv_key}]" class="filter__control">
                                <option value="" selected>Все</option>
                                {if $filterValues = $filter->getMany('FilterValues')}

                                    {$lock = false}

                                    {foreach $filterValues as $data}

                                        {$q = $modx->newQuery('modResource')}
                                        {$q->leftJoin('modTemplateVar', 'tv', "tv.name = '{$filter->tv_key}'")}

                                        {if $filter->multiple == 'listbox-multiple'}
                                            {$q->innerJoin('modTemplateVarResource', 'ResourceTV', "ResourceTV.contentid = modResource.id AND ResourceTV.tmplvarid = tv.id AND find_in_set('{$data->id}', replace(ResourceTV.value, '||', ','))")}
                                        {else}
                                            {$q->innerJoin('modTemplateVarResource', 'ResourceTV', "ResourceTV.contentid = modResource.id AND ResourceTV.tmplvarid = tv.id AND ResourceTV.value = {$data->id}")}
                                        {/if}

                                        {$q->where([
                                            'template'  => $productType->template_id
                                        ])}

                                        {if $modx->getCount('modResource', $q)}
                                            {$selected = ''}

                                            {if !$lock }
                                                {if $smarty.get.filter.{$filter->tv_key} == $data->id}
                                                    {$selected = 'selected'}
                                                    {$lock = true}
                                                {elseif $modx->resource->getTVValue($filter->tv_key) == $data->id}
                                                    {$selected = 'selected'}
                                                {/if}
                                            {/if}

                                            <option value="{$data->id}" {$selected}>{$data->name}</option>
                                        {/if}
                                    {/foreach}
                                {/if}
                            </select>
                            <label class="filter__label">{$filter->name}</label>
                        </li>

                    {/if}

                {/if}

            {/foreach}
        {/if}
        <li class="filter__item">

            {$url = ({field name=parent} != 23) ? $modx->makeUrl({field name=parent}) : $modx->makeUrl({field name=id}) }

            <a href="{$url}" class="button-reset" onclick="yaCounter49093180.reachGoal('filtr');">Сбросить фильтр</a>
        </li>
    </ul>
</div>