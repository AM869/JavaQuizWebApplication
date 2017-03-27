        <h1><span>Test your</span> Java <span>skills</span></h1>
        
        <div class="container-fluid" >
            <div class ="row">  
                <div class="col-xs-6">
                <form class="pad" action="RegistrationServlet" name="log-in form" method="GET">
                    <input type="submit" value="REGISTER HERE" name="registerbutton" />
                </form>
                </div>

                <div  class="col-xs-6">
                    <div class="info" ><a href="generalInfo.jsp">Info-Instructions-Contact</a></div>    
                </div>
            </div>

            <div class="row" >
                <div class="col-xs-12">
                    <form action="LogInServlet" name="log-in form" method="POST">
                        <fieldset>                
                        <legend>Already registered?</legend>
                            USERNAME:<br>
                            <input type="text" name="username" size="30" required maxlength="50">
                            <br>
                            <br>
                            PASSWORD:<br>
                            <input type="password" name="password" size="30" required maxlength="50" >
                            <br>
                            <br>               
                            <input type="submit" value="LOG-IN" name="submitbutton">                       
                        </fieldset>    
                    </form>  
                </div>
            </div>
            
        </div>