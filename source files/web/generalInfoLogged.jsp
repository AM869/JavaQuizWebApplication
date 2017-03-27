<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%if(session.getAttribute("userid")==null ){     
    response.sendRedirect("index.jsp");}
else{
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>General Info</title>
        <link rel="stylesheet" href="styling/bootstrap.min.css">
        <link rel="stylesheet" href="styling/footer-style.css">
        <link rel="stylesheet" href="styling/generalInfoLogged-style.css">
        
        
    </head>
    <body>
        
        <c:import url="generalInfoBody.jsp"></c:import>
        
        <form class="buttons" name="home" action="home.jsp" method="POST">
            <input type="submit" value="HOME" name="home button" />
        </form>
        
        <form class="buttons" action="LogOutServlet" method="POST">
            <input type="submit" value="Log out" />
        </form>
        
        
        <c:import url="footer.jsp"></c:import>
    </body>
</html>
<%
    }
%>