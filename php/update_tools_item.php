<?php
// connect to the database
$db = mysqli_connect('localhost', 'root', '', 'beautysalon');

  //check connection
  if($db === false){
      die("ERROR: Could not connect. " . mysqli_connect_error());
  }


  if (isset($_GET['id_no'])) {
    
    $id_no = $_GET['id_no'];

    $get_contact = "SELECT * FROM Tools_Item WHERE id_no = '$id_no'";

    $get_id = mysqli_query($db, "SELECT * FROM Tools_Item WHERE id_no = '$id_no'");

    $row = mysqli_fetch_array($get_id);
  }
?>

<?
/* Updating existing data from database */
    if(isset($_POST['update'])){
      
      $id_no = $_POST['id_no'];

      $Description = mysqli_real_escape_string($db, $_POST['Description']);
      $Amount= mysqli_real_escape_string($db, $_POST['Amount']);
      $Quantity = mysqli_real_escape_string($db, $_POST['Quantity']);
      $unit = mysqli_real_escape_string($db, $_POST['unit']);
        // mysql query to Update data
     $query = "UPDATE `Tools_Item` SET `description` = '$Description', `amount` = '$Amount', `quantity` = '$Quantity', `unit` = '$unit' WHERE `Tools_Item`.`id_no` = '$id_no'";
     
     $result = mysqli_query($db, $query);
     
     if($result)
     {
         echo 'Data Updated';
     }else{
         echo 'Data Not Updated';
     }
      header('location: tools_item.php?id_no='.$row['id_no'].'&updated=1'); 

    }
?>
