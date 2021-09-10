<?php

function getConnection(){

	try{
		$db = new PDO('mysql:host=localhost;dbname=guy_tp','jean','lion');
		 $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		 //echo "SUCCES CONNECTED";
	} catch(PDOException $e) {
	  echo "Error: " . $e->getMessage();
	  die($e);
	}
	return $db;
}


function selectAll($table){
	$query = "SELECT * FROM $table";

	$db = getConnection();

	$data = $db->query($query);
	return $data->fetchAll();
}

function selectById($table='articles', $id,$column = 'id'){
	$query = "SELECT * FROM $table WHERE $column =$id";
	$db = getConnection();

	$data = $db->query($query);
	return $data->fetchAll()[0] ?? null;

}

function executeQuery($sql){
	$db = getConnection();
	return $db->exec($sql);
}

function dump($value = ""){
	echo "<pre>";
	var_dump($value);
	echo "</pre>";
}

function getEntryInTable($table ,  $val,$column="id"){
	$key = array_search($val, array_column($table, $column));
	return $table[$key];
}

