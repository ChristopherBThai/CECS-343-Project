<?php
    include_once 'helper/common.php';
    include_once 'helper/db.php';
    //PHP to get all the businesses baseded off their name and types
    $review = $_POST["review"];
    $star = $_POST["star"];

	$conn = dbConnect("eHandy");
	
       // $sql = "INSERT INTO Review SET
//		hWebID = '$hID',
//		bWebId = '$bID', 
//		typeName = '$type',
//		datereview = CURRENT_TIMESTAMP,
//		rAnonymous = 'y',
//		reviewStars = '$star',
//		rDetails = '$review'";
		
	//$result = $conn->query($sql);

	pop("Your review '$review' is being reviewed.");

    mysqli_close($conn);
?>
