# Java quiz web application. Migrated to https://github.com/AM869/tyJAVA
Project


-Project written in java using netbeans IDE.

-This is a small quizz web application, containing theoretical questions about java language.

-Users, after registering, can log in to take java quizzes, and advance categories to take more advanced ones.

-Their progress and score is saved.

-The quizz questions are selected randomly from three question pools, corresponding to three different difficulty categories, based on the category the user chose.



tyJAVA Repository Contents:

1. tyJAVA (netbeans project folder that can be opened with netbeans, the first tyJAVA is the repo name, the second is the netbeans project folder)

2. Database files(contains the database tables that need to be imported for this project)




Setup instructions:


1. Create a new MySQL database and import the tyjava_database.sql file in your new database, OR import one by one the tables from the "database tables separately" folder, in your new database.


2. Open GeneralDaoClass.java class inside package webapp1 in project, and modify the first 4 private static Strings (connectionUrl, username, password, databaseVendorDriverClassname), according to your case.


3. Dont forget to **add the Mysql database jdbc driver in project classpath**. In my case, i used MySQL Connector/J, the official JDBC driver for MySQL.
 
4. Choose the application server you want to deploy the project into. In netbeans, right click the project, click "Properties" in the bottom, click "Run" on the left, and then choose the  "Server:" in the right side.
 If you want to leave the default application server(i used glassfish server), **just Right click on project, go to "Properties" and click "OK" without doing any changes.** This way your netbeans will recreate some project build files to match exactly your environment, and remove potential errors in project, stemming from cloned build files.

 
-How to add jdbc driver to project classpath:
The version i used was the latest at the time, the mysql-connector-java-5.1.39-bin, downloaded from https://dev.mysql.com/downloads/connector/j/. 
After you extract and open the folder, you will find inside a JAR file with the same name as the outer folder name.
Add this JAR file, named mysql-connector-java-5.1.39-bin (or your version) in project libraries(in netbeans right click in Librarires -> Add JAR/Folder...), 
OR (the recommended way) place the JAR file in lib folder inside glassfish directory or apache tomcat or any other application server you may use, this way, the jdbc driver will be accessible to all your projects you deploy, that use
MySQL databases, without having to add it to project libraries everytime.



-In case you are having trouble migrating to your IDE(be it netbeans or some other IDE), try create a new Project in your IDE and manually add the java classes from tyJAVA/src folder, and web pages from tyJAVA/web, and deployment descriptor from tyJAVA/web/WEB-INF, to your new project.
Or try to add the whole src and web files, from tyJAVA project, to your new project folder.
