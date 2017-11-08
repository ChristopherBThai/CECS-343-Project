<?php
	$servername="localhost";
	$username="ehandy";
	$password="jayden";
	$dbname="eHandy";

	$conn = new mysqli($servername, $username, $password, $dbname);
	if($conn->connect_error){
		die("Connection failed: ".$conn->connect_error);
	}
	
	echo "Connected successfully\n";

	$sql = "SELECT * from Homeowner";
	$result = $conn->query($sql);

	if($result->num_rows>0){
		while(($row = $result->fetch_assoc()){
			echo $row["hName"]."\n";
		}
	}else{
		echo "0 results";
	}

	$conn->close();

?>
