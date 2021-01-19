<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.io.*, java.util.*, java.sql.*"%> 
<%@ page import = "org.apache.ibatis.io.Resources"%>
<%@ page import = "org.apache.ibatis.session.*"%> 
<%@ page import = "org.mariadb.jdbc.Driver" %>

<%@ page import = "web.*" %>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%
	InputStream inputStream = Resources.getResourceAsStream( "mybatis-config.xml" );
	SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);		
	
	SqlSession sess = sqlSessionFactory.openSession();
	
	UserMapper mapper = sess.getMapper(UserMapper.class);
	
	User user ;
	user = new User(); 
	user.setName( "john");
	user.setPasswd( "admin");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>

<h1>웹 메일 시스템</h1>

<form method="post">
	id : <input type="text" name="name" value="" sie=4/> </br></br>
	pass: <input type="password" name="passwd" value="" sie=4/> </br></br>
		<input type="submit" value="로그인" />
</form>

</body>
</html>