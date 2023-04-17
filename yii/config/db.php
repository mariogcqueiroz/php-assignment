<?php

return [
    'class' => 'yii\db\Connection',
    'dsn' => 'pgsql:host=db;dbname='.DB_DATABASE,
    'username' => DB_USER,
    'password' => DB_PASSWORD,
    'charset' => 'utf8',

    // Schema cache options (for production environment)
    //'enableSchemaCache' => true,
    //'schemaCacheDuration' => 60,
    //'schemaCache' => 'cache',
];
