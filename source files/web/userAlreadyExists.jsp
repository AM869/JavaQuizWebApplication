<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Register an account</title>
        <link rel="stylesheet" href="styling/bootstrap.min.css">
        <link rel="stylesheet" href="styling/footer-style.css">
        <link rel="stylesheet" href="styling/userAlreadyExists-style.css">
    </head>
    
    <body>
        <div id="main-content">
            <p class="text-content"><span id="colored">Username already exists</span>, choose another please!</p>
            <form action="registration.jsp">
                <input type="submit" value="GO BACK" />
            </form>
        </div>
        
        <c:import url="footer.jsp"></c:import>
    </body>
</html>