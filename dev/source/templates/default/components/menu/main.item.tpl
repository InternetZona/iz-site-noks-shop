<div class="dd-panel__title left-align">{$title}</div>

<ul class="nav-inner">

    {foreach $objects as $data}

        {if $data.tvs.{$tv}.value}

            {if $data.id == {field name=id}}
                <li class="active">
                    <a href="{$data.uri}">{$data.menutitle|default:$data.pagetitle}</a>
                </li>
            {else}
                <li>
                    <a href="{$data.uri}">{$data.menutitle|default:$data.pagetitle}</a>
                </li>
            {/if}

        {/if}

    {/foreach}
</ul>