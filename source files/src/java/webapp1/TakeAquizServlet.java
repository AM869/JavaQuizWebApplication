
package webapp1;

import java.sql.*;
import java.io.IOException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class TakeAquizServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");                                    
//        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
//        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
//        response.setHeader("Expires", "0"); // Proxies.
        
        //check if user is logged in, and if he has taken a quiz
        HttpSession session=request.getSession();
        if(session.getAttribute("userid")==null ){
            response.sendRedirect("index.jsp");}
        else if(request.getParameter("quiz")==null ){
            response.sendRedirect("home.jsp");}
        else{
            
            //the numberOfQuestions variable could be modified in a later version
            //to be pocibly provided by the user as a parameter
            int numberOfQuestions=10; 
            
            session.setAttribute("numberOfQuestions",numberOfQuestions);

            //check the buttons value to determine the quiz type
            String quiz_type = request.getParameter("quiz");
            
            //here we set quiz type as a session attribute so that we can check if user access the SubmitAquizServlet url explicitly
            //without picking a quiz type first, if the user didn't pick a quiz type first he will be redirected
            //in this servlet we do the same check by checking the request parameter "quiz", if its null or not
            session.setAttribute("quiz_type",quiz_type);

            try(QuizDao quizDao = new QuizDao();) {

                Map<String,String> questionsInfoMap = quizDao.takeAquiz((String)session.getAttribute("userid"),quiz_type, numberOfQuestions);
                if (questionsInfoMap == null){
                    response.sendRedirect("cantTake.jsp");
                } 
                else {
                    
                    session.setAttribute("questions",questionsInfoMap);
                    
                    request.getRequestDispatcher("quiz.jsp").forward(request,response);
                    
                }
            } catch (SQLException ex) {
                Logger.getLogger(TakeAquizServlet.class.getName()).log(Level.SEVERE, null, ex);
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
