<?php
    include_once 'helper/common.php';
    include_once 'helper/db.php';
    //PHP to get all the businesses baseded off their name and types
    $q = $_GET["q"];

	$conn = dbConnect("eHandy");
	
	echo '<script>console.log("Connection success!")</script>';
    //Search based off of every word
	$sql = "SELECT DISTINCT bName,typeName,bWebID FROM Business NATURAL JOIN BusinessType WHERE INSTR('{$q}', bName)>0 OR INSTR('{$q}', typeName)>0 OR bName LIKE '%{$q}%' OR typeName LIKE '%{$q}%'";			
	$result = $conn->query($sql);

	if($result->num_rows>0){
		while($row = $result->fetch_assoc()){
            //Javascript to insert results
		    echo '<script type="text/javascript">result("'.$row["typeName"].'","'.$row["bName"].'",'.$row["bWebID"].')</script>';
		}
	}else{
		echo '<script type="text/javascript">noResults()</script>';
		echo '<script>console.log("0 results")</script>';
	}
	echo '<script type="text/javascript">resetTimers()</script>';
    mysqli_close($conn);
?>
