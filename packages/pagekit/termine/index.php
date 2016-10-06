<?php

use Pagekit\Application;

/*
 * This array is the module definition.
 * It's used by Pagekit to load your extension and register all things
 * that your extension provides (routes, menu items, php classes etc)
 */
return [

    /*
     * Define a unique name.
     */
    'name' => 'termine',

    /*
     * Define the type of this module.
     * Has to be 'extension' here. Can be 'theme' for a theme.
     */
    'type' => 'extension',

    /*
     * Main entry point. Called when your extension is both installed and activated.
     * Either assign an closure or a string that points to a PHP class.
     * Example: 'main' => 'Pagekit\\Hello\\HelloExtension'
     */
    'main' => function (Application $app) {

        // bootstrap code

    },

    /*
     * Register all namespaces to be loaded.
     * Map from namespace to folder where the classes are located.
     * Remember to escape backslashes with a second backslash.
     */
    'autoload' => [

        'Pagekit\\Termine\\' => 'src'

    ],

    /*
     * Define nodes. A node is similar to a route with the difference
     * that it can be placed anywhere in the menu structure. The
     * resulting route is therefore determined on runtime.
     */
    'nodes' => [

        'termine' => [

            // The name of the node route
            'name' => '@termine',

            // Label to display in the backend
            'label' => 'Termine',

            // The controller for this node. Each controller action will be mounted
            'controller' => 'Pagekit\\Termine\\Controller\\SiteController',

            // A unique node that cannot be deleted, resides in "Not Linked" by default
            'protected' => true

        ]

    ],


    /*
     * Define routes.
     */
    'routes' => [

        '/termine' => [
            'name' => '@termine/admin',
            'controller' => [
                'Pagekit\\Termine\\Controller\\TerminController'
            ]
        ]

    ],

    /*
     * Define menu items for the backend.
     */
    'menu' => [

        // name, can be used for menu hierarchy
        'termine' => [

            // Label to display
            'label' => 'Termine',

            // Icon to display
            'icon' => 'additional/icons/svg/tasks.svg',

            // URL this menu item links to
            'url' => '@termine/admin',

            // Optional: Expression to check if menu item is active on current url
            // 'active' => '@hello*'

            // Optional: Limit access to roles which have specific permission assigned
            'access' => 'termine: editor'
        ],

        'termine: panel' => [

            // Parent menu item, makes this appear on 2nd level
            'parent' => 'termine',

            // See above
            'label' => 'Termine',
            'icon' => 'additional/icons/svg/tasks.svg',
            'url' => '@termine/admin'
            // 'access' => 'hello: manage hellos'
        ],

        'termine: settings' => [
            'parent' => 'termine',
            'label' => 'Settings',
            'url' => '@termine/admin/settings',
            'access' => 'system: manage settings'
        ]

    ],

    /*
     * Define permissions.
     * Will be listed in backend and can then be assigned to certain roles.
     */
    'permissions' => [

        // Unique name.
        // Convention: extension name and speaking name of this permission (spaces allowd)
        'termine: manage settings' => [
            'title' => 'Manage settings'
        ],
        'termine: editor' => [
            'title' => 'Permission to create, update and delete Termine'
        ],
        'termine: see intern' => [
            'title' => 'Can see intern Temine'
        ],
    ],

    /*
     * Link to a settings screen from the extensions listing.
     */
    'settings' => '@termine/admin/settings',

    /*
     * Default module configuration.
     * Can be overwritten by changed config during runtime.
     */
    'config' => [

        'default' => 'World'

    ],

    'widgets' => [

        'widgets/termin-table.php'

    ],
    /*
     * Listen to events.
     */
    'events' => [

        'view.scripts' => function ($event, $scripts) {
            $scripts->register('termine-link', 'termine:app/bundle/link.js', '~panel-link');
            $scripts->register('termine-dashboard', 'termine:app/bundle/dashboard.js', '~dashboard');

        }

    ]

];
