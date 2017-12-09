<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css">
<title>학사 시스템 로그인</title>
</head>
<body>
	<form class="sign-up" name='f' action="<c:url value="/login"/>"
		method='POST'>
		<h1 class="sign-up-title">학사 시스템 로그인</h1>
		<c:if test="${not empty errorMsg }">
			<div style="color: #ff0000">
				<h3>${errorMsg}</h3>
			</div>
		</c:if>
		<c:if test="${not empty logoutMsg }">
			<div style="color: #0000ff">
				<h3>${logoutMsg}</h3>
			</div>
		</c:if>
		<input type="text" name='username' class="sign-up-input" placeholder="아이디를 입력해주세요." autofocus>
		<input type="password" name='password' class="sign-up-input" placeholder="비밀번호를 입력해주세요.">
		<input type="submit" value="로그인" class="sign-up-button">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<!-- csrf는 세션 단위인가? -->
	</form>
</body>
</html>