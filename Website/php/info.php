<?php
    //php that gets a business' info based off their name
    error_reporting(E_ALL);
    ini_set('display_errors',1);

    $q = $_GET["q"];
    
	$servername="localhost";
	$username="ehandy";
	$password="jayden";
	$dbname="eHandy";

	$conn = new mysqli($servername, $username, $password, $dbname);
	
	if($conn->connect_error){
		die("Connection failed: ".$conn->connect_error);
	}
    
    //Sets the name, picture, number, and email
	$sql = 'SELECT bPhoneNum,bEmail,bWebID FROM Business WHERE bName = "'.$q.'"';
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
	}else{}

    echo '<script>resetReviews();</script>';

    //Sets the name, picture, number, and email
	$sql = 'SELECT hWebID,dateReview,reviewStars,rAnonymous,rDetails FROM Review WHERE bWebID="'.$id.'"';
	$result = $conn->query($sql);
	if($result->num_rows>0){
		while($row = $result->fetch_assoc()){
            $name;
            if($row[rAnonymous]=='y'){
                $sql = 'SELECT hName FROM Homeowner WHERE hWebID = "'.$id.'"';
                $nResult = $conn->query($sql);
                $name = $nResult->fetch_assoc()["hName"];
            }else{
                $name = "Anonymous";
            }
            echo '<script>addReview("'.$name.'","'.$row["dateReview"].'","'.$row["rDetails"].'","'.$row["reviewStars"].'");</script>';
		}
	}else{}

    mysqli_close($conn);
?>
