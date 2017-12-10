<?php //db.php
    $dbhost = "localhost";
    $dbuser = "ehandler";
    $dbpass = "ehandpass";

    function dbConnect($db=""){
        global $dbhost, $dbuser, $dbpass;
        msg("Connecting to mysql...");
        $dbcnx = new mysqli($dbhost, $dbuser, $dbpass, $db);
        if(!$dbcnx){
            msg("Database unavailable");
        }
	    if($dbcnx->connect_error){
		    die("Connection failed: ".$dbcnx->connect_error);
	    }
        return $dbcnx;
    }