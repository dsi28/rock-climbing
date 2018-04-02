<?php
global $conn;

$USERNAME= "padell2017";
$PASSWORD = "";
$DB= "padell2017";
$SERVER = "lamp.cse.fau.edu";
//Establishing connection with the //


  try{
    $conn = new PDO("mysql:host=$SERVER; db_name=$DB, $USERNAME, $PASSWORD");
    //Connecting to the server
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  }catch(PDOException $e){
    $conn = null;
    echo "Echo: " . $e->getMessage();
  }


?>
