
package webapp1;

import java.sql.ResultSet;
import java.sql.SQLException;


public class LogInDao implements AutoCloseable {
    
    static String loginString1 = "SELECT username, password FROM registered_users";
    
    public static final String USER_FOUND = "User Found";
    public static final String INCORRECT_PASSWORD = "Incorrect Password";
    public static final String USER_NOT_FOUND = "User Not Found";
    
    
    private final GeneralDaoClass gdc;
    
    public LogInDao() throws SQLException{
        gdc = new GeneralDaoClass();
    }
    
    public String checkCredentials(String usr, String pass) throws SQLException{
    
        ResultSet res = gdc.executeQuery(loginString1);
                  
        while(res.next()){
            if(usr.equals(res.getString("username"))){
                if(pass.equals(res.getString("password"))){
                    return USER_FOUND;
                }
                else{
                    return INCORRECT_PASSWORD;
                }
            }
        }    
        return USER_NOT_FOUND;
    }

    @Override
    public void close() throws SQLException{
        gdc.close();
    }
    
}
