<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="./010_common.jsp" />

<c:if test="${ empty sessionScope.userid }">
	<%-- 로그인 세션 체크 --%>
	<c:set var="valid" value="${false}" /> 
</c:if>

<sql:query dataSource="${snapshot}" var="mailList">
	<%-- 메일 목록 조회 --%>
	
	SELECT 
	  LAG(  mailid ) OVER( ORDER BY rno ) AS prev_mailid, 
	  LEAD( mailid ) OVER( ORDER BY rno ) AS next_mailid,
	  a.*
	FROM 
	( SELECT	   
		  ROW_NUMBER() OVER(ORDER BY INSTR( tm.title, srch_keyword ), tm.RCVDATE ) rno , 
		  tm.mailid AS mailid , 
		  tu.userid, tu.name, tm.title ,tms.simplecontent AS content ,
		  tm.RCVUSERID, tm.RCVDATE, tmr.rcvtype , 
	  	'' as z	   
	  FROM 	  
		  ( SELECT NVL(?, '') AS srch_keyword FROM dual ) AS param , 
		  t_user tu
		  LEFT JOIN t_mail tm ON ( tu.userid = tm.rcvUserId AND tu.name='admin' )
		  LEFT JOIN t_mail_rcvinfo tmr ON tm.MAILID = tmr.mailid
		  LEFT JOIN t_mail_simplecontent tms ON tm.MAILID = tms.mailid
	  WHERE 1 = 1 
		  AND tm.mailid IS NOT NULL 
		  AND ( LENGTH( srch_keyword ) = 0 OR SIGN( INSTR( tm.title, srch_keyword ) ) = 1 )
	  ORDER BY INSTR( tm.title, srch_keyword ), tm.RCVDATE
	) AS a
	WHERE mailid = NVL( ?, mailid )
	ORDER BY rno
	
	<sql:param value="${param.srch_keyword}" /> <%-- srch keyworkd --%>
	<sql:param value="${param.mailid}" />		
</sql:query>

<c:forEach var="row" items="${mailList.rows}">
	<c:set var="mail" value="${ row }" />
</c:forEach>

<div class="header">
	<h1 class="page-title" style="overflow:hidden; text-overflow:ellipsis;">
		<a class="icon circle-icon glyphicon glyphicon-chevron-left trigger-message-close" />
		<a class="icon circle-icon glyphicon glyphicon-chevron-right trigger-message-close" />
		${mail.title}
		<span class="grey">&nbsp;</span>
	</h1>
	<p>
		From <a href="#"> ${sessionScope.username } </a> 
		to <a href="#"> ${mail.rcvUserId} </a>
		, started on 
		<a href="#"> <fmt:formatDate pattern='yyyy-MM-dd HH:mm:ss' value='${mail.rcvDate}' /> </a>.
	</p>
</div>

<div id="message-nano-wrapper" class="nano has-scrollbar">
	<div class="nano-content" tabindex="0" style="right: -17px;">
		<ul class="message-container">
			<li class="sent">
				<div class="details">
					<div class="left">
						${sessionScope.username }
						<div class="arrow"></div>
						${mail.rcvUserId}
					</div>
					<div class="right"> <fmt:formatDate pattern='yyyy-MM-dd HH:mm:ss' value='${mail.rcvDate}' /> </div>
				</div>
				<div class="message">
					<p style="overflow:hidden; text-overflow: ellipsis;">
						${mail.content} 
					</p>
				</div>
				<div class="tool-box">
					<a href="#" class="circle-icon small glyphicon glyphicon-share-alt" />
					<a href="#" class="circle-icon small red-hover glyphicon glyphicon-remove" />
					<a href="#" class="circle-icon small red-hover glyphicon glyphicon-flag" />
				</div>
			</li>

		</ul>
	</div>
	<div class="nano-pane">
		<div class="nano-slider" style="height: 54px; transform: translate(0px, 0px);"></div>
	</div>
</div>
