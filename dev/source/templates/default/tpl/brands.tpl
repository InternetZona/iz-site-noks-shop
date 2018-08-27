{extends file="tpl/blog.tpl"}

{block name=content_grid}
    <ul class="brand-list">
        {foreach $result.object as $object}

            <li class="brand-list__item">
                {include file="components/brands/list.tpl" object=$object}
            </li>

        {/foreach}
    </ul>
{/block}