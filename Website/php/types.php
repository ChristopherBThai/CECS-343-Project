
<?php
    //php that will grab all business type names (no limit)

	$servername="localhost";
	$username="ehandy";
	$password="jayden";
	$dbname="eHandy";

	$conn = new mysqli($servername, $username, $password, $dbname);
	
	if($conn->connect_error){
		die("Connection failed: ".$conn->connect_error);
	}

	$sql = 'SELECT DISTINCT typeName FROM BusinessType';
	$result = $conn->query($sql);

	if($result->num_rows>0){
		while($row = $result->fetch_assoc()){
            //Creates an array for javascript
			echo '
			<script type="text/javascript">
            initBar.text.splice(Math.floor(Math.random()*(initBar.text.length+1)),0,"'.$row["typeName"].'");
            </script>
            ';
		}
	}else{
	}
    mysqli_close($conn);
?>