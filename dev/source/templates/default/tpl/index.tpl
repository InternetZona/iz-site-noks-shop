<!DOCTYPE html>
<html>
<head>
    {snippet name="SEOManager"}
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="{$template_url}css/style.css?{filemtime(MODX_BASE_PATH|cat:$template_url|cat:'css/style.css')}"  media="screen, projection" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link type="text/css" rel="stylesheet" href="{$template_url}css/izstyle.css?{filemtime(MODX_BASE_PATH|cat:$template_url|cat:'css/izstyle.css')}"  media="screen,projection"/>
    <script src="{$template_url}js/jquery-3.3.1.js?{filemtime(MODX_BASE_PATH|cat:$template_url|cat:'js/jquery-3.3.1.js')}"></script>
    <script async src="{$template_url}plugins/magnific/js/magnific.js?{filemtime(MODX_BASE_PATH|cat:$template_url|cat:'plugins/magnific/css/magnific.js')}"></script>
    <link type="text/css" rel="stylesheet" href="{$template_url}plugins/magnific/css/magnific.css?{filemtime(MODX_BASE_PATH|cat:$template_url|cat:'plugins/magnific/css/magnific.css')}"  media="screen,projection"/>
    <script async src="{$template_url}js/izscripts.js?{filemtime(MODX_BASE_PATH|cat:$template_url|cat:'js/izscripts.js')}"></script>
    {if {field name=pagetitle}|strpos:"Кухни" !== false ||
    {field name=pagetitle}|strpos:"Кухня" !== false ||
    {field name=pagetitle}|strpos:"кухни" !== false ||
    {field name=pagetitle}|strpos:"Стол" !== false ||
    {field name=pagetitle}|strpos:"Стул" !== false ||
    {field name=pagetitle}|strpos:"Обеденные" !== false ||
    {field name=pagetitle}|strpos:"Бытовая техника" !== false ||
    {field name=pagetitle}|strpos:"Духовой шкаф" !== false ||
    {field name=pagetitle}|strpos:"Посудомоечная машина" !== false ||
    {field name=pagetitle}|strpos:"Микроволновая печь" !== false ||
    {field name=pagetitle}|strpos:"Вытяжка" !== false ||
    {field name=pagetitle}|strpos:"Сиденье" !== false ||
    {field name=pagetitle}|strpos:"поверхность" !== false}
    <meta name="robots" content="noindex, nofollow">
    {else}
    <meta name="robots" content="index, follow">
    {/if}
    {literal}
        <!-- Facebook Pixel Code -->
        <script>
            !function(f,b,e,v,n,t,s)
            {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
                n.callMethod.apply(n,arguments):n.queue.push(arguments)};
                if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
                n.queue=[];t=b.createElement(e);t.async=!0;
                t.src=v;s=b.getElementsByTagName(e)[0];
                s.parentNode.insertBefore(t,s)}(window,document,'script',
                'https://connect.facebook.net/en_US/fbevents.js');
            fbq('init', '322420731278246');
            fbq('track', 'PageView');
        </script>
        <noscript>
            <img height="1" width="1"
                 src="https://www.facebook.com/tr?id=322420731278246&ev=PageView
&noscript=1"/>
        </noscript>
        <!-- End Facebook Pixel Code -->
        <script type="text/javascript">!function(){var t=document.createElement("script");t.type="text/javascript",t.async=!0,t.src="https://vk.com/js/api/openapi.js?160",t.onload=function(){VK.Retargeting.Init("VK-RTRG-315790-65PZK"),VK.Retargeting.Hit()},document.head.appendChild(t)}();</script><noscript><img src="https://vk.com/rtrg?p=VK-RTRG-315790-65PZK" style="position:fixed; left:-999px;" alt=""/></noscript>
        <!-- Facebook Pixel Code -->
        <script>
            !function(f,b,e,v,n,t,s)
            {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
                n.callMethod.apply(n,arguments):n.queue.push(arguments)};
                if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
                n.queue=[];t=b.createElement(e);t.async=!0;
                t.src=v;s=b.getElementsByTagName(e)[0];
                s.parentNode.insertBefore(t,s)}(window,document,'script',
                'https://connect.facebook.net/en_US/fbevents.js');
            fbq('init', '560782037781903');
            fbq('track', 'PageView');
        </script>
        <noscript>
            <img height="1" width="1"
                 src="https://www.facebook.com/tr?id=560782037781903&ev=PageView
&noscript=1"/>
        </noscript>
        <!-- End Facebook Pixel Code -->
    {/literal}
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
    {include file="components/modals/showcallback.tpl"}
    {include file="components/modals/feedback.tpl"}
    {include file="components/modals/order.project.tpl"}
    {include file="components/modals/order.visit.tpl"}
    {include file="components/modals/policy.tpl"}
    {include file="components/modals/calculation.tpl"}
{/block}

<script async src="{$template_url}js/app.js?{filemtime(MODX_BASE_PATH|cat:$template_url|cat:'js/app.js')}"></script>

{block name=js_inject}
    {chunk name="jsInject"}
{/block}
</body>
</html>