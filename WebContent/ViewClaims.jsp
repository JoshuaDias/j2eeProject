<!-- Author : Joshua Dias -->

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <title>SELECT Operation</title>
        <script>
            function confirmGo(m,u) {
                if ( confirm(m) ) {
                    window.location = u;
                }
            }
        </script>
    </head>
    <body>
 
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/abcdb"
                           user="root"  password="12345"/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from claims;
        </sql:query>
    <center>
    
        <form>
            <table border="1" width="40%">
                <caption>Claims List</caption>
                <tr>
                    <th>Claim ID</th>
                    <th>User ID</th>
                    <th>Claim Description</th>
                    <th>Date</th>
                    <th>Status</th>
                    
                    <th colspan="2">Action</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.idclaim}"/></td>
                        <td><c:out value="${row.userid}"/></td>
                        <td><c:out value="${row.description}"/></td>
                        <td><c:out value="${row.date}"/></td>
                        <td><c:out value="${row.Status}"/></td>
                        <td><a href="UpdateClaims.jsp?id=<c:out value="${row.idclaim}"/>">Update</a></td>
                       
                         
                    </tr>
                </c:forEach>
            </table>
        </form>
        <a href="AdminCentre.jsp">Go Home</a>
    </center>
</body>
</html>