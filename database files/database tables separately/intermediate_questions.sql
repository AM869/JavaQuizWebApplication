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
-- Table structure for table `intermediate_questions`
--

CREATE TABLE `intermediate_questions` (
  `questionbody` varchar(300) NOT NULL,
  `answer1` varchar(300) NOT NULL,
  `answer2` varchar(300) NOT NULL,
  `answer3` varchar(300) NOT NULL,
  `answer4` varchar(300) NOT NULL,
  `correctanswer` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `intermediate_questions`
--

INSERT INTO `intermediate_questions` (`questionbody`, `answer1`, `answer2`, `answer3`, `answer4`, `correctanswer`) VALUES
('Can constructor be inherited?', 'True.', 'False.', 'Only if it is declared public.', 'Only if it is declared protected.', 'B'),
('Is it necessary that each try block must be followed by a finally block?\r\n', 'True.', 'Try must be followed by either catch or finally or both.', 'Only if we also have a catch block.', 'Try can be followed by a catch block or a finally block but not both at the same time.', 'B'),
('What is Abstraction?', 'Abstraction is a technique to define different methods of same type.', 'Abstraction is the ability of an object to take on many forms.', 'It refers to the ability to make a class abstract in OOP.\r\n', 'It is the ability of a class to inherit the properties from its superclass.', 'C'),
('What is an applet?', 'An applet is a Java program that runs in a Web browser.\r\n', 'Applet is a standalone java program.\r\n', 'Applet is a tool.\r\n', 'Applet is a run time environment.', 'A'),
('What is an immutable object?', 'An immutable object can be changed once it is created.', 'An immutable object can''t be changed once it is created.', 'An immutable object is an instance of an abstract class.', 'None of the above.\r\n', 'B'),
('What is an Interface?', 'Interface is a nested class.', 'Interface is an abstract class.', 'Interface is a concrete class.', 'None of the above.', 'D'),
('What is class variable?', 'class variables are static variables within a class but outside any method.', 'class variables are variables defined inside methods, constructors or blocks.', 'class variables are variables within a class but outside any method.\r\n', 'None of the above.', 'A'),
('What is Encapsulation?\r\n', 'Encapsulation is a technique to define different methods of same type.', 'Encapsulation is the ability of an object to take on many forms.\r\n', 'Encapsulation is the technique of making the fields in a class private and providing access to\r\nthe fields via public methods.', 'Encapsulation is the technique of making the methods in a class private and all fields public.\r\n', 'C'),
('What is function overloading?\r\n', 'Methods with same name but different parameters.', 'Methods with same name but different return types.\r\n', 'Methods with same name, same parameter types but different parameter names.', 'None of the above.', 'A'),
('What is function overriding?', 'If a subclass uses a method that is already provided by its parent class, it is known as Method\r\nOverriding.', 'If a subclass provides a specific implementation of a method that is already provided by its\r\nparent class, it is known as Method Overriding.', 'Both of the above.', 'None of the above.', 'B'),
('What is inheritance?', 'It is the process where one object acquires the properties of another.', 'Inheritance is the ability of an object to take on many forms.', 'Inheritance is a technique to define different methods of same type.', 'None of the above.', 'A'),
('What is instance variable?', 'Instance variables are static variables within a class but outside any method.', 'Instance variables are variables defined inside methods, constructors or blocks.\r\n', 'Instance variables are variables within a class but outside any method.', 'None of the above.\r\n', 'C'),
('What is local variable?', 'Variables defined inside methods, constructors or blocks are called local variables.', 'Variables defined outside methods, constructors or blocks are called local variables.', 'Static variables defined outside methods, constructors or blocks are called local variables.', 'None of the above.', 'A'),
('What is NullPointerException?', 'A NullPointerException is thrown when calling the instance method of a null object or\r\nmodifying/accessing field of a null object.', 'A NullPointerException is thrown when object is set as null.', 'A NullPointerException is thrown when object property is set as null.', 'None of the above.\r\n', 'A'),
('What is polymorphism?', 'Polymorphism is a technique to define different objects of same type.', 'Polymorphism is the ability of an object to take on many forms.', 'Polymorphism is a technique to define different methods of same type.', 'None of the above.', 'B'),
('What is the default value of a Boolean variable?', 'true', 'false', 'null', 'not defined', 'B'),
('What is the default value of char variable?', '''\\u0000''\r\n', '0', 'null', 'not defined', 'A'),
('What is the default value of double variable?', '0.0d\r\n', '0.0f', '0', 'not defined', 'A'),
('What is the default value of float variable?', '0.0d', '0.0f\r\n', '0', 'not defined', 'B'),
('What is the default value of long variable?\r\n', '0', '0.0', '0L', 'not defined', 'C'),
('What is the default value of Object variable?', 'undefined', 'null', '0', '&', 'B'),
('What is the default value of String variable?', '"', '""', 'null', 'not defined', 'C'),
('What kind of variables a class can consist of?', 'class variables, instance variables', 'class variables, local variables, instance variables', 'class variables', 'class variables, local variables', 'B'),
('Which of the following is false about String?', 'String is immutable.', 'String can be created using new operator.', 'String is a primitive data type.', 'A string literal is a reference to an instance of class String.', 'C'),
('Which of the following is true about private access modifier?', 'Variables, methods and constructors which are declared private can be accessed only by the\r\nmembers of the same class.', 'Variables, methods and constructors which are declared private can be accessed by any class\r\nlying in same package.\r\n', 'Variables, methods and constructors which are declared private in the superclass can be\r\naccessed only by its child class.', 'None of the above.', 'A'),
('Which of the following is true about protected access modifier?', 'Variables, methods and constructors which are declared protected can be accessed by any\r\nclass.', 'Variables, methods and constructors which are declared protected can be accessed by any\r\nclass lying in same package and a subclass of this class in other packages.', 'Variables, methods and constructors which are declared protected in the superclass can be\r\naccessed only by its child class.', 'Variables, methods and constructors which are declared protected cannot be accessed outside this class', 'B'),
('Which of the following is true about public access modifier?', 'Variables, methods and constructors which are declared public can be accessed by any class.', 'Variables, methods and constructors which are declared public can be accessed by any class\r\nlying in same package.\r\n', '- Variables, methods and constructors which are declared public in the superclass can be\r\naccessed only by its child class.', 'None of the above.', 'A'),
('Which of the following is true about String?', 'String is mutable.\r\n', 'String is immutable.', 'String is a data type.', 'None of the above.', 'B'),
('Which of the following is true about super class?\r\n', 'Variables, methods and constructors which are declared private can be accessed only by the\r\nmembers of the super class.\r\n', 'Variables, methods and constructors which are declared public in the superclass can be\r\naccessed by any class.\r\n', 'Variables, methods and constructors which are declared protected can be accessed by any\r\nsubclass of the super class.\r\n', 'All of the above', 'D'),
('Which of the following stands true about default modifier of class\r\nmembers?', 'By default, variables, methods and const ructors can be accessed by subclass only.', 'By default, variables, methods and constructors can be accessed by any class lying in any\r\npackage.', 'By default, variables, methods and constructors can be accessed by any class lying in the same\r\npackage.', 'None of the above', 'C'),
('Which operator is considered to be with highest precedence?\r\n', ' () , []\r\n', ' =\r\n', ' ?:', '%', 'A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `intermediate_questions`
--
ALTER TABLE `intermediate_questions`
  ADD PRIMARY KEY (`questionbody`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
