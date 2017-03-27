
package webapp1;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class RegistrationDao implements AutoCloseable{
    
    static String registrationString1 = "SELECT username FROM registered_users";
    static String registrationString2 = "INSERT INTO registered_users (username, password,email) VALUES (?,?,?)";
    GeneralDaoClass gdc;
    
    //One GeneralDao for each SpecificDao
    public RegistrationDao() throws SQLException{
        gdc = new GeneralDaoClass();
    }
    
    
    //returns true if registration successful, false if user already exists 
    public boolean registeredNewUser(String username, String password, String email) throws SQLException   {
        boolean registration_successful = true;

        ResultSet results = gdc.executeQuery(registrationString1);

        while(results.next()){
            if (username.equals(results.getString("username"))){
                registration_successful = false;
                return registration_successful;
            }
        }
        
        newRegistration(username, password, email);
        
        
        
        return registration_successful;
    }
    
    private void newRegistration(String usr, String pass, String email) throws SQLException{
        PreparedStatement stmt = gdc.prepareStmt(registrationString2);
        stmt.setString(1,usr);
        stmt.setString(2,pass);
        stmt.setString(3,email);
        gdc.executeUpdate();
    }

    @Override
    public void close() throws SQLException{
        gdc.close();

    }

}
