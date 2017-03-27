-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2016 at 09:20 AM
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
-- Table structure for table `advanced_questions`
--

CREATE TABLE `advanced_questions` (
  `questionbody` varchar(300) NOT NULL,
  `answer1` varchar(300) NOT NULL,
  `answer2` varchar(300) NOT NULL,
  `answer3` varchar(300) NOT NULL,
  `answer4` varchar(300) NOT NULL,
  `correctanswer` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advanced_questions`
--

INSERT INTO `advanced_questions` (`questionbody`, `answer1`, `answer2`, `answer3`, `answer4`, `correctanswer`) VALUES
('Can a constructor be made final or static?', 'It can be made final but not static.', 'It can be made both.\r\n', 'It can''t be either.', 'It can be static but not final.', 'C'),
('Can a constructor be made static or abstract?', 'It can be made abstract but not static.', 'It can''t be both at the same time.But it can be either static or abstract.', 'It can be made static but not abstract.', 'It can''t be either.', 'D'),
('Dynamic binding uses which information for binding?\r\n', 'type.\r\n', 'object.\r\n', 'Both of the above.\r\n', 'None of the above.\r\n', 'B'),
('Method Overloading is an example of', 'Static Binding.\r\n', 'Dynamic Binding.\r\n', 'Both of the above.\r\n', 'None of the above.\r\n', 'A'),
('Method Overriding is an example of', 'Static Binding.', 'Dynamic Binding.', 'Both of the above.', 'None of the above.', 'B'),
('Static binding uses which information for binding?\r\n', 'type.\r\n', 'object.\r\n', 'Both of the above.\r\n', 'None of the above.', 'A'),
('This is the parent of Error and Exception classes.\r\n', 'Throwable\r\n', 'Catchable', 'MainError', 'MainException\r\n', 'A'),
('Under what conditions is an object''s finalize() method invoked by the\r\ngarbage collector?\r\n', 'When it detects that the object has become unreachable.\r\n', 'As soon as object is set as null.\r\n', 'At fixed interval it checks for null value.\r\n', 'None of the above.\r\n', 'A'),
('What are Wrapper classes?', 'These are classes that allow primitive types to be accessed as objects.\r\n', 'These are classes that wraps functionality of an existing class.\r\n', 'Both of the above.', 'None of the above.', 'A'),
('What happens when thread''s sleep() method is called?\r\n', 'Thread returns to the ready state.\r\n', 'Thread returns to the waiting state.\r\n', 'Thread starts running.\r\n', 'None of the above.', 'B'),
('What happens when thread''s yield() method is called?\r\n', 'Thread returns to the ready state.\r\n', 'Thread returns to the waiting state.', 'Thread starts running.\r\n\r\n', 'None of the above.\r\n', 'A'),
('What invokes a thread''s run() method?\r\n', 'JVM invokes the thread''s run() method when the thread is initially executed.\r\n', 'Main application running the thread.', 'start() method of the thread class.\r\n', 'None of the above.\r\n', 'A'),
('What is a marker interface?\r\n', 'marker interface is an interface with no method.\r\n', 'marker interface is an interface with single method, mark().\r\n', 'marker interface is an interface with single method, marker().\r\n', 'none of the above.\r\n', 'A'),
('What is a transient variable?\r\n', 'A t ransient variable is a variable which is serialized during Serialization.\r\n', 'A transient variable is a variable that may not be serialized during Serialization.\r\n', 'A transient variable is a variable which is to be marked as serializable.', 'None of the above.\r\n', 'B'),
('What is composition?', 'Composition is a data structure.\r\n', 'Composition is a way to create an object.\r\n', 'Holding the reference of the other class within some other class is known as composition.\r\n', 'None of the above.\r\n', 'C'),
('What is JIT compiler?\r\n', 'JIT improves the runtime performance of computer programs based on bytecode.', 'JIT is an application development framework.\r\n', 'JIT is an implementation of the Java Virtual Machine which executes Java programs.\r\n', 'None of the above.\r\n', 'A'),
('What is runtime polymorphism?\r\n', 'Runtime polymorphism is a process in which a call to an overridden method is resolved at\r\nruntime rather than at compile-time.', 'Runtime polymorphism is a process in which a call to an overloaded method is resolved at\r\nruntime rather than at compile-time.\r\n', 'Both of the above.\r\n', 'None of the above.', 'A'),
('What is Set Interface?', 'Set is a collection of element which contains elements along with their key.', 'Set is a collection of element which contains hashcode of elements.', 'Set is a collection of element which cannot contain duplicate elements.', 'Set is a collection of element which can contain duplicate elements.', 'C'),
('What is static block?\r\n', 'It is used to create syncronized code.\r\n', 'There is no such block.\r\n', 'It is used to initialize the static data member., It is excuted before main method at the time of\r\nclass loading.\r\n', 'None of the above.\r\n', 'C'),
('What is synchronization?\r\n', 'Synchronization is the capability to control the access of multiple threads to shared resources.', 'Synchronization is the process of writing the state of an object to another object.', 'Synchronization is the process of writing the state of an object to byte stream.', 'None of the above.\r\n', 'A'),
('What is TreeSet Interface?\r\n', 'It is a Set implemented when we want elements in a tree based order.\r\n', 'It is a Set implemented when we want elements in a sorted order.\r\n', 'It is a Set implemented when we want elements in a binary tree format.', 'It is a Set implemented when we want elements in a hiearchical order.\r\n', 'B'),
('What is true about a final class?\r\n', 'class declared final is a final class.\r\n', 'Final classes are created so the methods implemented by that class cannot be overridden.', 'It can''t be inherited.\r\n', 'All of the above.', 'D'),
('What will happen if static modifier is removed from the signature of the\r\nmain method?', 'Compilation Error.\r\n', 'RunTime Error: NoSuchMethodError.\r\n', 'Program will compile and run without any output.\r\n', 'Program will compile and run to show the required output.\r\n', 'B'),
('When finally block gets executed?\r\n', 'Always when try block get executed, no matter exception occurred or not.', 'Always when a method get executed, no matter exception occurred or not.\r\n', 'Always when a try block get executed, if exception do not occur.\r\n', 'Only when exception occurs in try block code.', 'A'),
('When static binding occurs?', 'Static binding occurs during Compile time.', 'Static binding occurs during load time.\r\n', 'Static binding occurs during runtime.', 'None of the above.\r\n', 'A'),
('Which is the way in which a thread can enter the waiting state?', 'Invoke its sleep() method.\r\n', 'Invoke object''s wait method.', 'Invoke its suspend() method.\r\n', 'All of the above.', 'D'),
('Which method must be implemented by all threads?', 'wait()\r\n', 'start()\r\n', 'stop()\r\n', 'run()', 'D'),
('Which of the following is a marker interface?\r\n', 'serializable\r\n', 'comparable\r\n', 'cloneable\r\n', 'none of the above.\r\n', 'A'),
('Which of the following is a thread safe?', 'StringBuilder.\r\n', 'StringBuffer.\r\n', 'Both of the above.\r\n', 'None of the above.\r\n', 'B'),
('Which of the following is Faster, StringBuilder or StringBuffer?', 'StringBuilder.', 'StringBuffer.', 'Both of the above.', 'None of the above.', 'A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advanced_questions`
--
ALTER TABLE `advanced_questions`
  ADD PRIMARY KEY (`questionbody`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
