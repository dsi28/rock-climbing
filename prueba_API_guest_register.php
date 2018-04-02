<?php
require_once('connect_bd.php');
connect_bd();


//if(isParamCorrect(array('znumber', 'password', 'name', 'l_name', 'age', 'level'))){
  $username = $_POST['username'];
  $password = $_POST['password'];
  $name = $_POST['name'];
  $l_name = $_POST['l_name'];
  $age = $_POST['age'];
  $level = $_POST['level'];
  $membership = 0;
try{
  $query_check = "SELECT * FROM g_credentials WHERE id='".$username."'";
  //Preparing statement
  $stmnt = $conn->prepare($query_check);

  $stmnt->execute();
  $retrieval = $stmnt->fetchAll();
  if(count($retrieval)>0){
    $result['error'] = true;
    //echo "Student already registered";
    $result['message'] = "Guest already registered";
  }else{
    $query_register_guest = "INSERT INTO g_credentials VALUES"."('".$username."','".$password."')";
    $query_insert_membership = "INSERT INTO membership VALUES"."('".$username."', NULL, NULL , NULL)";


    $stmnt = $conn->prepare($query_register_guest);
    $stmnt->execute();
    $stmnt = $conn->prepare($query_insert_membership);
    $stmnt->execute();

    $query_register_guest_2 =  "INSERT INTO guest  VALUES"."('".$username."','".$name."','".$l_name."', $age ,'".$level."')";
    $stmnt = $conn->prepare($query_register_guest_2);
    $stmnt->execute();
    $result['error'] = false;
    $result['message'] = "Guest registration sucessful";


  }
}catch(PDOException $e){
  //If error while inserting,nothing happens
  $result['error'] = true;
//echo $e->getMessage();
  $result['message'] = "Guest registration unsucessful";
}
echo json_encode($result);

//}
?>
