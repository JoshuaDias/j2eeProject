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
            SELECT * from products;
        </sql:query>
    <center>
    <form action="AddProduct.jsp">
         <table border="0" width="40%">
                <caption>Add Product</caption>
               
                    <tr>
                        
                       
                        <td><input type="submit" value="Add Product"/></td>
                    </tr>
               
            </table>
        </form>
        <form>
            <table border="1" width="40%">
                <caption>Product List</caption>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    
                    <th colspan="2">Action</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.idproducts}"/></td>
                        <td><c:out value="${row.productname}"/></td>
                        <td><a href="UpdateProduct.jsp?id=<c:out value="${row.idproducts}"/>">Update</a></td>
                       
                         
                    </tr>
                </c:forEach>
            </table>
        </form>
        <a href="AdminCentre.jsp">Go Home</a>
    </center>
</body>
</html>