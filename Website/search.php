<?php

	echo '<script>console.log("Starting php")</script>';

	$servername="localhost";
	$username="ehandy";
	$password="jayden";
	$dbname="eHandy";

	echo '<script>console.Log("Starting connection")</script>';

	$conn = new mysqli($servername, $username, $password, $dbname);
	
	echo '<script>console.log("Checking connection")</script>';
	if($conn->connect_error){
		echo '<script>console.log("Connection failed")</script>';
		die("Connection failed: ".$conn->connect_error);
	}
	
	echo '<script>console.log("Connection success!")</script>';

	$sql = "SELECT * from Business";
	$result = $conn->query($sql);

	if($result->num_rows>0){
		while($row = $result->fetch_assoc()){
			echo '<script type="text/javascript">result("TestGroup","'.$row["bName"].'","PhoneNumber")</script>';
		}
	}else{
		echo '<script>console.log("0 results")</script>';
	}

?>

<html>
	<head></head>
	<body>
		<a>SQL Test</a>
	</body>
</html>
