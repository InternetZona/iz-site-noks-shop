
{$row = ""}

{foreach $objects as $data}

    {if $data.tvs.{$tv}.value}

        {if $data.id == {field name=id}}
            {$row = $row|cat:'<li class="active"><a href="'|cat:$data.uri|cat:'">'|cat:$data.menutitle|default:$data.pagetitle|cat:'</a></li>'}
        {else}
            {$row = $row|cat:'<li><a href="'|cat:$data.uri|cat:'">'|cat:$data.menutitle|default:$data.pagetitle|cat:'</a></li>'}
        {/if}

    {/if}

{/foreach}

{if $row}

    <div class="dd-panel__title left-align">{$title}</div>

    <ul class="nav-inner">{$row}</ul>

{/if}