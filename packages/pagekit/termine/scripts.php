<?php

return [

    /*
     * Installation hook.
     */
    'install' => function ($app) {

        $util = $app['db']->getUtility();

        if ($util->tableExists('@termine_list') === false) {
            $util->createTable('@termine_list', function ($table) {
                $table->addColumn('id', 'integer', ['unsigned' => true, 'length' => 10, 'autoincrement' => true]);
                $table->addColumn('Title', 'string', ['length' => 255, 'default' => '']);                
				$table->addColumn('Description', 'string', ['length' => 255, 'default' => '']);      
				$table->addColumn('Date', 'date', ['length' => 255]);
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

        if ($util->tableExists('@termine_list')) {
            $util->dropTable('@termine_list');
        }

    },

    /*
     * Runs all updates that are newer than the current version.
     *
     */
    'updates' => [

        '0.5.0' => function ($app) {

        },

        '0.9.0' => function ($app) {

        },

    ],

];