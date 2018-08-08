<div class="navigation__title">{$title}</div>
<ul class="navigation">
    {snippet name="Wayfinder" params=[
    'startId'   => $parent
    ,'outerTpl' => 'wf.outer.tpl'
    ,'level'    => 1
    ,'excludeDocs'  => {field name=id}
    ]}
</ul>