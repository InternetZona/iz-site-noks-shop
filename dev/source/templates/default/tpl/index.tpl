<!DOCTYPE html>
<html>
<head>
    {snippet name="SEOManager"}
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="{$template_url}css/style.css?{filemtime(MODX_BASE_PATH|cat:$template_url|cat:'css/style.css')}"  media="screen, projection" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>

<body class="page page--footer-sticky">

{block name=main}
    <div class="main">
        {include file="components/header/index.tpl"}
        {include file="components/navbar/index.tpl"}

        {$smarty.block.child}

    </div>
{/block}

<a href="#" class="scroll-up">
    Наверх
</a>

{include file="components/footer/index.tpl"}
{include file="components/navbar/sidenav.tpl"}

{block name=modals}
    {include file="components/modals/callback.tpl"}
    {include file="components/modals/feedback.tpl"}
    {include file="components/modals/order.project.tpl"}
    {include file="components/modals/order.visit.tpl"}
    {include file="components/modals/policy.tpl"}
{/block}

<script async src="{$template_url}js/app.js?{filemtime(MODX_BASE_PATH|cat:$template_url|cat:'js/app.js')}"></script>

{block name=js_inject}
    <link type="text/css" rel="stylesheet" href="{$template_url}css/izstyle.css?{filemtime(MODX_BASE_PATH|cat:$template_url|cat:'css/izstyle.css')}"  media="screen,projection"/>
    <script src="{$template_url}js/jquery-3.3.1.js?{filemtime(MODX_BASE_PATH|cat:$template_url|cat:'js/jquery-3.3.1.js')}"></script>
    <script async src="{$template_url}js/izscripts.js?{filemtime(MODX_BASE_PATH|cat:$template_url|cat:'js/izscrpts.js')}"></script>
    {chunk name="jsInject"}
{/block}
</body>
</html>