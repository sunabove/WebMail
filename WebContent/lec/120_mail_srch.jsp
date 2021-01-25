<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="./110_mail_list.jsp" />

<c:if test="${ empty sessionScope.userid }">
	<%-- 로그인 세션 체크 --%>
	<c:set var="valid" value="${false}" />
	<c:redirect url="100_user_login.jsp">
	</c:redirect>
</c:if>