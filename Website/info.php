<?php

    $q = $_GET["q"];
    
	$servername="localhost";
	$username="ehandy";
	$password="jayden";
	$dbname="eHandy";


	$conn = new mysqli($servername, $username, $password, $dbname);
	
	if($conn->connect_error){
		die("Connection failed: ".$conn->connect_error);
	}
	

	$sql = 'SELECT bPhoneNum,bEmail FROM Business WHERE bName = "'.$q.'"';
	$result = $conn->query($sql);


	if($result->num_rows>0){
		while($row = $result->fetch_assoc()){
			echo '
            <p><b id="infoName" style="font-size:150%;">'.$q.'</b></p>
            <p><b>Phone Number: </b><a id="infoPhone" href="#" >'.$row["bPhoneNum"].'</a></p>
            <p><b>E-mail: </b><a id="infoEmail" href="#" >'.$row["bEmail"].'</a></p>
            ';
		}
	}else{
	}
    mysqli_close($conn);
?>
