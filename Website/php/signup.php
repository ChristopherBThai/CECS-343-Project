<?php
    msg("Found post");
    msg("User: '$_POST[uname]'");
    msg("Name: '$_POST[fname]'");
    msg("Email: '$_POST[email]'");
    msg("Password: '$_POST[psw]'");
    msg("Option: '$_POST[toggle_option]'");
    $db = dbConnect('eHandy');
    if($_POST['uname']=='' or $_POST['fname']=='' or $_POST['email']=='' or $_POST['psw']==''){
        unset($_POST);
        error('One or more required fields were left blank.\nPlease fill them in and try again');
    }
    $sql = "SELECT COUNT(*) FROM User WHERE user = '$_POST[uname]'";
    $result = $db->query($sql);
    if(!$result){
        unset($_POST);
        error('A database error occurred in processing your submission.\n');
    }else if($result->fetch_assoc()["COUNT(*)"]>0){
        unset($_POST);
        error('A user already exists with your chosen userid.\nPlease try another.');
    }else{
        //Insert into User
        $sql = "INSERT INTO User SET
        user = '$_POST[uname]',
        psw = PASSWORD('$_POST[psw]'),
        type = 'homeowner'";
        if(!$db->query($sql)){
            unset($_POST);
            error('A database error occurred in processing your submission');
        }
            
        //Get new ID
        $sql = "SELECT id FROM User WHERE user = '$_POST[uname]'";
        $result = $db->query($sql);
        if(!$result){
            //Delete from User if failed
            $sql = "DELETE FROM User WHERE user = '$_POST[uname]'";
            $db->query($sql);
            unset($_POST);
            error('A database error occurred in processing your submission.\n');
        }
        $id = $result->fetch_assoc()["id"];
            
        //Insert into Homeowner
        $sql = "INSERT INTO Homeowner SET
            hName = '$_POST[fname]',
            hWebId = '$id'";
        if(!$db->query($sql)){
            //Delete from User if failed
            $sql = "DELETE FROM User WHERE user = '$_POST[uname]'";
            $db->query($sql);
            unset($_POST);
            error('A database error occurred in processing your submission');
        }
            
        msg("Success!");
	alert("Successfully created your account!");
        unset($_POST);
    }
    unset($_POST);
?>
