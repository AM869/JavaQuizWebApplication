
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


public class ViewStatsServlet extends HttpServlet {
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");                        


        HttpSession session=request.getSession();
        //check if asking user is logged in
        if(session.getAttribute("userid")==null ){
            response.sendRedirect("index.jsp");}
        else{
            //if user is logged proceed
            String username=(String)session.getAttribute("userid");
            
            try(GeneralDaoClass gdc = new GeneralDaoClass();) {
                          
                PreparedStatement stmt=gdc.prepareStmt("SELECT count1,"
                    + " count2, count3, mean1, mean2, mean3, rank"
                    + " FROM registered_users WHERE username=?");
                stmt.setString(1,username);
                ResultSet res=gdc.executeQuery();
                res.next();

                String rank=res.getString("rank");
                int count1=res.getInt("count1");
                int count2=res.getInt("count2");
                int count3=res.getInt("count3");
                Float beginner_score=res.getFloat("mean1");
                Float intermediate_score=res.getFloat("mean2");
                Float advanced_score=res.getFloat("mean3");
                
                request.setAttribute("rank",rank);
                
                request.setAttribute("beginner_count",count1);
                request.setAttribute("beginner_score",beginner_score);

                request.setAttribute("intermediate_count",count2);
                request.setAttribute("intermediate_score",intermediate_score);

                request.setAttribute("advanced_count",count3);
                request.setAttribute("advanced_score",advanced_score);

                request.getRequestDispatcher("view_stats.jsp").forward(request,response);
                
            } catch (SQLException ex) {
                Logger.getLogger(ViewStatsServlet.class.getName()).log(Level.SEVERE, null, ex);
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
