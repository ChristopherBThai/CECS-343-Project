<?php
    //php that gets a business' info based off their name

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
            //Formats phone number         
			$pNum = $row[bPhoneNum];
			$formatNum = '+1 ('.substr($pNum, 0, 3).') '.substr($pNum, 3, 3).'-'.substr($pNum, 6, 4);
            //Creates a javascript to change the info popup
			echo '
            <p><b id="infoName" style="font-size:150%;">'.$q.'</b></p>
            <p><b>Phone Number: </b><a id="infoPhone" href="#" >'.$formatNum.'</a></p>
            <p><b>E-mail: </b><a id="infoEmail" href="#" >'.$row["bEmail"].'</a></p>
            ';
		}
	}else{
	}
    mysqli_close($conn);
?>
