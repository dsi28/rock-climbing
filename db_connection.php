<?php
$conn = null;

$USERNAME= "";
$PASSWORD = "";
$DB= "";
$SERVER = "";
//Establishing connection with the //

function connec_DB(){
  try{
    $conn = new PDO("mysql:host=$SERVER; db_name=$DB, $USERNAME, $PASSWORD");
    //Connecting to the server
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  }catch(PDOException $e){
    $conn = null;
    echo "Echo: " . $e->getMessage();
  }
}

?>
