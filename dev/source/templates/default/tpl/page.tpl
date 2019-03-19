{extends file="basepage.tpl"}

{block name=page_content}
        <div class="content-wrapper">
            {field name=content}
        </div>
<div class="row">
    <div class="container">
        {if {field name=id} == 2}
            <a href="#modal-order-visit" class="button-action modal-trigger col s6 m3 l2" onclick="yaCounter49093180.reachGoal('zamer');">
                <i class="icon icon--ruler"></i>
                Заказать замер</a>
        {elseif {field name=id} == 3}
            <a href="#modal-order-project" class="button-action modal-trigger col s6 m3 l2" onclick="yaCounter49093180.reachGoal('proekt');">
                <i class="icon icon--project"></i>
                Заказать проект</a>
        {elseif {field name=id} == 4 || {field name=id} == 5 || {field name=id} == 6 || {field name=id} == 78 || {field name=id} == 659}
            <a href="#modal-callback" class="button-action modal-trigger col s8 m3 l2 margin20" onclick="yaCounter49093180.reachGoal('call');">
                <i class="icon material-icons">phone</i>
                Заказать звонок</a>
            <a href="#modal-feedback" class="button-action modal-trigger col s8 m3 l2 margin20" onclick="yaCounter49093180.reachGoal('soob');">
                <i class="icon material-icons">mail</i>
                Написать</a>
        {elseif {field name=id} == 80}
            <a href="#modal-callback" class="button-action modal-trigger col s8 m3 l2 margin20" onclick="yaCounter49093180.reachGoal('call');">
                <i class="icon material-icons">phone</i>
                Заказать звонок</a>
            <a href="#modal-feedback" class="button-action modal-trigger col s8 m3 l2 margin20" onclick="yaCounter49093180.reachGoal('soob');">
                <i class="icon material-icons">mail</i>
                Написать</a>
            <a href="#modal-order-visit" class="button-action modal-trigger col s8 m3 l2 margin20" onclick="yaCounter49093180.reachGoal('zamer');">
                <i class="icon icon--ruler"></i>
                Заказать замер</a>
        {/if}
        {if {field name=id} == 6}<div class="col l12"><a href="{$modx->makeUrl(966)}">Вакансии ООО "НОКС МЕБЕЛЬ</a></div>{/if}
</div>
</div>
{/block}