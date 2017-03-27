
package webapp1;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;


public class QuizDao implements AutoCloseable{
    
    private final GeneralDaoClass gdc;
    
    static String quizString1 = "SELECT * FROM basic_questions  ORDER BY RAND()  LIMIT 10";
    static String quizString2 = "SELECT * FROM intermediate_questions  ORDER BY RAND()  LIMIT 10";
    static String quizString3 = "SELECT * FROM advanced_questions  ORDER BY RAND()  LIMIT 10";
    static String rankCheck = "SELECT rank FROM registered_users WHERE username= ? ";
    
    public static final String TYPE_1 = "type1";
    public static final String TYPE_2 = "type2";
    public static final String TYPE_3 = "type3";
    
    
    
    public QuizDao() throws SQLException{
        gdc = new GeneralDaoClass();
        
    }
    
    //helper method, to avoid boilerplate code in takeAquiz method
    private Map mappingFromQuestionsTable(int numberOfQuestions, ResultSet res) 
        throws SQLException{
        
        //Map size is number_of_questions*number_of_mappings_for_each_question,
        //numberOfQuestions is the number of questions that will appear in quiz
        //and the number of mappings needed for each question, is the number of 
        //columns of the Questions' tables in database, which is 6 in our case.
        //In short we map the column values from the database, to our 
        //standard question/answer keys here, for each question i.

        Map<String,String> questionsInfoMap = new HashMap<>(numberOfQuestions*6);
        
            int i = 1;
        while(res.next()){
            questionsInfoMap.put("question"+i,res.getString("questionbody"));
            questionsInfoMap.put("question"+i+"_a1",res.getString("answer1"));
            questionsInfoMap.put("question"+i+"_a2",res.getString("answer2"));
            questionsInfoMap.put("question"+i+"_a3",res.getString("answer3"));
            questionsInfoMap.put("question"+i+"_a4",res.getString("answer4"));
            questionsInfoMap.put("correctanswer"+i,res.getString("correctanswer"));                                      
            i++;
        }
        
        return questionsInfoMap;
        
    }
    
    private String rank (String usr) throws SQLException{
        gdc.prepareStmt(rankCheck).setString(1,usr);
        ResultSet rank = gdc.executeQuery();
        rank.next();
        return rank.getString("rank");
    }
    
 
    private boolean canTake(String usr, String type) throws SQLException{
        
        if(type.equals(TYPE_2)){
            if(rank(usr).equals("Beginner")){
                return false;
            }        
        }
        else if(type.equals(TYPE_3)){
            if( rank(usr).equals("Beginner") || rank(usr).equals("Intermediate")){
                return false;
            }            
        }
        return true;
    }
    
    
    //first check if quiz type is appropriate for user rank, if it is
    //then proceed to return a database mapping of question, its  possible    
    //answers, and the correct answer, for each randomly picked question
    //--return null if quizType is not appropriate for the user's rank
    public Map takeAquiz(String userId, String quizType, int numberOfQuestions) throws SQLException{
        if(canTake(userId,quizType)){
            ResultSet res;
            Map<String,String> map;

            switch (quizType) {
                case TYPE_1:
                    System.out.println("1 fora prepi k ali mia");
                    res = gdc.executeQuery(quizString1);
                    map = mappingFromQuestionsTable(numberOfQuestions, res);
                    break;
                case TYPE_2:
                    res = gdc.executeQuery(quizString2);
                    map = mappingFromQuestionsTable(numberOfQuestions, res);
                    break;
                case TYPE_3:
                    res = gdc.executeQuery(quizString3);
                    map = mappingFromQuestionsTable(numberOfQuestions, res);
                    break;
                default:                
                    res = null;
                    map = null;
                    break;            
            }

            return map;
   
        }
        
        return null;
    }

    
    @Override
    public void close() throws SQLException {
       gdc.close();
    }
    
}
