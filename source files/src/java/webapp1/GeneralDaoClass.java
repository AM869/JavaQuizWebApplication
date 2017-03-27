
package webapp1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


//simple dao class 
//use of GeneralDaoClass' methods ensures that all needed resources are closed just before being opened again
//no need to explicitly close resources if you are using this class' methods, just close the class with .close() after you are done with database 
//this class doesnt return its connection object and has autocommit off so if you do database work with it and need a result set to work on you have to use this class' execute methods
//to commit changes in database
//also the non argument execute methods will perform the action on this classes stmt field which is set by the prepareStmt method
//if a PreparedStatement is created with the prepareStmt and then the user doesnt call afterwards one of the three non argument methods to perfom the action, 
//the action will never be commited because the con.commit() is called only on the execute methods in this class(both in those with arguments and those with no arguments )

 
 /**
  * <p>
  * General purpose DAO class, to be used by the other, specific-purpose DAO classes.
  * This class doesn't return its Connection object and should 
  * be treated almost the same way, as a Connection object would be.
  * No need to explicitly close resources if you are using this class' methods,
  * just close this class' object with {@link #close()} method after you are done with it.
  * </p>
  * <p>
  * One connection, one PreparedStatement and one ResultSet can be active 
  * at the same time, for each object of this class.
  * If a new PreparedStatement is created using 
  * this class' prepareStmt method, the previous one will be closed.
  * The user can use this class' PreparedStatement object for batch statements, 
  * but cannot create multiple, active, PreparedStatement objects 
  * using this class' {@link #prepareStmt(java.lang.String) } method.
  * </p>
  * <p>The Connection object associated with this class has autocommit disabled,
  * so if the user wants to ensure his changes are committed, he has to use this class' 
  * execution methods, which make a call to 
  * <a href="https://docs.oracle.com/javase/8/docs/api/java/sql/Connection.html#commit--" target="_blank">Connection.commit()</a> 
  * after they are done with their corresponding execution.</p>
  * <p>When the user is done using this class' object, he should call the 
  * {@link #close()} method on the object to release all remaining resources.</p>
  */
public class GeneralDaoClass implements AutoCloseable {
    
    //the database details are encapsulated in this class
    
    //change those to match your own database
    private static String connectionUrl = "jdbc:mysql://localhost:3306/your_new_database";   //the new_database you created
    private static String username = "your_new_database_username";                           //the username to access your new_database
    private static String password = "your_new_database_password";                           //the password to access your new_database
    private static String databaseVendorDriverClassName = "com.mysql.jdbc.Driver";           //dont change if your using the official MySQL Connector/J jdbc driver, which must first be added in the project classpath, in order to be used.
    
    //data access resources
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet res;
    
    
    //1 connection is active per object
    /**
     * No argument constructor that also initializes internally a Connection object
     *
     * @throws SQLException
     */    
    public GeneralDaoClass() throws SQLException{
        getCon();
    }
    
    //Connection method
    private Connection getCon() throws SQLException{
        try {
            
            if(con != null){
                con.close();
                con = null;           
            }
            
            Class.forName(databaseVendorDriverClassName);
            
            con = DriverManager.getConnection(connectionUrl,username,password);

            con.setAutoCommit(false);

        } 
        catch (ClassNotFoundException ex) {
            Logger.getLogger(GeneralDaoClass.class.getName()).log(Level.SEVERE,
                "The specified database vendor driver, \""+databaseVendorDriverClassName+"\", was not found in project classpath", ex);
        }
              
        return con;
    }
    
    
    //PreparedStatement method
    /**
     * <p>Creates a PreparedStatement Object using this class's Connection Object
     * and closes the previous PreparedStatement and ResultSet objects.</p>
     * <p>This method should be called if the user wants to further process 
     * his sql statement, like using parameter placeholders '?', for values
     * to be inserted at a later time with the PreparedStatement's setter methods,
     * or use batch processing methods like <a href="http://docs.oracle.com/javase/8/docs/api/java/sql/PreparedStatement.html#addBatch--" target="_blank">addBatch()</a> etc.</p>
     * @param sqlString the SQL statement String to be prepared(precompiled)
     * @return the reference to the PreparedStatement Object of this class
     * @throws SQLException
     * @see <a href="http://docs.oracle.com/javase/8/docs/api/java/sql/Statement.html" target="_blank">java.sql.Statement</a>, <a href="http://docs.oracle.com/javase/8/docs/api/java/sql/PreparedStatement.html" target ="_blank">PreparedStatement</a>
     */
    public PreparedStatement prepareStmt(String sqlString) throws SQLException{

        //
        //explicitly close previous result set and statement if they are open
        closeStmt();

        if(con == null || con.isClosed()){
            getCon();
        }
        stmt = con.prepareStatement(sqlString);
        
        return stmt;
    }
    
    
    /** 
     * Convention method, that calls internally the 
     * {@link #prepareStmt(java.lang.String)} method,
     * using this method's String parameter.
     * 
     * @param sqlString
     * @return
     * @throws SQLException 
     * @see #execute()
     */
    public boolean execute(String sqlString) throws SQLException{
        boolean b = false;

        b = prepareStmt(sqlString).execute();
        con.commit();
        
        return b;
    }
    
    
    /**
     * Convention method, that calls internally the
     * {@link #prepareStmt(java.lang.String) } method,
     * using this method's String parameter.
     * 
     * @param sqlString
     * @return
     * @throws SQLException 
     * @see executeUpdate()
     */
    public int executeUpdate(String sqlString) throws SQLException{
        int i = -99;

        i = prepareStmt(sqlString).executeUpdate();
        con.commit();
         
        return i;
    }
    
    
    /**
     * Convention method, that calls internally the
     * {@link #prepareStmt(java.lang.String) } method,
     * using this method's String parameter.
     * 
     * @param sqlString
     * @return
     * @throws SQLException 
     * @see executeQuery()
     */
    public ResultSet executeQuery(String sqlString) throws SQLException{             

        res = prepareStmt(sqlString).executeQuery();
        con.commit();

        return res;
    }
    
    
    //call execute on the PreparedStatement stmt field of this class
    /**
     * Calls execute on the active PreparedStatement Object of this class,
     * which was set with the prepareStmt method of this class explicitly, or 
     * implicitly, after using the execute methods of this class, with the String argument.
     * 
     * @return
     * @throws SQLException 
     * @see <a href="http://docs.oracle.com/javase/8/docs/api/java/sql/PreparedStatement.html#execute--" target="_blank">PreparedStatement.execute()</a>
     */
    public boolean execute() throws SQLException{
        boolean b = false;
        
        //explicitly close previous result set if it is left open
        closeRes();

        b = stmt.execute();
        con.commit();
        
        return b;
    }
    
    
    //call executeUpdate on the PreparedStatement stmt field of this class
    /**
     * Calls executeUpdate on the active PreparedStatement Object of this class,
     * which was set with the prepareStmt method of this class explicitly, or 
     * implicitly, after using the execute methods of this class, with the String argument.
     * 
     * @return
     * @throws SQLException 
     * @see <a href="http://docs.oracle.com/javase/8/docs/api/java/sql/PreparedStatement.html#executeUpdate--" target="_blank">PreparedStatement.executeUpdate() </a>
     */
    public int executeUpdate() throws SQLException{
        int i = -99;
        
        //explicitly close previous result set if it is left open
        closeRes();

        i = stmt.executeUpdate();
        con.commit();
        
        return i;
    }
    
    
    //call executeQuery on the PreparedStatement stmt field of this class
    /**
     * Calls executeQuery on the active PreparedStatement Object of this class,
     * which was set with the prepareStmt method of this class explicitly, or 
     * implicitly, after using the execute methods of this class, with the String argument.
     * 
     * @return
     * @throws SQLException 
     * @see <a href="http://docs.oracle.com/javase/8/docs/api/java/sql/PreparedStatement.html#executeQuery--" target ="_blank">PreparedStatement.executeQuery()</a>
     */
    public ResultSet executeQuery() throws SQLException{
                  
        //explicitly close previous result set if it is left open
        closeRes();
   
        res = stmt.executeQuery();
        
        con.commit();
        
        return res;
    }
    
    
        /**
     * Calls executeBatch on the active PreparedStatement Object of this class
     * 
     * @return
     * @throws SQLException 
     * @see <a href="http://docs.oracle.com/javase/8/docs/api/java/sql/Statement.html#executeBatch--" target="_blank">java.sql.Statement.executeBatch() </a>
     */
    public int[] executeBatch() throws SQLException{
        int [] r;
        
        //explicitly close previous result set if it is left open
        closeRes();

        r = stmt.executeBatch();
        con.commit();
        
        return r;
    }
    
    
    /**
     * Explicitly closes the previously used ResultSet object
     * 
     * @throws SQLException 
     */
    private void closeRes() throws SQLException{
        
        if(res != null){
                res.close();
                res = null;
        }
        
    }
    
    
    /**
     * Explicitly closes the previously used PreparedStatement object and 
     * its corresponding ResultSet, if there is one.
     * 
     * @throws SQLException 
     */
    private void closeStmt() throws SQLException{
         
        closeRes();
        
        if(stmt != null){
            stmt.close();
            stmt = null;
        }
   
    }
    
           
    /**
     * 
     * The user should call this method when he is finally done with this class'
     * object, to release the last resources this object is occupying, and
     * ensure that all resources are closed.
     * 
     * @throws SQLException 
     */
    @Override
    public void close() throws SQLException   {
        
        closeStmt();
            
        if(con != null){
            con.close();
            con = null;
        }

    }
    
}
