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
    'name' => 'calendar',

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

        'Pagekit\\Calendar\\' => 'src'

    ],

    /*
     * Define nodes. A node is similar to a route with the difference
     * that it can be placed anywhere in the menu structure. The
     * resulting route is therefore decalendard on runtime.
     */
    'nodes' => [

        'calendar' => [

            // The name of the node route
            'name' => '@calendar',

            // Label to display in the backend
            'label' => 'Calendar',

            // The controller for this node. Each controller action will be mounted
            'controller' => 'Pagekit\\Calendar\\Controller\\SiteController',

            // A unique node that cannot be deleted, resides in "Not Linked" by default
            'protected' => true

        ]

    ],


    /*
     * Define routes.
     */
    'routes' => [

        '/calendar' => [
            'name' => '@calendar/admin',
            'controller' => [
                'Pagekit\\Calendar\\Controller\\CalendarController'
            ]
        ],
        '/api/calendar' => [
            'name' => '@calendar/api',
            'controller' => [
                'Pagekit\\Calendar\\Controller\\CalendarAPIController'
            ]
        ]

    ],

    /*
     * Define menu items for the backend.
     */
    'menu' => [

        // name, can be used for menu hierarchy
        'calendar' => [

            // Label to display
            'label' => 'Calendar',

            // Icon to display
            'icon' => 'calendar:icon.svg',

            // URL this menu item links to
            'url' => '@calendar/admin',

            // Optional: Expression to check if menu item is active on current url
            // 'active' => '@hello*

            // Optional: Limit access to roles which have specific permission assigned
            'access' => 'calendar: editor'
        ],

        'calendar: panel' => [

            // Parent menu item, makes this appear on 2nd level
            'parent' => 'calendar',

            // See above
            'label' => 'calendar',
            'icon' => 'calendar:icon.svg',
            'url' => '@calendar/admin'
            // 'access' => 'hello: manage hellos'
        ],

        'calendar: settings' => [
            'parent' => 'calendar',
            'label' => 'Settings',
            'url' => '@calendar/admin/settings',
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
        'calendar: manage settings' => [
            'title' => 'Manage settings'
        ],
        'calendar: api access' => [
            'title' => 'Permission to use the Calendar API'
        ],
        'calendar: see intern' => [
            'title' => 'Can see intern Temine'
        ],
    ],

    /*
     * Link to a settings screen from the extensions listing.
     */
    'settings' => '@calendar/admin/settings',

    /*
     * Default module configuration.
     * Can be overwritten by changed config during runtime.
     */
    'config' => [

        'default' => 'World'

    ],

    /*
     * Listen to events.
     */
    'events' => [

        'view.scripts' => function ($event, $scripts) {
            $scripts->register('calendar-link', 'calendar:app/bundle/link.js', '~panel-link');
            $scripts->register('calendar-dashboard', 'calendar:app/bundle/dashboard.js', '~dashboard');

        }

    ]

];
