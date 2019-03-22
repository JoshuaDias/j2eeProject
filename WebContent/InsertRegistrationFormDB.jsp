
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

	String userName, passsword, email, address;
	Connection con;
	int phone;
	StringBuilder errorMessage = new StringBuilder();

%>
</head>

<style type="text/css">
.error-text {
	text-color: red;
}
</style>

<body>


	<%
		errorMessage.setLength(0);
		if (request.getParameter("submit") != null) {
	%>
	<%
		
			userName = request.getParameter("userName");
			
			if (userName == "") {
				
				errorMessage.append("Please insert user name<br />");

			}
			
			else if (userName.matches("[a-zA-Z0-9]{5}") == false) {
				errorMessage.append("Please only insert [a-zA-Z0-9] for Product no.<br />");

			}

			
			passsword = request.getParameter("passsword");
			if (passsword == "") {
	%><br>
	<%
		errorMessage.append("Please insert password.<br />");

			}
			else if (passsword.matches("[a-zA-Z0-9]{5}") == false) {
				errorMessage.append("Please only insert [a-zA-Z0-9] for password.<br />");

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

			// checiking the price value is in corrct format or not
			try {
				phone = Integer.parseInt(request.getParameter("phone"));
			} catch (NumberFormatException e) {

				errorMessage.append("Please insert only number for phone .<br />");

			}
			
			

			

			if (errorMessage.toString() == "") {
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
					String username = "root";
					String password = "12345";
					String url = "jdbc:mysql://localhost:3306/abcdb";
					con = DriverManager.getConnection(url, username, password);

					// create statement
					Statement st = con.createStatement();

					// formulate and execute the query
					String sql = "insert into abcdb.users(userName,passsword,email,address,phone)"
							+ "  values('" + userName + "','" + passsword + "','" + email + "','"
							+ address + "','" + phone + "')";

					//execute the sql query by using executeUpdate
					int i = st.executeUpdate(sql);
				} catch (SQLException e) {
					for (Throwable t : e)
						t.printStackTrace();
				}
	%>

	<h1 style="color: blue">Successfully Added Product</h1>
	<Table>
		<tr>
			<td>Name:</td>
			<td><%=userName%></td>
		</tr>
		<tr>
			<td>passsword:</td>
			<td><%=userName%></td>
		</tr>
		<tr>
			<td>email:</td>
			<td><%=email%>$</td>
		</tr>
		<tr>
			<td>phone:</td>
			<td><%=phone%></td>
		</tr>
	</Table>

	<%
		}
	%>
	<%
		} //if (request.getParameter("submit") != null)
	%>




	

	<h3 class="error-text" style="color: red"><%=errorMessage.toString()%></h3>
</body>
</html>