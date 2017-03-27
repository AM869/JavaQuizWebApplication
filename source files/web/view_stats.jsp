<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%  //first check if user "can be" here
    if(session.getAttribute("userid")==null ){     
        response.sendRedirect("index.jsp");}
    else if(request.getAttribute("rank")==null){
        response.sendRedirect("ViewStatsServlet");
    }
    else{
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Personal Stats</title>
        <link rel="stylesheet" href="styling/bootstrap.min.css">
        <link rel="stylesheet" href="styling/viewStats-style.css">
        <link rel="stylesheet" href="styling/footer-style.css">
    </head>

    <body>
  
        <div class="class1">
        <form class="buttons" name="home" action="home.jsp" method="POST">
            <input  type="submit" value="HOME" name="home button" />
        </form>        
        <form class="buttons" action="LogOutServlet" method="POST">
            <input  type="submit" value="Log out" />
        </form>

        <h3>Username: <%=session.getAttribute("userid")%></h3>
        <p class="class2" >Rank: <%=request.getAttribute("rank")%></p>
        <p class="class2" >Took <%=request.getAttribute("beginner_count")%> beginner quizzes and averaged a : <%=request.getAttribute("beginner_score")%></p>
        <p class="class2" >Took <%=request.getAttribute("intermediate_count")%> intermediate quizzes and averaged a : <%=request.getAttribute("intermediate_score")%></p>
        <p class="class2" >Took <%=request.getAttribute("advanced_count")%> advanced quizzes and averaged a : <%=request.getAttribute("advanced_score")%></p>
        </div>
        
        <c:import url="footer.jsp"></c:import>
    </body>
</html>
<%
    }
%>