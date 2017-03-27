
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  //check if user is logged
    if(session.getAttribute("userid")==null ){     
    response.sendRedirect("index.jsp");}
    //check if user has taken a quiz  
    else if(session.getAttribute("quiz_type")==null){
        response.sendRedirect("home.jsp");
    }
    else{
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Quiz</title>
        <link rel="stylesheet" href="styling/bootstrap.min.css">
        <link rel="stylesheet" href="styling/footer-style.css">

        <style>
            body {
                background-image:url("image.gif");
            }
            h1 {text-align: center;
            }
            
            #form {
                   margin:0;
                   padding:20px;
                   border: 5px solid green;
                   background-color:rgba(255,255,0,0.3);
            }
            #countdown {
                        background-color: black;
                        color: red;
                        font-size: 250%;
                        position: fixed;
                        right: 15px;
                        bottom: 15px;
                        border-style: solid;
                        border-width: medium;
                        border-color: #98bf21;
            }
            p.p1 {
                font-size: 130%;
            }
            p.p2 {
                font-size: 110%;
            }
            #submit_button {                
                tex-align: center;
                font-size : 150%;
                width: 70%;  height: 3em;
                background: greenyellow;
                border: 3px solid #000;
                text-shadow: 1px 1px 1px #000;
                margin-bottom:50px;
            }

            body{
                text-align: center;
            }
            
            
            
            
        </style>
    </head>
    <body>
        <h1>Quiz is on!</h1>
        <span id="countdown" class="timer"></span>
            <script>
            var seconds = 150;
            function timePassed() {
                var minutes = Math.round((seconds - 30)/60);
                var remainingSeconds = seconds % 60;
                if (remainingSeconds < 10) {
                    remainingSeconds = "0" + remainingSeconds;  
                }
                document.getElementById('countdown').innerHTML = minutes + ":" + remainingSeconds+" left!";
                if (seconds == 0) {
                    clearInterval(countdownTimer);
                    document.getElementById('countdown').innerHTML = "Time's up!!";
                } else {
                    seconds--;
                }
            }
 
            var countdownTimer = setInterval('timePassed()', 1000);
        </script><br>
        
        <form id="form" name="quiz_form" action="SubmitAquizServlet" method="POST">
            
            <%for(int i=1;i<=(Integer)session.getAttribute("numberOfQuestions");i++){%>
            <p class="p1"><b>  <%=i%>. <%=((Map)session.getAttribute("questions")).get("question"+i)%></b></p>
            <p class="p2">      <input type="radio" name="<%="answer"+i%>" value="A" id=<%="a"+i%> /><label for=<%="a"+i%> ><%=((Map)session.getAttribute("questions")).get("question"+i+"_a1")%></label></p>
            <p class="p2">      <input type="radio" name="<%="answer"+i%>" value="B" id=<%="b"+i%> /><label for=<%="b"+i%> ><%=((Map)session.getAttribute("questions")).get("question"+i+"_a2")%></label></p>
            <p class="p2">      <input type="radio" name="<%="answer"+i%>" value="C" id=<%="c"+i%> /><label for=<%="c"+i%> ><%=((Map)session.getAttribute("questions")).get("question"+i+"_a3")%></label></p>
            <p class="p2">      <input type="radio" name="<%="answer"+i%>" value="D" id=<%="d"+i%> /><label for=<%="d"+i%> ><%=((Map)session.getAttribute("questions")).get("question"+i+"_a4")%></label></p><br>
            
            <%}%>
            <input type="submit" id="submit_button" value="Submit Answers" name="submit quiz button"  />
            <script type="text/javascript">var wait=setTimeout("document.quiz_form.submit();",151200);</script>
        </form>       
        
    </body>
</html>
<%
    }
%>