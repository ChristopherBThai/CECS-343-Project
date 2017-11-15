<?php

    $q = $_GET["q"];
    
	echo '<script>console.log("Starting php")</script>';

	$servername="localhost";
	$username="ehandy";
	$password="jayden";
	$dbname="eHandy";

	echo '<script>console.log("Starting connection")</script>';

	$conn = new mysqli($servername, $username, $password, $dbname);
	
	echo '<script>console.log("Checking connection")</script>';
	if($conn->connect_error){
		echo '<script>console.log("Connection failed")</script>';
		die("Connection failed: ".$conn->connect_error);
	}
	
	echo '<script>console.log("Connection success!")</script>';

	$sql = "SELECT bName,typeName FROM Business NATURAL JOIN BusinessType WHERE typeName LIKE '%".$q."%'";
	$result = $conn->query($sql);


	if($result->num_rows>0){
		while($row = $result->fetch_assoc()){
			echo '<script type="text/javascript">result("'.$row["typeName"].'","'.$row["bName"].'")</script>';
		}
	}else{
		echo '<script>console.log("0 results")</script>';
	}
		echo '<script type="text/javascript">resetTimers()</script>';
    mysqli_close($conn);
?>

