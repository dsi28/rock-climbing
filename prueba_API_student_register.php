<?php
require_once('connect_bd.php');
connect_bd();


//if(isParamCorrect(array('znumber', 'password', 'name', 'l_name', 'age', 'level'))){
  $znumber = $_POST['z_number'];
  $password = $_POST['password'];
  $name = $_POST['name'];
  $l_name = $_POST['l_name'];
  $age = $_POST['age'];
  $level = $_POST['level'];
try{
  $query_check = "SELECT * FROM s_credentials WHERE id = $znumber";
  //Preparing statement
  $stmnt = $conn->prepare($query_check);

  $stmnt->execute();
  $retrieval = $stmnt->fetchAll();
  if(count($retrieval)>0){
    $result['error'] = true;
    //echo "Student already registered";
    $result['message'] = "Student already registered";
  }else{
    $query_register_student = "INSERT INTO s_credentials VALUES"."($znumber,'".$password."')";
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
//  echo $e->getMessage();
  $result['message'] = "Student registration unsucessful";
}
echo json_encode($result);

//}
?>
