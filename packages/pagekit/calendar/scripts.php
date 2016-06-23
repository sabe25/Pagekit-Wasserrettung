<?php

return [

    /*
     * Installation hook.
     */
    'install' => function ($app) {

        $util = $app['db']->getUtility();

        if ($util->tableExists('@calendar_events') === false) {
            $util->createTable('@calendar_events', function ($table) {
                $table->addColumn('id', 'integer', ['unsigned' => true, 'length' => 10, 'autoincrement' => true]);
                $table->addColumn('title', 'string', ['length' => 255, 'default' => '']);      
                $table->addColumn('description', 'string', ['length' => 255, 'default' => '']);                          
				$table->addColumn('allDay', 'boolean');      
				$table->addColumn('start', 'date', ['length' => 255]);
                $table->addColumn('end', 'date', ['length' => 255]);
                $table->addColumn('url', 'string', ['length' => 255, 'default' => '']);      
                $table->addColumn('className', 'string', ['length' => 255, 'default' => '']);    
                $table->addColumn('editable', 'boolean'); 
                $table->addColumn('startEditable', 'boolean');
                $table->addColumn('durationEditable', 'boolean');  
                $table->addColumn('overlap', 'boolean'); 
                $table->addColumn('color', 'string', ['length' => 255, 'default' => '']);                                                                                                  
                $table->setPrimaryKey(['id']);
            });
        }

    },

    /*
     * Enable hook
     *
     */
    'enable' => function ($app) {

    },

    /*
     * Uninstall hook
     *
     */
    'uninstall' => function ($app) {

        // remove the config
        $app['config']->remove('hello');

        $util = $app['db']->getUtility();

        if ($util->tableExists('@calendar_events')) {
            $util->dropTable('@calendar_events');
        }

    },

    /*
     * Runs all updates that are newer than the current version.
     *
     */
    'updates' => [

        '2.0.0' => function ($app) {
           }

    ],

];