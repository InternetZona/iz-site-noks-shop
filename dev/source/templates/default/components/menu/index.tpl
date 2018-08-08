<div class="menu__title">{$title}</div>
<ul class="menu">
    {snippet name="Wayfinder" params=[
        'startId'   => $parent
        ,'includeDocs'  => $ids
        ,'outerTpl' => 'wf.outer.tpl'
        ,'ignoreHidden'   => $showhidden|default:0
    ]}
</ul>