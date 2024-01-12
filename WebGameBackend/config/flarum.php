<?php

return [
    /*
     * Flarum url
     */
    'url' => env('FLARUM_URL', 'http://192.168.1.81' ),

    /*
     * Flarum session configuration
     */
    'session' => [
        /*
         * Name of the Flarum session cookie
         */
        'cookie' => env('FLARUM_SESSION_COOKIE', 'flarum_session'),

        /*
         * Absolute path to the session directory of Flarum
         */
        'path' => env('FLARUM_SESSION_PATH', base_path('./var/www/html/disscussion/storage/sessions')),
    ],

    /*
     * Flarum database connection as defined in config/database.php
     */
    'db_connection' => env('FLARUM_DB_CONNECTION', 'flarum'),
];
