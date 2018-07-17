{if $filter = $modx->getObject('catalogFilter', ['tv_key'=> $tv])}
    {if $filterValues = $filter->getMany('FilterValues')}

        <ul class="sidenav--inner">

            {foreach $filterValues as $data}
                {if $data->res_id}
                    {if $resource = $modx->getObject('modResource', $data->res_id)}
                        <li>
                            <a href="{$resource->uri}">{$resource->menutitle|default:$resource->pagetitle}</a>
                        </li>

                    {/if}
                {/if}
            {/foreach}

        </ul>

    {/if}
{/if}