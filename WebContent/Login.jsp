<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login page</title>
</head>
<body style="background-color: gray;">
	<header><center><h1>Welcome to ABC</h1></center></header>
	<div style="width: 500px; height: 500px; margin-left: 450px;">
	
		<form action="logindb.jsp" method="post">
			<fieldset>
				<legend>User Login form</legend>
				<table>
					<tr>
						<td>User name:</td>
						<td><input type="text" name="username" /></td>
					</tr>
					<tr>
						<td>Password:</td>
						<td><input type="password" name="password" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="Login"></td>
						<td></td>
					</tr>
				</table>
			</fieldset>
		</form>
		<table>
			<tr>
				<td><a href="UserRegistrationForm.html">Register new user</a></td>
			</tr>
		</table>
	</div>
	 <footer>
        <center>
          <br>
          <br>
          <br>
            &copy; Copyright 2019 reserved.
        </center>
    </footer>
</body>
</html>
