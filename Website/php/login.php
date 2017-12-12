<?php
    $uname = isset($_POST['suname']) ? $_POST['suname'] : $_SESSION['uname'];
    $psw = isset($_POST['spsw']) ? $_POST['spsw'] : $_SESSION['psw'];
	if(isset($_GET['logout'])){
		//Logs user out
		logout();
	}else if(!isset($uname)){
        //Not signed in
        msg("'$uname'");
    }else{
        //Check if uname and psw are valid
        $_SESSION['uname'] = $uname;
        $_SESSION['psw'] = $psw;
        $db = dbConnect("eHandy");
        $sql = "SELECT id FROM User WHERE user = '$uname' AND psw = PASSWORD('$psw')";
        $lresult = $db->query($sql);
        if(!$lresult){
			//Database error
            unset($_POST);
            unset($_SESSION['uname']);
            unset($_SESSION['psw']);
            error('A database error occured while checking your login details');
        }else if($lresult->num_rows==0){
			//Not a valid username/password
            unset($_POST);
            unset($_SESSION['uname']);
            unset($_SESSION['psw']);
			mysqli_close($lresult);
			unset($lresult);
            error('Your username or password is incorrect.');
		}else{
			//Logged in
			unset($_POST);
			msg("Logged in");
			$id = $lresult->fetch_assoc()["id"];
			$sql = "SELECT hName FROM Homeowner WHERE hWebID = '$id'";
			$lresult = $db->query($sql);
			if($lresult){
				msg("logged in");
				//Display welcome
				//welcome($lresult->fetch_assoc()["hName"]);
			}else{
				unset($_POST);
				unset($_SESSION['uname']);
				unset($_SESSION['psw']);
				error('A database error occured while checking your login details');
			}
		}
    }

	function logout(){
		$_SESSION = array();
		session_destroy();
		session_start();
	}
?>
