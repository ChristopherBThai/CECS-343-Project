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

    function loggedIn(){
        $db = dbConnect();
        msg("Checking if logged in...");
        $sql = "SELECT COUNT(*) FROM User WHERE user = '$_SESSION[uname]' AND psw = PASSWORD('$_SESSION[psw]')";
        $result = $conn->query($sql);
	    if($result->num_rows==0){
            msg("Not logged in")
		    return false;
	    }
        msg("Logged in!");
        return false
    }
    
?>
