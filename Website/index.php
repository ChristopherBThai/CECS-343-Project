<?php 
    session_start();
    include_once 'php/helper/common.php';
    include_once 'php/helper/db.php';
    if(isset($_POST['signup'])):
        include 'php/signup.php';
    endif;
    include 'php/login.php';
?>

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
            <div id="buttons" class="btn-group">
                <button onClick="showLogin()"><b>Log in</b></button>
                <button onClick="showSignup()"><b>Sign up</b></button>
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
        <form method="post" class="modal-content animate" action="<?=$_SERVER['PHP_SELF']?>" id="loginform" >
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
        <span id="infocancel" onclick="removeInfo()" class="close" title="Close Modal">&times;</span>
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
		<textarea type="text" id="reviewtext" class="reviewtext" ></textarea>
		<div id="ratingsForm">
			<div id="starrating" class="stars starrating">
				<input type="radio" name="star" class="star-1" id="star-1" />
				<label class="star-1" for="star-1">1</label>
				<input type="radio" name="star" class="star-2" id="star-2" />
				<label class="star-2" for="star-2">2</label>
				<input type="radio" name="star" class="star-3" id="star-3" />
				<label class="star-3" for="star-3">3</label>
				<input type="radio" name="star" class="star-4" id="star-4" />
				<label class="star-4" for="star-4">4</label>
				<input type="radio" name="star" class="star-5" id="star-5" />
				<label class="star-5" for="star-5">5</label>
				<span></span>
			</div>
		</div>
                <b id="anontext" class="anon">Anonymously?</b>
                <input type="checkbox" id="anonbox" class="anon">
                <button id="reviewbutton" class="formButton reviewbtn" type="button" onClick="createReviewBox()" style="margin-top:0px">Write Review</button>
		<br>
		<br>
            </div>
            <div class="container" >
                <p id="reviewtitle" style="font-size:150%;margin-bottom: 0px;"><b>Reviews</b></p>
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
    if($lresult){
        welcome($lresult->fetch_assoc()["hName"]);
    }
?>

