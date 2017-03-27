
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
        <link rel="stylesheet" href="styling/registration-style.css">
    </head>

    <body>
        
        <form   action="RegistrationServlet" name="registration form" method="POST">
        <div class="container-fluid">
            
            <div class="row">
                <div class="col-xs-5 left-col" >USERNAME:
                </div>
                <div class="col-xs-7 "><input type="text" name="username" size="20" maxlength="50" required>
                </div>
            </div>
            
            <div class="row">
                <div class="col-xs-5 left-col">PASSWORD: 
                </div>
                <div class="col-xs-7"><input type="password" name="pwd" size="20" maxlength="50" required>
                </div>
            </div>
            
            <div class="row">
                <div class="col-xs-5 left-col">retype PASSWORD: 
                </div>
                <div class="col-xs-7"><input type="password" name="copwd" size="20" maxlength="50" required>
                </div>
            </div>
            
            <div class="row">
                <div class="col-xs-5 left-col">E-MAIL: 
                </div>
                <div class="col-xs-7"><input type="email" name="email" size="20" maxlength="50" required>
                </div>
            </div>
            
            <div class="row">
                <div class="col-xs-5 left-col"><input type="reset" value="Reset" name="clear" id="reset_button"/>
                </div>
                <div class="col-xs-7"><input type="submit" value="Submit" name="submit registration" id="submit_button"/>
                </div>
            </div>
            
        </div>
        </form>
        
        
        <c:import url="footer.jsp"></c:import>
        
    </body>
</html>
