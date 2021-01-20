<%@page import="web.User"%>
<%@page import="web.UserMapper"%>
<%@ page import="java.io.*, java.util.*, java.sql.*"%>
<%@ page import="org.apache.ibatis.io.Resources"%>
<%@ page import="org.apache.ibatis.session.*"%>
<%@ page import="org.mariadb.jdbc.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<c:set var="name" value="${ param.name }" />
<c:set var="passwd" value="${ param.passwd }" /> 
<c:set var="query" value="SELECT * FROM user WHERE name='${name}' AND passwd = '${passwd}';" /> 

<!doctype html>
<html lang="en">
  <head>
  	<link href="css/login_style_css.css" rel="stylesheet" type="text/css">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/a_team/js/110_login.js"></script>
  </head>

  <body>
	  <sql:setDataSource var = "snapshot" driver = "org.mariadb.jdbc.Driver"
         url = "jdbc:mariadb://localhost:3306/XCLICK_DEPLOY3_LARGE_DATA"
         user = "XCLICK_DEPLOY3"  password = "admin"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
         ${query}
      </sql:query>



<c:if test="${empty result.rows }">
	<div class="wrapper fadeInDown">
	  <div id="formContent">
	    <!-- Tabs Titles -->
	
	    <!-- Login Form -->
	    <form id="loginForm" name="loginForm" method="post">
	      <input type="text" id="name" class="fadeIn second" name="name" placeholder="login">
	      <input type="text" id="passwd" class="fadeIn third" name="passwd" placeholder="password">
	      <input type="button" class="fadeIn fourth" value="Log In" onclick="checkLogin()">
	    </form>
	    <!-- Remind Passowrd -->
	    <div id="formFooter">
	      <a class="underlineHover" href="#">Forgot Password?</a>
	    </div>
	
	  </div>
	</div>
</c:if>

<c:if test="${ not empty result.rows }">
<!-- 
<jsp:include page="/a_team/210_mail_inbox.jsp">
	<jsp:param name="name" value="${name}"/>
</jsp:include>
 -->
</c:if>

  </body>
</html>
