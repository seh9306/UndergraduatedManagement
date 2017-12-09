<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/main.css">
<title>학사 관리</title>
</head>
<body>
	<div id="lecture">
		<p>
			<a href="${pageContext.request.contextPath }/semesterCourse">
				<button>학기별 이수 학점 조회</button>
			</a>
		</p>
	</div>
	<div id="lecture">
		<p>
			<a href="${pageContext.request.contextPath }/divisionCourse">
				<button>이수 구분별 학점 조회</button>
			</a>
		</p>
	</div>
	<div id="lecture">
		<p>
			<a href="${pageContext.request.contextPath }/applyCourse">
				<button>수강 신청하기</button>
			</a>
		</p>
	</div>
	<div id="lecture">
		<p>
			<a href="${pageContext.request.contextPath }/searchCourse">
				<button>수강 신청조회</button>
			</a>
		</p>
	</div>
	<div id="lecture">
		<p>
			<a href="javascript:document.getElementById('logout').submit()">
				<button>로그아웃</button>
			</a>
		</p>
		<form id="logout" action="<c:url value="/logout" />" method="POST">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>
</body>
</html>