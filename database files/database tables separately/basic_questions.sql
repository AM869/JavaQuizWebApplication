-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2016 at 09:19 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `basic_questions`
--

CREATE TABLE `basic_questions` (
  `questionbody` varchar(300) NOT NULL,
  `answer1` varchar(300) NOT NULL,
  `answer2` varchar(300) NOT NULL,
  `answer3` varchar(300) NOT NULL,
  `answer4` varchar(300) NOT NULL,
  `correctanswer` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `basic_questions`
--

INSERT INTO `basic_questions` (`questionbody`, `answer1`, `answer2`, `answer3`, `answer4`, `correctanswer`) VALUES
('A compiled java file ends with ', '.java', '.javac', '.jar', '.class', 'D'),
('An object could be ', 'anything', 'an algorithm', 'a data container', 'a program', 'A'),
('Array indexing always starts with the number', '0', '1', '2', '0.0', 'A'),
('Byte code is the machine language for a hypothetical computer called the', 'Java Byte Code Compiler', 'Java Byte Code Interpreter', 'Java Virtual Machine', 'Java Memory Machine', 'C'),
('In  general a good programming way is to declare all class fields as', 'private', 'protected', 'without declaration (default-package access)', 'public', 'A'),
('In Java, 12%5 =', '1', '2', '2.5', '8', 'B'),
('In Java, 5/2 =', '2', '2.5', '3', 'none of the above', 'A'),
('In Java, the % refers to', 'percentages', 'division', 'modulus operator', 'data storage', 'C'),
('In which case, a program is expected to recover?', 'If an error occurs.', 'If an exception occurs.', 'Both of the above.', 'None of the above.', 'B'),
('Java allows for three forms of commenting', '// single line, ** block lines, /*/ documentation', '// single line, /*...*/ block lines, /**...*/ documentation', '/ single line, /* block lines, ** documentation', ' // single line, //...// block lines, //*...*// documentation', 'B'),
('Java Source Code is compiled into', '.exe', 'Source Code', '.Obj', 'Bytecode', 'D'),
('Object-Oriented Programming means', 'Being objective about what you develop', 'Designing the application based on the objects discovered when analyzing the problem', 'Writing an algorithm before writing your program and having a test plan', 'Writing a program composed of java classes', 'B'),
('The name of a variable is known as its:', 'identifier', 'constant', 'data type', 'base', 'A'),
('Variables that are declared, but not initialized, contain', 'blank spaces', 'zeros', '"garbage" values', 'nothing - they are empty', 'C'),
('Variables that describe the data stored at that particular memory location are called', 'identifiers', 'constant variables', 'floating point variables', 'mnemonic variables', 'D'),
('What is a class in java?', 'A class is a blue print from which individual objects are created. A class can contain fields and methods to describe the behavior of an object.', 'class is a special data type.', 'class is used to allocate memory to a data type.', 'none of the above.', 'A'),
('What is an immutable object?', 'An immutable object can be changed once it is created.', 'An immutable object can''t be changed once it is created.', 'An immutable object is an instance of an abstract class.', 'None of the above.', 'B'),
('What is correct syntax for main method of a java class?', 'public static int main(St ring[] args)\r\n', 'public int main(St ring[] args)\r\n', 'public static void main(St ring[] args)\r\n', 'None of the above.\r\n', 'C'),
('What is function overloading?', 'Methods with same name but different parameters.', 'Methods with same name but different return types.', 'Methods with same name, same parameter types but different parameter names.', 'None of the above.', 'A'),
('What is JRE?', 'JRE is a java based GUI application.', 'JRE is an application development framework.', ' JRE is an implementation of the Java Virtual Machine which executes Java programs.', 'None of the above.', 'C'),
('What is Serialization?', 'Serialization is the process of writing the state of an object to another object.', 'Serialization is the process of writing the state of an object to a byte stream.', 'Both of the above.', 'None of the above.', 'B'),
('What is the default value of byte variable?', '0', '0.0', 'null', 'not defined', 'A'),
('What is the default value of int variable?', '0', '0.0', 'null', 'not defined', 'A'),
('What is the default value of short variable?', '0.0', '0', 'null', 'not defined', 'B'),
('What is the size of boolean variable?', '8 bit', '16 bit', '32 or 64 bit depends on virtual machine', 'not precisely defined, is virtual machine dependent', 'D'),
('What is the size of byte variable?', '8 bit', '16 bit', '32 bit', '64 bit', 'A'),
('What is the size of char variable?', '8 bit', '16 bit', '32 bit', '64 bit', 'B'),
('What is the size of double variable?', '8 bit', '16 bit', '32 bit', '64 bit', 'D'),
('What is the size of float variable?', '8 bit', '16 bit', '32 bit', '64 bit', 'C'),
('What is the size of int variable?\r\n', '8 bit', '16 bit', '32 bit', '64 bit', 'C'),
('What is the size of long variable?', '8 bit', '16 bit', '32 bit', '64 bit', 'D'),
('What is the size of short variable?', '8 bit', '16 bit', '32 bit', '64 bit', 'B'),
('What of the following is the default value of a local variable?', 'null', '0', 'Depends upon the type of variable', 'Not assigned', 'D'),
('What of the following is the default value of an instance variable?', 'null\r\n', '0', 'Depends upon the type of variable', 'Not assigned', 'C'),
('When a data type must contain decimal numbers, assign the type', 'int', 'char', 'double', 'long int', 'C'),
('Which of the following is not a keyword in java?\r\n', 'static\r\n', 'Boolean', 'void', 'private', 'B'),
('Which of the following is not a keyword in java?', 'boolean', 'new', 'try', 'Integer', 'D'),
('Which of the following stands true about default modifier of class members?', 'By default, variables, methods and constructors can be accessed by subclass only.', 'By default, variables, methods and constructors can be accessed by any class lying in any package.', 'By default, variables, methods and constructors can be accessed by any class lying in the same package.', 'None of the above.', 'C'),
('Which of the following tool is used to execute java code?', 'jar', 'java', 'javac', 'javadoc', 'B'),
('Which of the tools is used to compile java code?', 'java', 'javac', 'jar', 'javadoc', 'B'),
('Which one is not correct?', 'A class needs to be instantiated before being used', 'An object exists in memory in run time', 'Class and Object are just different names for the same thing', 'An object is a variable, where its type is the class used to declare the variable', 'C');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `basic_questions`
--
ALTER TABLE `basic_questions`
  ADD PRIMARY KEY (`questionbody`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
