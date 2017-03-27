
package webapp1;

import java.sql.*;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class LogInServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        
        response.setContentType("text/html;charset=UTF-8");
        
//response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
//response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
//response.setHeader("Expires", "0"); // Proxies.
        
        HttpSession session=request.getSession();

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null && password != null){

            try(LogInDao logInDao = new LogInDao();) {
                String status = logInDao.checkCredentials(username, password);
                if(status.equals(LogInDao.USER_FOUND)){
                    session.setAttribute("userid",request.getParameter("username"));
                    response.sendRedirect("home.jsp");
//                    request.getRequestDispatcher("home.jsp").forward(request,response);
                }
                else if(status.equals(LogInDao.INCORRECT_PASSWORD)){
                    response.sendRedirect("indexIncorrect.jsp");
                }
                else if(status.equals(LogInDao.USER_NOT_FOUND)){
                     response.sendRedirect("indexNotFound.jsp");
                }
                else{
                    System.out.println(status);
                    response.sendRedirect("index.jsp");                    
                }
  
            } catch (SQLException ex) {
                Logger.getLogger(LogInServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        else {
            response.sendRedirect("index.jsp");
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
