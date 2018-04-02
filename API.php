<?php
require_once('connect_bd.php');
connect_bd();

$result = array();

//Get API call iif something
if(isset($_GET['apicall'])){
//Detect type of API call, if nothing fits, invalid
  switch ($_GET['apicall']) {
    case 'register_student':
    if(isParamCorrect(array('znumber', 'password', 'name', 'l_name', 'age', 'level'))){
      $znumber = $_POST['znumber'];
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
      break;

    case 'register_guest':
    if(isParamCorrect(array('znumber', 'password', 'name', 'l_name', 'age', 'level'))){
      $znumber = $_POST['znumber'];
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
      break;


    case 'student':
    if(isParamCorrect(array('znumber', 'password'))){
      $znumber = $_POST['znumber'];
      $password = $_POST['password'];
  try{
      $query_check = "SELECT * FROM s_credentials WHERE id = $znumber";
      //Preparing statement
      $stmnt = $conn->prepare($query_check);
      $stmnt->execute();
      $retrieval = $stmt->fetchAll();
      if(count($retrieval)<=0){
        $result['error'] = true;
        $result['message'] = "Student not registered";
      }else{
        $stmnt->execute();
        $result['error'] = false;
        $result['message'] = "Student log in sucessful";
      }
    }catch(PDOException $e){
      //If error while inserting,nothing happens
      $result['error'] = true;
      $result['message'] = "Student login unsucessful";
    }


    break;
    case 'guest':
    break;
    default:
      result['error'] = true;
      result['message'] = "Invalid Operation"
      break;
  }


} else {
  result['error'] = true;
  result['message'] = "Invalid API call"

}
//Return JSON-type response
echo json_encode($result);


//Checking all params are correct
function isParamCorrect($params){
  foreach($params as $param){
    if(!isset($param)){
      return false;
    }
  }
  return true;
}
?>
