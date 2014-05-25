<?php
    require './php-activerecord/ActiveRecord.php';
    ActiveRecord\Config::initialize(function ($cfg)
    {
        $cfg->set_model_directory("models");
        $cfg->set_connections( array(
                "development" => "sqlite://./exdb.sqlite3",
                "test" => "sqlite://exdb.sqlite3",
                "production" => "sqlite://exdb.sqlite3"
            )
        );
    });

?>
