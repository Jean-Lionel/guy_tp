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
	<link rel="stylesheet" type="text/css" href="asset/css/form.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>Login</title>
</head>
<body>
<div class="global-container">
	<div style="background-color:gray;" class="card login-form">
	<div class="card-body">
		<h3 class="card-title text-center">Login</h3>
		<div class="card-text">
			<!--
			<div class="alert alert-danger alert-dismissible fade show" role="alert">Incorrect username or password.</div> -->
			<form action="" method="post">
				<!-- to error: add class "has-danger" -->
				<div class="form-group">
					<label for="exampleInputEmail1">Username</label>
					<input type="text" name="login"  class="form-control form-control-sm" id="exampleInputEmail1" aria-describedby="emailHelp" required>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label>
					<input type="password" name="password" class="form-control form-control-sm" id="exampleInputPassword1" required>
				</div>
				<button type="submit" name="connect" class="btn btn-primary">Login</button>
			</form>
		</div>
	</div>
</div>
</div>
</body>
</html>





