<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1,  minimum-scale=1.0, maximum-scale=1.0">
        <title>General Info</title>
        <link rel="stylesheet" href="styling/bootstrap.min.css">
        <link rel="stylesheet" href="styling/footer-style.css">
        <link rel="stylesheet" href="styling/generalInfo-style.css">
        
    </head>
    <body>
        <div class="class1">
        <c:import url="generalInfoBody.jsp"></c:import>
        
        <form action="index.jsp" method="POST">
            <input type="submit" value="Back" name="login" id="back_button"/>
        </form> 
        </div>
        
        <c:import url="footer.jsp"></c:import>
    </body>
</html>
