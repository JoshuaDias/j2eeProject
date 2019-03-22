<!-- Author : Joshua Dias -->

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
        <sql:update dataSource="${dbsource}" var="count">
            UPDATE claims SET status = ?
            WHERE idclaim='${param.id}'
            <sql:param value="${param.status}" />
            
        </sql:update>
        <c:if test="${count>=1}">
            <font size="5" color='green'> Congratulations ! Data updated
            successfully.</font>
              <a href="AdminCentre.jsp">Go Home</a>          
        </c:if>
    </body>
</html>