{extends file="basepage.tpl"}

{block name=main}
    <div class="section container">

        <div class="row">
            <div class="col l9 push-l3">
                {snippet name="BreadCrumb@BreadCrumb"}
                <h1>{field name=pagetitle}</h1>

                <div class="section page__content">

                    <div class="content-wrapper">

                        <div class="image-wrapper">
                            <img  src="{tv name=image}" class="responsive-img">
                        </div>

                        {field name=content}
                    </div>

                </div>

            </div>

            <div class="col l3 pull-l9">
                {include file="components/menu/folder.tpl" title="Другие коллекции" parent={field name=parent}}
            </div>
        </div>
        {if {tv name=button_id}}
        <div class="center-align"><a href="{$modx->makeUrl({tv name=button_id})}" class="button-action width_auto">Смотреть коллекцию</a></div>
        {/if}
    </div>

    {block name=aside}{/block}
{/block}