<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  //check if user is logged in
    if(session.getAttribute("userid")==null ){     
    response.sendRedirect("index.jsp");}
    //check if user has taken a quiz
    else if(session.getAttribute("quiz_type")==null){
        response.sendRedirect("home.jsp");
    }
    else if (request.getAttribute("answered_correctly")==null){
        response.sendRedirect("home.jsp");
    }
    else{
        session.removeAttribute("quiz_type");
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Quiz Results</title>
        <link rel="stylesheet" href="styling/bootstrap.min.css">
        <link rel="stylesheet" href="styling/quiz_results-style.css">

        <script type="text/javascript">
            function showHide(){
                var checkbox = document.getElementById("showhide");
                var hideform = document.getElementById("myform");
                if(checkbox.checked == true){
                    hideform.style.display = "block";
                }
                else{
                    hideform.style.display = "none";
                }
            }
        </script>
    </head>

    <body>

        <form class="button" name="home" action="home.jsp" method="POST">
            <input type="submit" value="HOME" name="home button" >
        </form>
        
        <form class="button" action="LogOutServlet" method="POST">
            <input type="submit" value="Log out" >
        </form>

        <div class="div1"><%=(String)session.getAttribute("userid")%></div>
        <%if (request.getAttribute("level_up")!=null){%>
        <div class="div1"><span class="green"><%=request.getAttribute("level_up")%></span></div>
        <% } %>
        <div class="div2"><%=request.getAttribute("answered_correctly")%></div>
        <div class="div2"><%=request.getAttribute("unanswered")%></div>
        
        
        <% if (((Integer)request.getAttribute("answered_wrongly"))>0){%>
        
        <div class="div2"><span class="red">Wrongly</span> answered: <%=request.getAttribute("answered_wrongly")%> out of 10</div>
        
        <div class="div3"><input type="checkbox" name="show_hide" id="showhide" onclick="showHide()"/>
        <label for="showhide"><u>Show/Hide answers to wrongly answered questions</u></label></div>
        <br/>
        <form id="myform">
            <%for(int i=1;i<=(Integer)request.getAttribute("answered_wrongly");i++){%>
            <div class="div2"><%=request.getAttribute("wrong_question_body"+i)%></div>
            <div class="div3">A. <%=request.getAttribute("wrong_question_a1"+i)%></div>
            <div class="div3">B. <%=request.getAttribute("wrong_question_a2"+i)%></div>
            <div class="div3">C. <%=request.getAttribute("wrong_question_a3"+i)%></div>
            <div class="div3">D. <%=request.getAttribute("wrong_question_a4"+i)%></div>
            <div class="div3">Your Answer: <span class="red" ><%=request.getAttribute("wrong_answer"+i)%></span></div>
            <div class="div3">Correct Answer: <span class="green"><%=request.getAttribute("correct_answer"+i)%></span></div>
            </br>
            <%}%>
        </form>        
        <%}%>
                                                
    </body>
</html>
<%
    }
%>