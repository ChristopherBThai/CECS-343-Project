<?php
    //php that gets a business' info based off their name
    include_once 'helper/common.php';
    include_once 'helper/db.php';

    $q = $_GET["q"];
    
	$conn = dbConnect("eHandy");
	
    //Sets the name, picture, number, and email
	$sql = 'SELECT bPhoneNum,bEmail,bWebID FROM Business WHERE bName = "'.$q.'";';
	$result = $conn->query($sql);
    $id;
	if($result->num_rows>0){
		while($row = $result->fetch_assoc()){
            $id = $row["bWebID"];
            //Formats phone number         
			$pNum = $row["bPhoneNum"];
			$formatNum = '+1 ('.substr($pNum, 0, 3).') '.substr($pNum, 3, 3).'-'.substr($pNum, 6, 4);
            //Creates a javascript to change the info popup
			echo '<script>setInfo("'.$q.'","'.$formatNum.'","'.$row["bEmail"].'","'.$id.'");</script>';
		}
	}

    echo '<script>resetReviews();</script>';

    //Sets the name, picture, number, and email
	$sql = 'SELECT hWebID,dateReview,reviewStars,rAnonymous,rDetails FROM Review WHERE bWebID="'.$id.'";';
	$result = $conn->query($sql);
	if($result->num_rows>0){
        
        //Loops through all the reviews and displays them
		while($row = $result->fetch_assoc()){
            $name;
            if($row["rAnonymous"]=='y'){
                $sql = 'SELECT hName FROM Homeowner WHERE hWebID = "'.$row["hWebID"].'"';
                $nResult = $conn->query($sql);
                $name = $nResult->fetch_assoc()["hName"];
            }else{
                $name = "Anonymous";
            }
            echo '<script>addReview("'.$name.'","'.$row["dateReview"].'","'.$row["rDetails"].'","'.$row["reviewStars"].'");</script>';
		}
        
        //Sets the avg review score
        $sql = 'SELECT avg(reviewStars) FROM Review WHERE bWebID="'.$id.'";';
	    $result = $conn->query($sql);
		$avg = $result->fetch_assoc()["avg(reviewStars)"];
        echo '<script>setAvg("'.$avg.'")';
	}else{
        //If no reviews, display that
        echo '<script>noReviews();</script>';
        echo '<script>resetAvg();</script>';
    }

    mysqli_close($conn);
?>
