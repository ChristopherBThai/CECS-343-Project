<?php //db.php
    $dbhost = "localhost";
    $dbuser = "ehandy";
    $dbpass = "jayden";

    function dbConnect($db=""){
        global $dbhost, $dbuser, $dbpass;
        msg("Connecting to mysql...");
        $dbcnx = new mysqli($dbhost, $dbuser, $dbpass, $db);
        if(!$dbcnx){
            msg("Database unavailable");
        }
        return $dbcnx;
    }