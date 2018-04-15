<!DOCTYPE html>
<html>
<head>
  <link rel="icon" type="image/png" href="css/img/favicon.ico" />
</head>
<body>
  <p>Registration page</p>
  <?php
    include("php/functions.php");
    $email=$_POST['email'];
    $username=$_POST['username'];
    $firstname=$_POST['forename'];
    $lastname=$_POST['surname'];
    $userpass=$_POST['userpass'];
    $userpass2=$_POST['userpass2'];
    $salt=getSalt(16);
    $cryptpass=makeHash($userpass,$salt,50);
    $userlevel=1;
    $school=1;
    // Used to check that submitted user does not exist already
    $userexists=false;
    //start a session
    session_start();
    $sessionid=session_id();
    // connect to database
    $db = createConnection();
    // check form details again in case javascript disabled and
    // bypassed javascript client side scripting
    // check username does not already exist
    $sql="select email from student where email=?;";
    $stmt=$db->prepare($sql);
    $stmt->bind_param("s",$email);
    $stmt->execute();
    $stmt->store_result();
    $stmt->bind_result($userresult);
    while($row=$stmt->fetch()) {
    	if($userresult==$email) {$userexists=true;}
    }
    $stmt->close();
    if (!$userexists && $userpass==$userpass2 && isset($email) && isset($firstname) && isset($lastname) && isset($userpass)) {
      $insertquery="insert into student (email, username, usertype, firstname, lastname, salt, userpass, sessionid,schoolid) values (?,?,?,?,?,?,?,?,?);";
    	$inst=$db->prepare($insertquery);
      echo $username.$userlevel.$firstname.$lastname.'s:'.$salt.'c:'.$cryptpass.'se:'.$sessionid.'sch:'.$school;
    	$inst->bind_param("ssisssssi", $email, $username, $userlevel, $firstname, $lastname, $salt, $cryptpass, $sessionid, $school);
    	$inst->execute();
      // check user inserted, if so create login form
    	if($inst->affected_rows==1) {
        echo"<p>Details inserted</p>";
        echo "<a href='index.php'>Click here to go home</a>";
      } else {
        echo "<p>Details not inserted</p>";
        echo "<a href='index.php'>Click here to go home</a>";
      }
      $inst->close();
    } else {
      echo "<p>Registration failed, this username already exists.<p>";
      echo "<a href='index.php'>Click here to go home</a>";
    }
  ?>
</body>
</html>
