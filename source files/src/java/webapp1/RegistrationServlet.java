
package webapp1;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;



public class RegistrationServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
                    
        response.setContentType("text/html;charset=UTF-8");                        

        String username = request.getParameter("username");
        String password = request.getParameter("pwd");
        String confirm_password = request.getParameter("copwd");
        String email = request.getParameter("email");

        if (username==null || password==null || confirm_password==null || email==null){
            response.sendRedirect("registration.jsp");
        }
        else{

            if (!password.equals(confirm_password)){
                response.sendRedirect("twoPasswordsNotMatch.jsp");
            }
            else {
                try (RegistrationDao regDao = new RegistrationDao();){
                    if(regDao.registeredNewUser(username,password,email)){
                        //regDao.close();
                        response.sendRedirect("registrationSuccessful.jsp");                        
                    }
                    else {
                        //regDao.close();
                        response.sendRedirect("userAlreadyExists.jsp");
                    }
                } 
                catch (SQLException ex) {
                    Logger.getLogger(RegistrationServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        }
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
