<!DOCTYPE html>
<?php session_start(); 
//include('includes/menu.php');
include('php/functions.php');
//include('php/functions2.php');
$_SESSION['studentid']=$studentid;
?>
<html>
<head>
  <meta charset="utf-8">
  <title>Classes</title>
  <link rel="stylesheet" href="css/classes.css">
  <link rel="stylesheet" href="css/nav.css">
  <link rel="stylesheet" type="text/css" media="screen and (max-width:992px)" href="css/mobiles.css" />

  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
</head>
<body>
<?php
//menus();
?>   
 <div class="row">
   <div id="sidebar" class="col m2 blue darken-3">
    
   </div>
 </div>
 <div class="row">
   
   <div id="mainContent" class="col m8 offset-m3">
    <?php    
    
    
    $firstname=$_POST['firstName'];
    $lastname=$_POST['lastName']; 
    $schoolid=$_POST['schoolid'];
    //echo $firstname;
   // echo $lastname;
   // echo $schoolid;
    $db = createConnection();   
    $insertquery="insert into teacher (firstName, lastName, schoolid) values (?,?,?);";
    $inst=$db->prepare($insertquery);
    $inst->bind_param("ssi",  $firstname, $lastname, $schoolid);
    $inst->execute();
    // check user inserted, if so create login form
    if($inst->affected_rows==1)
    {	
        echo "Teacher added";
    }
    else 
    {
        echo "is problem";
    }

    ?>
    
   </div>
 </div>
</body>
</html>