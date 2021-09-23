<?php
session_start();
require_once "include/require.php"; 
if (isset($_POST['connect'])) {
	// code...
	extract($_POST);
	$password = sha1($_POST['password']);
	$login = $_POST['login'];

	$sql = "SELECT * FROM professeur WHERE login= '$login'  AND password='$password'";
	$result = customerSelect($sql);


	if(count($result) > 0){
		//dump();
	
		$_SESSION['user'] = $result[0];

		header("location: index.php");
		exit;
	}
}

?>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="asset/css/style.css">
	<title>Se Connecter</title>
</head>
<body>

	<div class="login_form">
		<form action="" method="post">
			<div>
				<label for="">IDENTIFIANT</label>
				<input type="text" name="login" required>
			</div>
			<div>
				<label for="">MOT DE PASSE</label>
				<input type="text" name="password" required>
			</div>
			<div>
				<label for=""></label>
				<input type="submit" name="connect" value="Se Connecter">
			</div>
		</form>
	</div>
	
</body>
</html>