<ul class="sidenav" id="mobile-menu">

    <li class="sidenav__header">
        <a href="#" class="sidenav__close right">
            <i class="fas fa-times"></i>
        </a>
    </li>
    {snippet name="Wayfinder" params=[
        'startId'   => 23,
        'outerTpl'  => 'wf.outer.tpl',
        'level'     => 1
    ]}

    {snippet name="Wayfinder" params=[
        'startId'   => 0,
        'where'     => '[{"id:not in":[1,23,924]}]',
        'outerTpl'  => 'wf.outer.tpl',
        'level'     => 1
    ]}
</ul>