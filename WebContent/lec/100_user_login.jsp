<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="./010_common.jsp" />

<c:if test="${ not empty param.name and not empty param.passwd }">	
	<%-- 로그인 처리 --%>
	
	<sql:query dataSource = "${snapshot}" var="result">
	   SELECT userid, name FROM t_user 
	   where name = ? and passwd = ? 
	   <sql:param value="${param.name}"/>
	   <sql:param value="${param.passwd}"/>
	</sql:query> 
	
	<c:set var="userid" 	scope="session" value="" />
	<c:set var="username" 	scope="session" value="" />
	
	<c:forEach var="row" items = "${result.rows}">
	    <c:set var="userid" 	scope="session" value="${row.userid}" />
	    <c:set var="username" 	scope="session" value="${row.name}" />
	</c:forEach> 
	
	<c:if test="${ not empty sessionScope.userid }"> 
		<%-- 로그인 성공하면, 목록 화면으로 이동 --%>
		
		<c:redirect url="110_mail_list.jsp">
		</c:redirect>
	</c:if>
</c:if>

<html lang="ko" class=" -webkit-">
<head>
<title>로그인 페이지 ${a} ${pageContext.request.servletPath} ${ sessionScope.userid }</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>

<body translate="no"> 

	<c:if test="${ false }" > 
		<table border = "1" width = "100%">
	         <tr>
	            <th>userid</th>
	            <th>name</th>  
	         </tr>
	         
	         <c:forEach var = "row" items = "${result.rows}">
	            <tr>
	               <td><c:out value = "${row.userid}"/></td>
	               <td><c:out value = "${row.name}"/></td>
	            </tr>
	         </c:forEach>
	      </table>
      </c:if>

	<main>

		<!-- content -->

		<section class="container mt-4" style=" margin-bottom: 70px;">
			
			<div class="row py-5 mb-4 ">
				<div class="col-6 flex-nowrap justify-content-between align-items-center m-auto h-auto pb-2">
					<div class="card flex-md-row mb-4 shadow-sm h-md-250 bg-light p-0">
						<div class="card-body d-flex flex-column ">
							<form class=" p-3 py-4 " method="">

								<div class="form-group pb-3 text-primary">
									&nbsp;
									<i class="far fa-user"></i>아이디
									<input type="text" id="user_id" name="name" class="form-control mt-2" placeholder="아이디" value="${param.name}"/>
									<small class="form-text text-muted mt-2">
										<span th:text="${ login_error_msg }" id="user_id_error" class="text-danger">
											&nbsp;아이디 또는 이메일 주소를 입력하세요.
										</span>
									</small>
								</div>

								<div class="form-group pb-3">
									<div class="text-primary">
										&nbsp;
										<i class="fas fa-key"></i>암호
									</div>
									<input type="password" id="user_pass" name="passwd" class="form-control mt-2" placeholder="암호" />
									<small class="form-text text-muted mt-2">
										<span id="user_pass_error" class="text-danger">
											&nbsp;비밀번호를 입력하세요.
										</span>
									</small>
								</div>

								<div>
									<br/>
									<br/>
									<br/>
								</div>

								<button type="submit" class="btn btn-primary btn-md btn-block align-center">
									<i class="fas fa-check ml-2"></i> &nbsp; 로그인
								</button>

							</form>
						</div>

					</div>
				</div>
			</div>
		</section>
	</main>
 
</body>
</html>
