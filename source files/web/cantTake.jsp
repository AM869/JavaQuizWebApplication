<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  //check if user is logged in
    if(session.getAttribute("userid")==null ){     
    response.sendRedirect("index.jsp");}
    else{
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cant take </title>
        <link rel="stylesheet" href="styling/bootstrap.min.css">
        <link rel="stylesheet" href="styling/footer-style.css">
        <link rel="stylesheet" href="styling/cantTake-style.css">
    </head>
    
    <body>
        <div class="main-content">
        <h1><span style="color:red;">Can't take yet</span>, gotta increase your score on the lower tier first!</h1>
        
        <form class="buttons" name="home" action="home.jsp" method="POST">
            <input type="submit" value="HOME" name="home button" />
        </form>
        
        <form class="buttons" action="LogOutServlet" method="POST">
            <input type="submit" value="Log out" />
        </form>
    </div>
        
        <c:import url="footer.jsp"></c:import>
    </body>
</html>
<%
    }
%>