<?php

return [
    'class' => 'yii\db\Connection',
    'dsn' => 'pgsql:host='.getenv('DBHOST').';dbname='.getenv('DBNAME'),
    'username' => trim(getenv('DBUSER')),
    'password' => trim(getenv('DBPASS')),

    // Schema cache options (for production environment)
    //'enableSchemaCache' => true,
    //'schemaCacheDuration' => 60,
    //'schemaCache' => 'cache',
];
