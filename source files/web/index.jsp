<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    
//response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
//response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
//response.setHeader("Expires", "0"); // Proxies.
    if(request.getSession().getAttribute("userid") !=null){
        response.sendRedirect("home.jsp");
    }
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TY JAVA</title>
        <link rel="stylesheet" href="styling/bootstrap.min.css">
        <link rel="stylesheet" href="styling/footer-style.css">
        <link rel="stylesheet" type="text/css" href="styling/index-style.css">

    </head>
    <body>
 
        <c:import url="indexTop.jsp"></c:import>
        <p class="warning"></p>
        <c:import url="footer.jsp"></c:import>
    
    </body>
</html>
