<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
//response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
//response.setHeader("Expires", "0"); // Proxies.
    
    if(session.getAttribute("userid")==null ){     
    response.sendRedirect("index.jsp");}
else{
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Home page</title>
        <link rel="stylesheet" href="styling/bootstrap.min.css">
        <link rel="stylesheet" href="styling/footer-style.css">
        <link rel="stylesheet" href="styling/home-style.css">
    </head>
    <style>
        
    </style>
    
    <body>
        <h2>Welcome <%=session.getAttribute("userid")%>! <a id="info" href="generalInfoLogged.jsp">Info-Contact</a> <a id="logout" href="LogOutServlet">LOG-OUT</a></h2>    
             
        
        <form name="takAquiz" action="TakeAquizServlet" method="POST">
            <button class="buttons" name="quiz" type="submit" value="type1">TAKE A BEGINNER QUIZ</button>
            <button class="buttons" name="quiz" type="submit" value="type2">TAKE AN INTERMEDIATE QUIZ</button>
            <button class="buttons" name="quiz" type="submit" value="type3">TAKE AN ADVANCED QUIZ</button>
        </form>
        
        <br><br>
        <form name="stats" action="ViewStatsServlet" method="POST">
            <input type="submit" value="VIEW MY STATS" />
        </form>
        
        <c:import url="footer.jsp"></c:import>

    </body>
</html>
<%
    }
    %>
