
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


public class SubmitAquizServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        response.setContentType("text/html;charset=UTF-8");                        
//        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
//        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
//        response.setHeader("Expires", "0"); // Proxies.
        
        
        //check if user is logged in and if he has taken a quiz
        HttpSession session=request.getSession();
        if(session.getAttribute("userid")==null ){
            response.sendRedirect("index.jsp");}
        else if(session.getAttribute("quiz_type")==null){
            response.sendRedirect("home.jsp");}
        else{
            String username = (String)session.getAttribute("userid");
            String quiz_type = (String)session.getAttribute("quiz_type");
            int numberOfQuestions = (int)(session.getAttribute("numberOfQuestions"));
            Map<String,String> questionsInfoMap = (Map)session.getAttribute("questions");
            
            int correct_answers=0;
            int unanswered=0;
            int wrong_answers=0;
            
            //check user's answer for each question
            for(int i=1;i<=numberOfQuestions;i++){
                if(request.getParameter("answer"+i)!=null){
                    
                    if(request.getParameter("answer"+i).equals(questionsInfoMap.get("correctanswer"+i))){
                        correct_answers++;
                    }
                    else{
                        wrong_answers++;

                        //wrongly answered question
                        request.setAttribute("wrong_question_body"+wrong_answers,questionsInfoMap.get("question"+i));

                        //the possible answers the user had to choose from
                        request.setAttribute("wrong_question_a1"+wrong_answers,questionsInfoMap.get("question"+i+"_a1"));
                        request.setAttribute("wrong_question_a2"+wrong_answers,questionsInfoMap.get("question"+i+"_a2"));
                        request.setAttribute("wrong_question_a3"+wrong_answers,questionsInfoMap.get("question"+i+"_a3"));
                        request.setAttribute("wrong_question_a4"+wrong_answers,questionsInfoMap.get("question"+i+"_a4"));

                        //user's answer
                        request.setAttribute("wrong_answer"+wrong_answers,request.getParameter("answer"+i));
                        //correct answer
                        request.setAttribute("correct_answer"+wrong_answers,questionsInfoMap.get("correctanswer"+i));
                    }
                }
            }
            
            session.removeAttribute("questions");

            unanswered=10-correct_answers-wrong_answers;
            request.setAttribute("answered_correctly","Answered correctly: "+correct_answers+" out of 10");
            request.setAttribute("unanswered","Left unanswered: "+unanswered+" out of 10");
            request.setAttribute("answered_wrongly",wrong_answers);
            
            
            //UPDATE the database stats
            try(SubmitQuizDao submitDao = new SubmitQuizDao();){
                
                String level_up = submitDao.updateStats(username, quiz_type, numberOfQuestions, correct_answers);
                if (!(level_up == null)){
                    request.setAttribute("level_up",level_up);
                }
                
                request.getRequestDispatcher("quiz_results.jsp").forward(request,response);
                
            } catch (SQLException ex) {
                Logger.getLogger(SubmitAquizServlet.class.getName()).log(Level.SEVERE, null, ex);
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
