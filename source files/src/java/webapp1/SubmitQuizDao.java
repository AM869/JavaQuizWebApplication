
package webapp1;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class SubmitQuizDao implements AutoCloseable{

    static String updateRank = "UPDATE registered_users SET rank=? WHERE username=?";
    
    public static final String BEGINNER = "Beginner";
    public static final String INTERMEDIATE = "Intermediate";
    public static final String ADVANCED = "Advanced";
    
    private final GeneralDaoClass gdc;
    
    public SubmitQuizDao() throws SQLException{
        gdc = new GeneralDaoClass();
    }
    
    //set given rank to given user
    private void setRank(String rank, String usr) throws SQLException{
        PreparedStatement stmt = gdc.prepareStmt(updateRank);
        stmt.setString(1,rank);
        stmt.setString(2,usr);
        gdc.execute();
    }
    
    //returns null if rank is not updated, otherwise returns an appropriate message
    private String updateRank(int i,float mean,int count, String rank, String usr) throws SQLException{
        if( (mean>=8.0) && (rank.equals(BEGINNER)) ){
            setRank(INTERMEDIATE, usr);
            return "You can now access intermediate quizzes!";
        }
        else if((mean>=8.0) && (i == 2) && (rank.equals(INTERMEDIATE)) && count>1){
            setRank(ADVANCED, usr);
            return "You can now access advanced quizzes!";
        }
        else if ( (mean>9.0) && (i == 3) && (rank.equals(ADVANCED)) && count>1){
            return "You have mastered this!!!";
        }
        return null;
    }
    
    private String updateMeanCountRank(int i, String usr, int correctAnswers) throws SQLException{
       
        //Retrieve apropriate table-column mean and count from database,
        //based on quiz type(int i here)        
        String mean_column_name = "mean"+i;
        String count_column_name = "count"+i;
        
        ResultSet res = gdc.executeQuery("SELECT rank,"+mean_column_name+","+count_column_name+" FROM registered_users WHERE username='"+usr+"'");
        res.next();
        
        //get Rank
        String rank = res.getString("rank");
       
        //get mean and count and compute the updated ones
        float a = (float)correctAnswers;
        int count = res.getInt(count_column_name);
        float mean = res.getFloat(mean_column_name);
        mean = (mean*count+a)/(count+1);
        count++;
        
        //store updated mean and count in database
        gdc.execute("UPDATE registered_users SET "+mean_column_name+"='"+mean+"', "+count_column_name+"='"+count+"' WHERE username='"+usr+"'");
                       
        return updateRank(i,mean,count,rank,usr); 
    }
    
    
    //Updates the User stats and returns a String notification if the user
    //advanced to the next level or null otherwise.
    public String updateStats(String usr, String quizType, int numberOfQuestions, int correctAnswers) throws SQLException{

        switch (quizType) {
            case QuizDao.TYPE_1:
                return updateMeanCountRank(1,usr,correctAnswers);
            case QuizDao.TYPE_2:
                return updateMeanCountRank(2,usr,correctAnswers);
            case QuizDao.TYPE_3:
                return updateMeanCountRank(3,usr,correctAnswers);
            default:
                return null;
        }
        
    }
    
    
    @Override
    public void close() throws SQLException {
        gdc.close();
    }
    
}
