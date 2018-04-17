<?php
session_start();
include("functions.php");
$studentid=&$_SESSION['studentid'];
$sessionid=session_id();
if(!is_null($studentid)) 
{
	
	$clearquery="update student set sessionid='a' where studentid=? and sessionid=?";
	$db=createConnection();
	$doclear=$db->prepare($clearquery);
	$doclear->bind_param("is",$studentid,$sessionid);
	$doclear->execute();
	$doclear->close();
	$db->close();
}
session_unset();
session_destroy();
header("location: ../index.php");
?>
