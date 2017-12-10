
<?php
    //php that will grab all business type names (no limit)
    include_once 'helper/common.php';
    include_once 'helper/db.php';

    $conn = dbConnect("eHandy");
	
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
	}
    mysqli_close($conn);
?>