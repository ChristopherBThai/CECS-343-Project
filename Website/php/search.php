<?php
    //PHP to get all the businesses baseded off their name and types

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
	$s = explode(" ", $q);
	for($i=0; $i<sizeof($s); $i++){
        //Search based off of every word
		$sql = "SELECT bName,typeName FROM Business NATURAL JOIN BusinessType WHERE typeName LIKE '%".$s[$i]."%' OR bName LIKE '%".$s[$i]."%'";
		$result = $conn->query($sql);
        if($result->num_rows>0){
		    while($row = $result->fetch_assoc()){
                //Javascript to insert results
			    echo '<script type="text/javascript">result("'.$row["typeName"].'","'.$row["bName"].'")</script>';
		    }
	    }else{
		    echo '<script type="text/javascript">noResults()</script>';
		    echo '<script>console.log("0 results")</script>';
	    }
	}

	echo '<script type="text/javascript">resetTimers()</script>';
    mysqli_close($conn);
?>

