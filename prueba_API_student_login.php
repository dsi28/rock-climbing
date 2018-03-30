<?php
require_once('connect_bd.php');
connect_bd();
$result = array();


  $znumber = $_POST['z_number'];
  $password = $_POST['password'];
try{
  $query_check = "SELECT * FROM s_credentials WHERE id = $znumber AND pword=:password";
  //Preparing statement
  $stmnt = $conn->prepare($query_check);
$stmnt->bindParam(":password", $password, PDO::PARAM_STR, 12);
  $stmnt->execute();
  $retrieval = $stmnt->fetchAll();
  if(count($retrieval)<=0){
    $result['error'] = true;
    $result['message'] = "Student not registered";
  //  echo "Student not registered";
    //echo $query_check;

  }else{
    $result['error'] = false;
    $result['message'] = "Student log in sucessful";

    $query_profile_info = "SELECT * FROM users WHERE z_number= $znumber";
    $stmnt = $conn->prepare($query_profile_info);
    $stmnt->execute();
    $retrieval = $stmnt->fetchAll();
    foreach($retrieval as $row){
      $result['name'] = $row['name'];
      $result['l_name'] = $row['l_name'];
      $result['age'] = $row['age'];
      $result['level'] = $row['level'];
      $result['znumber'] = $row['z_number'];

    }
    //header('Location:API_sucess.html');
  }
}catch(PDOException $e){
  //If error while inserting,nothing happens
  $result['error'] = true;
  $result['message'] = "Student login unsucessful";
    //echo $e->getMessage() . "          Login Unsucessful";
}

echo json_encode($result);

?>
