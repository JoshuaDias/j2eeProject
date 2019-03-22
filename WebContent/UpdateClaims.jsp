<!-- Author : Joshua Dias -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
    </head>
    <body>
 
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/abcdb"
                           user="root"  password="12345"/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from claims where idclaim=?;
            <sql:param value="${param.id}" />
        </sql:query>
        
        
        <form action="UpdateClaimsDb.jsp" method="post">
            <table border="0" width="40%">
                <caption>Update Claim</caption>
                <tr>
                    <th>Claim Description</th>
                    <th>Date</th>
                    <th>Status</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><input type="hidden" value="${param.id}" name="id"/>
                            <c:out value="${row.description}"/></td>
                           <td> <c:out value="${row.date}"/></td>
                           <td> <select name="status">
        <option value="Approved">Approved</option>
        <option value="Rejected">Rejected</option>
        <select></td>
                       
                        <td><input type="submit" value="Update"/></td>
                    </tr>
                </c:forEach>
            </table>
            <a href="AdminCentre.jsp">Go Home</a>
        </form>
    </body>
</html>
