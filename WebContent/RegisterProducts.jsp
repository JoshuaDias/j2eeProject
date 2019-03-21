<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Product</title>
</head>
<body>
<h1>Register Product</h1>
<form  method="POST">

Username : <input type="text" name="uname"><br>
Product Name : <input type="text" name="name"><br>
Serial number : <input type="text"  name= "serial"><br>
Purchase Date : <input type ="text" name ="date"><br>

<button type="submit" value="Add Product">Register Product Product</button>

</form>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://localhost:3306/abcdb" user="root" password="12345"
scope="session" />
<c:if test="${pageContext.request.method=='POST'}">

<c:catch var="exception">


<c:set var="uname" value="${param.uname}"/>
<c:set var="productname" value="${param.name}"/>
<sql:query dataSource="${dataSource}" var="users">
select u.idusers, p.idproducts from users u, products p where u.username = ? and p.productname = ?;
    <sql:param value="${uname}" />
    <sql:param value="${productname}" />
</sql:query>
<c:forEach var="userid" items="${users.rows}">
<c:set var="theUserId" value="${userid.idusers}"/>
<c:set var="theProdId" value="${userid.idproducts}"/>
</c:forEach>
<c:set var="bids" value="${param.name}"/>



<sql:update dataSource="${dataSource}" var="updatedTable">
INSERT INTO registerproducts (iduser,idproduct,serialnumber,purchasedate) VALUES (?, ?, ?, ?)
<sql:param value="${theUserId}" />
<sql:param value="${theProdId}" />
<sql:param value="${param.serial}" />
<sql:param value="${param.date}" />
</sql:update>
<c:if test="${updatedTable>=1}">
<font size="2" color='green'> Congratulations ! Data inserted
successfully.</font>

</c:if>
</c:catch>
<c:if test="${exception!=null}">
<c:out value="${exception} }" />
</c:if>


</c:if>
</body>
</html>