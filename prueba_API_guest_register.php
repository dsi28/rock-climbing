<?php
require_once('connect_bd.php');
connect_bd();

if(isParamCorrect(array('name', 'l_name', 'age', 'password'))){
//Use email/autoincrement to differentiate guests ??
  $password = $_POST['password'];
  $name = $_POST['name'];
  $l_name = $_POST['l_name'];
  $age = $_POST['age'];
try{
  //Check if guest already registered
  $query_check = "SELECT * FROM g_credentials WHERE name = $znumber";
  //Preparing statement
  $stmnt = $conn->prepare($query_check);
  $stmnt->execute();
  $retrieval = $stmt->fetchAll();
  if(count($retrieval)>0){
    $result['error'] = true;
    $result['message'] = "Student already registered";
  }else{
    $query_register_student = "INSERT INTO s_credentails VALUES"."($znumber,'".$password."')";
    $query_register_student_2 =  "INSERT INTO users VALUES"."($znumber,'".$name."','".$l_name."', $age ,'".$level."')";

    $stmnt = $conn->prepare($query_register_student);
    $stmnt->execute();
    $stmnt = $conn->prepare($query_register_student_2);
    $stmnt->execute();
    $result['error'] = false;
    $result['message'] = "Student registration sucessful";


  }
}catch(PDOException $e){
  //If error while inserting,nothing happens
  $result['error'] = true;
  $result['message'] = "Student registration unsucessful";
}


}
  ?>
