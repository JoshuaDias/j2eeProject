<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/abcdb"
                           user="root"  password="12345"/>
        <sql:query dataSource="${dbsource}" var="count">
            select idusers from users where username = ? and password = ?;
            <sql:param value="${param.username}" />
            <sql:param value="${param.password}" />
        </sql:query>
        <c:choose>
        <c:when test="${count.rowCount == 0}">
            <c:out value="No Good">No Good</c:out>
        </c:when>
        <c:otherwise>
        
        	
            <c:out value="Logged In">Logged In</c:out>
            <c:forEach var="row" items="${count.rows}">
            <c:if test="${row.idusers==1}">
             <c:redirect url="AdminCentre.jsp" >
                <c:param name="id" value="${row.idusers}" />
            </c:redirect>
            </c:if>
            <c:if test="${row.idusers!=1}">
             <c:redirect url="RegisterProducts.jsp" >
                <c:param name="id" value="${row.idusers}" />
            </c:redirect>
            </c:if>
            </c:forEach>
            
           
        </c:otherwise>
    </c:choose>
    </body>
</html>