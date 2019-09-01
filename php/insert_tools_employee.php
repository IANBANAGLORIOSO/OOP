<?php
$user_id = $_SESSION['username'];

// connect to the database
$db = mysqli_connect('localhost', 'root', '', 'beautysalon');

//check connection
if($db === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}

// adding Employee
if (isset($_POST['submit'])) {
  // receive all input values from the form
  $tool_empID = $_POST['EmployeeID'];
  $id_no = $_POST['id_no'];
  $quantity = $_POST['quantity'];
  

  $sql = "INSERT INTO `Tools_Employee` (`tool_empID`, `id_no`, `quantity`, `timestamp`) VALUES ('$tool_empID', '$id_no', '$quantity', CURRENT_TIMESTAMP);";
    $result = mysqli_query($db, $sql);
    if($result == true){
      header('Location: tools_emp.php');
    }else{
      echo "Something went wrong";
    }

  }
  $subract = "SELECT Tools_Item.quantity-Tools_Employee.quantity as quantity FROM Tools_Employee,Tools_Item WHERE Tools_Employee.id_no=Tools_Item.id_no";
  $result1 = mysqli_query($db,$subract);
  if ($result1 == true) {
    mysqli_query($db,"UPDATE Tools_Item SET quantity=quantity WHERE Tools_Item.id_no=Tools_Employee.id_no");
  }else{
    echo "not updated";
  }
  /*
  $update ="UPDATE Tools_Item SET Tools_Item.quantity=$quantity WHERE Tools_Item.id_no=Tools_Employee.id_no";
  $result2 = mysqli_query($db,$update);
*/?>
