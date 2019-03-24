<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.runtime.ProtectedFunctionMapper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%!

	String userName, password, email, address;
	Connection con;
	String phone;
	StringBuilder errorMessage = new StringBuilder();

%>
</head>

<style type="text/css">
.error-text {
	text-color: red;
}
</style>

<body style="background-color: gray;">


	<%
		errorMessage.setLength(0);
		if (request.getParameter("submit") != null) {

			userName = request.getParameter("userName");
			if (userName == "") {
				errorMessage.append("Please insert user name<br />");
			}
			else if (userName.matches("[a-zA-Z0-9]{1,30}") == false) {
				errorMessage.append("Please only insert [a-zA-Z0-9] for user name and under 30 character<br />");
			}
			
			password = request.getParameter("password");
			if (password == "") {
				errorMessage.append("Please insert password.<br />");
			}
			else if (password.matches("[a-zA-Z0-9]{1,5}") == false) {
				errorMessage.append("Please only insert [a-zA-Z0-9] for password and not more then 5 .<br />");
			}
			
			email = request.getParameter("email");
			if (email == "") {
				errorMessage.append("Please insert Email.<br />");
			}
			//Checking the manufacturer is empty or not
			address = request.getParameter("address");
			if (address == "") {
				errorMessage.append("Please insert address.<br />");
			}

			
			phone = request.getParameter("phone");
			if (phone == "") {
				errorMessage.append("Please insert numbers for phone.<br />");
			}
			

			if(errorMessage == null || errorMessage.toString().equals("")) {
				// Connect to the server
				try {
					Class.forName("com.mysql.jdbc.Driver");
					//System.out.println("somting found");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
					//System.out.println("nothing found");
				}

				try {
					//Class.forName("com.mysql.jdbc.Driver");
					String dbUsername = "root";
					String dbPassword = "12345";
					String url = "jdbc:mysql://localhost:3306/abcdb";
					con = DriverManager.getConnection(url, dbUsername, dbPassword);

					// create statement
					Statement st = con.createStatement();

					// formulate and execute the query
					String sql = "insert into abcdb.users(username,password,email,address,phone)"
							+ "  values('" + userName + "','" + password + "','" + email + "','"
							+ address + "','" + phone + "')";

					//execute the sql query by using executeUpdate
					int i = st.executeUpdate(sql);
				
	%>

	<h1 style="color: blue">Your have registered successfully</h1>
	<Table>
		<tr>
			<td>Name:</td>
			<td><%=userName%></td>
		</tr>
		<tr>
			<td>email:</td>
			<td><%=email%></td>
		</tr>
		<tr>
			<td>phone:</td>
			<td><%=phone%></td>
		</tr>
		<tr>
			<td>phone:</td>
			<td><%=phone%></td>
		</tr>
		<tr>
			<td>Address:</td>
			<td><%=address%></td>
		</tr>

	</Table>
	 <a href="Login.jsp">Go to login page</a> 

	<%
				} 	
	catch (SQLException e) {
		for (Throwable t : e)
			t.printStackTrace();
	}	}
	%>
	<%
		} //if (request.getParameter("submit") != null)
	%>






	<h3 class="error-text" style="color: red"><%=errorMessage.toString()%></h3>
</body>
</html>