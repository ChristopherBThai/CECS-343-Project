<?php
	include_once 'helper/common.php';
	include_once 'helper/db.php';
	session_start();

	if(!isset($_SESSION)){
		alert("Please log in first");
		exit;
	}

	//Check if logged in
	$conn = dbConnect("eHandy");
	
	msg("Checking user session");
        $sql = "SELECT id FROM User WHERE user = '$_SESSION[uname]' AND psw = PASSWORD('$_SESSION[psw]')";
        $result = $conn->query($sql);
	if($result->num_rows==0){
		alert("Please log in first");
		exit;
	}
	$hID = $result->fetch_assoc()["id"];
	
	$review = $_POST["review"];
	$star = $_POST["star"];
	$bName = $_POST["bid"];
    $anon = $_POST["anon"];

	$sql = "SELECT bWebID,typeName FROM Business NATURAL JOIN BusinessType WHERE bName = '$bName'";

	msg("Grabbing business id");
	$result = $conn->query($sql);

	$result = $result->fetch_assoc();

	$bID = $result["bWebID"];
	$type = $result["typeName"];

        $sql = "INSERT INTO Review SET
		hWebID = '$hID',
		bWebID = '$bID', 
		typeName = '$type',
		dateReview = CURRENT_TIMESTAMP,
		rAnonymous = '$anon',
		reviewStars = '$star',
		rDetails = '$review'";
	
	$sql = "INSERT INTO Review(hWebID,bWebID,typeName,dateReview,reviewStars,rAnonymous,rDetails) VALUES (
		'$hID','$bID','$type',CURRENT_TIMESTAMP,'$star','$anon','$review');";
		
	msg("Inserting to sql");
	$result = $conn->query($sql);

    $q = $bName;
    include 'info.php';

    mysqli_close($conn);
?>
