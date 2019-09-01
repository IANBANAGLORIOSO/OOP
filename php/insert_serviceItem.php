<?php
$user_id = $_SESSION['username'];
// connect to the database
$db = mysqli_connect('localhost', 'root', '', 'beautysalon');

//check connection
if($db === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

// adding contact
if (isset($_POST['submit'])) {
  // receive all input values from the form
  $reciept_no = $_POST['reciept_no'];
  $chk=$_POST["chk"];
  $a=implode(",",$chk);
  $sql="select * from Services where Services.ServiceID ='".$a."'";
  $result = mysqli_query($db, $sql);
  $rowcount=mysqli_num_rows($result);
  
  for($i=1;$i<=$rowcount;$i++)
  {
      $row=mysqli_fetch_array($result);
  }
  $sql = "INSERT INTO `Service_item` (`reciept_no`, `Services_checked`) VALUES ('$reciept_no', '$a');";
    $result = mysqli_query($db, $sql);
    if($result == true){
      header('Location:service_item.php');
    }else{
      echo "Somthing went wrong";
    }
  
}