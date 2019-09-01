<?php
// connect to the database
$db = mysqli_connect('localhost', 'root', '', 'beautysalon');

  //check connection
  if($db === false){
      die("ERROR: Could not connect. " . mysqli_connect_error());
  }


  if (isset($_GET['tool_id'])) {
    
    $tool_id = $_GET['tool_id'];

    $get_contact = "SELECT * FROM Tools_Employee WHERE tool_id = '$tool_id'";
    $get_tool_id = mysqli_query($db, "SELECT * FROM Tools_Employee WHERE tool_id = '$tool_id'");

    $row = mysqli_fetch_array($get_tool_id);
  }
?>

<?
/* Updating existing data from database */
    if(isset($_POST['update'])){
      
      $quantity = $_POST['quantity'];
      
      $quantity  = mysqli_real_escape_string($db, $_POST['quantity']);
        // mysql query to Update data
     $query = "UPDATE Tools_Employee SET quantity='$quantity'";
     
     $result = mysqli_query($db, $query);
     
     if($result)
     {
         echo 'Data Updated';
     }else{
         echo 'Data Not Updated';
     }
      header('location: tools_emp.php?tool_id='.$row['tool_id'].'&updated=1'); 

    }
?>
