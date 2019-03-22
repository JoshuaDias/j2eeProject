<!-- Author : Joshua Dias -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/abcdb" user="root" password="12345"
scope="session" />
<h2>List of Active Users</h2>
<sql:query dataSource="${dataSource}" var="result">
select * from users;
</sql:query>
<table border="1">
<c:forEach var="col" items="${result.rows}">
<tr>
<td><c:out value="${col.idusers}"></c:out> </td>
<td><c:out value="${col.username}"></c:out> </td>
<td><c:out value="${col.password}"></c:out> </td>
<td><c:out value="${col.phone}"></c:out> </td>
<td><c:out value="${col.email}"></c:out> </td>
<td><c:out value="${col.address}"></c:out> </td>
</tr>
</c:forEach>
</table>

<form  method="POST" name="searchUser">
Search for user: <input type="text" name="uname"><br>
<button type="submit" value="Add Product" name="su">Search</button>
</form>

<c:if test="${pageContext.request.method=='POST'}">

<c:catch var="exception">

<c:set var="uname" value="${param.uname}"/>
<sql:query dataSource="${dataSource}" var="users">
select * from users where username like "${uname}%";
    
</sql:query>
<table border="1">
<c:forEach var="cols" items="${users.rows}">
<tr>
<td><c:out value="${cols.idusers}"></c:out> </td>
<td><c:out value="${cols.username}"></c:out> </td>
<td><c:out value="${cols.password}"></c:out> </td>
<td><c:out value="${cols.phone}"></c:out> </td>
<td><c:out value="${cols.email}"></c:out> </td>
<td><c:out value="${cols.address}"></c:out> </td>
</tr>
</c:forEach>
</table>
</c:catch>
</c:if>
<br>
<form action="displayUserSearch.jsp">
<button type="submit" value="Update Products">Update Products</button>
</form><br>
<form action="ViewClaims.jsp">
<button type="submit" value="View Claims">View Claims</button>
</form>

</body>
</html>