<?php

return [

    'name' => 'termine/table',

    'label' => 'Termin Table',

    'render' => function ($widget) use ($app) {
        $user = $app::user();

        if(!$user->hasAccess("termine: see intern")){
            $termine = $app::db()->createQueryBuilder()->select('*')->from('@termine_list')->where('intern = 0')->orderBy('date')->execute()->fetchAll();
        }
        else{
            $termine = $app::db()->createQueryBuilder()->select('*')->from('@termine_list')->orderBy('date')->execute()->fetchAll();

        }
        return $app['view']->render('termine/widget-table.php', compact('widget','termine'));
        
    },

    'events' => [

        'view.scripts' => function ($event, $scripts) {
            $scripts->register('widget-table', 'termine:app/bundle/table.js', '~widgets');
        }

    ]

];
