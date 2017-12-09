<!DOCTYPE html> 
<html> 
    <head> <link rel="stylesheet" type="text/css" href="css/main.css"> <link rel="stylesheet" type="text/css" href="css/loginForm.css">
        <link rel="stylesheet" type="text/css" href="css/search.css">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
        <script type="text/javascript" src="js/search.js"></script>
        <script type="text/javascript" src="js/back.js"></script>
        <script type="text/javascript" src="js/review.js"></script>
        <div id="phpScripts"></div>
        <title>eHandy</title>
    </head>

    <div class="" id="blurable">
        <!-- Login Buttons -->
        <div class="btn-padding">
            <div class="btn-group">
                <button onClick="showLogin()">Log in</button>
                <button onClick="showSignup()">Sign up</button>
            </div>
        </div>

        <div class="titlePadding" >
            <button class="title blankButton" onClick="reloadPage()">eHandy</button>
        </div>

        <div class="search-padding">
            <input id="search-bar" type="text" name="search-bar" class="search-bar" placeholder="Search" onkeydown="search(this)">
        </div>
    

        <div id="display">
		</div>

    </div>
  
    <div id="login" class="modal">
        <span onclick="removeLogin()" class="close" title="Close Modal">&times;</span>
        <form class="modal-content animate" action="<?=$_SERVER['PHP_SELF']?>" id="loginform" >
            <div class="container" >
				<label><p><b style="font-size:150%;">Log in</b></p></label>
                <label><b>Username</b></label>
                <input class="formInput" type="text" placeholder="Enter Username" name="suname" required>
                <label><b>Password</b></label>
                <input class="formInput" type="password" placeholder="Enter Password" name="spsw" required>
                <button id="loginbutton" class="formButton" type="submit" name="login" value-"OK">Login</button>
            </div> 
            <div class="container" style="background-color:#f1f1f1">
                <button id="logincancel" class="formButton cancelbtn" type="button" onClick="removeLogin()">Cancel</button>
            </div>
        </form>
    </div>

    <div id="signup" class="modal">
        <span onclick="removeSignup()" class="close" title="Close Modal">&times;</span>
        <form method="post" class="modal-content animate" action="<?=$_SERVER['PHP_SELF']?>" id="signupform">
            <div class="container">
				<label><p><b style="font-size:150%;">Sign up</b></p></label>
                <label><b>Username</b></label>
                <input class="formInput" type="text" placeholder="Enter Username" name="uname" required>
                <label><b>Fullname</b></label>
                <input class="formInput" type="text" placeholder="Enter Fullname" name="fname" required>
                <label><b>E-mail</b></label>
                <input class="formInput" type="email" placeholder="Enter E-mail" name="email" required>
                <label><b>Password</b></label>
                <input class="formInput" type="password" placeholder="Enter Password" name="psw" required>
                <label><b>Confirm Password</b></label>
                <input class="formInput" type="password" placeholder="Confirm Password" name="cpsw" required>
				<div class="radio-wrapper">
					<div class="toggle_radio">
						<input type="radio" class="toggle_option" id="first_toggle" name="toggle_option">
						<input type="radio" checked class="toggle_option" id="second_toggle" name="toggle_option">
						<label for="first_toggle"><p>Home Owner</p></label>
						<label for="second_toggle" style="margin-right: 0;"><p>Business Owner</p></label>
					<div class="toggle_option_slider">
					</div>
					</div>
				</div>
                <button id="signupbutton" class="formButton" type="submit" name="signup" value="OK">Signup</button>
            </div> 
            <div class="container" style="background-color:#f1f1f1">
                <button id="signupcancel" class="formButton cancelbtn" type="button" onClick="removeSignup()">Cancel</button>
                <span id="signuppw" class="psw"></span> 
            </div>
        </form>
    </div>

    <div id="info" class="modal" >
        <span onclick="removeInfo()" class="close" title="Close Modal">&times;</span>
		<form class="modal-content animate" id="infoform" style="width: 60%;">
            <div id="infoLoc" class="container">
				<p>
                    <img src="pictures/1111.jpg" class="infoimage">
                    <b id="infoName" style="font-size:150%;">PlumbingX Co.</b>
                </p>
				<p><b>Phone Number: </b><a id="infoPhone" href="#" >(714)-371-1182</a></p>
				<p><b>E-mail: </b><a id="infoEmail" href="#" >example@gmail.com</a></p>
            </div> 
            <div class="container" style="background-color:#f1f1f1">
                <button id="infocancel" class="formButton cancelbtn" type="button" onClick="removeInfo()">Close</button>
                <button class="formButton cancelbtn" style="background-color:#2020f4" type="button" onClick="removeInfo()">Contact</button>
            </div>
            <div class="container" >
                <p style="font-size:150%;margin-bottom: 0px;"><b>Reviews</b></p>
                <hr>
                <div id="reviews">
                </div>
            </div>
        </form>
    </div>

	<script type="text/javascript">
        setTimeout(initBar(),3000);
		setPopupClose();
		//setRunawayButton();
	</script> 

</html>

<?php
    error_reporting(E_ALL);
    ini_set('display_errors',1);
    include_once 'php/helper/common.php';
    include_once 'php/helper/db.php';
    session_start();
    msg("Checking if _POST is available");
    if(isset($_POST['signup'])):
        msg("Found post");
        msg("User: '$_POST[uname]'");
        msg("Name: '$_POST[fname]'");
        msg("Email: '$_POST[email]'");
        msg("Password: '$_POST[psw]'");
        msg("Option: '$_POST[toggle_option]'");
        $db = dbConnect('eHandy');
        if($_POST['uname']=='' or $_POST['fname']=='' or $_POST['email']=='' or $_POST['psw']==''){
            unset($_POST);
            error('One or more required fields were left blank.\nPlease fill them in and try again');
            exit;
        }
        $sql = "SELECT COUNT(*) FROM User WHERE user = '$_POST[uname]'";
        $result = $db->query($sql);
        if(!$result){
            unset($_POST);
            error('A database error occurred in processing your submission.\n');
            exit;
        }else if($result->fetch_assoc()["COUNT(*)"]>0){
            unset($_POST);
            error('A user already exists with your chosen userid.\nPlease try another.');
            exit;
        }else{
            //Insert into User
            $sql = "INSERT INTO User SET
                user = '$_POST[uname]',
                psw = PASSWORD('$_POST[psw]'),
                type = 'homeowner'";
            if(!$db->query($sql)){
                unset($_POST);
                error('A database error occurred in processing your submission');
                exit;
            }
            
            //Get new ID
            $sql = "SELECT id FROM User WHERE user = '$_POST[uname]'";
            $result = $db->query($sql);
            if(!$result){
                //Delete from User if failed
                $sql = "DELETE FROM User WHERE user = '$_POST[uname]'";
                $db->query($sql);
                unset($_POST);
                error('A database error occurred in processing your submission.\n');
                exit;
            }
            $id = $result->fetch_assoc()["id"];
            
            //Insert into Homeowner
            $sql = "INSERT INTO Homeowner SET
                hName = '$_POST[fname]',
                hWebId = '$id'";
            if(!$db->query($sql)){
                //Delete from User if failed
                $sql = "DELETE FROM User WHERE user = '$_POST[uname]'";
                $db->query($sql);
                unset($_POST);
                error('A database error occurred in processing your submission');
                exit;
            }
            
            msg("Success!");
            unset($_POST);
        }
        unset($_POST);
    endif;
    $uname = isset($_POST['suname']) ? $_POST['suname'] : $_SESSION['uname'];
    $psw = isset($_POST['spsw']) ? $_POST['spsw'] : $_SESSION['psw'];
    if(!isset($uid)){
        //Not signed in
    }
    //Check if uname and psw are valid
    $_SESSION['uname'] = $uname;
    $_SESSION['psw'] = $psw;
    $db = dbConnecct("eHandy");
    $sql = "SELECT id FROM User WHERE user = '$uid' AND psw = PASSWORD('$psw')";
    $result = $db->query($sql);
    if(!result){
        unset($_POST);
        unset($_SESSION['uname']);
        unset($_SESSION['psw']);
        error('A database error occured while checking your login details');
        exit;
    }
    if($result->num_rows==0){
        unset($_POST);
        unset($_SESSION['uname']);
        unset($_SESSION['psw']);
        error('Your username or password is incorrect.');
        exit;
    }
    //Logged in

?>