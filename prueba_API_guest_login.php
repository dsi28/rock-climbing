<?php
require_once('connect_bd.php');
connect_bd();
$result = array();


  $username = $_POST['username'];
  $password = $_POST['password'];
try{
  $query_check = "SELECT * FROM g_credentials WHERE id = '".$username."'"."AND password= '".$password."'";
  $query_membership = "SELECT membership_type FROM membership WHERE g_id='".$username."'";

  //Preparing statement
  $stmnt = $conn->prepare($query_check);
  $stmnt->execute();
  $retrieval = $stmnt->fetchAll();
  if(count($retrieval)<=0){
    $result['error'] = true;
    $result['message'] = "Student not registered";
  //  echo "Student not registered";
    //echo $query_check;

  }else{
    $result['error'] = false;
    $result['message'] = "Guest log in sucessful";

    $query_profile_info = "SELECT * FROM guest WHERE g_id= '".$username."'";
    $stmnt = $conn->prepare($query_profile_info);
    $stmnt->execute();
    $retrieval = $stmnt->fetchAll();
    foreach($retrieval as $row){
      $result['name'] = $row['name'];
      $result['l_name'] = $row['l_name'];
      $result['age'] = $row['age'];
      $result['level'] = $row['level'];
      $result['g_id'] = $row['g_id'];

    }


    $stmnt = $conn->prepare($query_membership);
    $stmnt->execute();
    $retrieval = $stmnt->fetchAll();
    foreach($retrieval as $row){
      $result['membership'] = $row['membership_type'];

    }

    //header('Location:API_sucess.html');
  }
}catch(PDOException $e){
  //If error while inserting,nothing happens
  $result['error'] = true;
  $result['message'] = "Guest login unsucessful";
  //  echo $e->getMessage() . "          Login Unsucessful";

}

echo json_encode($result);

?>
