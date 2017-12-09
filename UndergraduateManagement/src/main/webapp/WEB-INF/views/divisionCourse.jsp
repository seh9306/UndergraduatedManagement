<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이수 구분별 학점 조회</title>
</head>
<body>
	<table>
		<tr>
			<c:forEach var="divisionCourse" items="${divisionCourses}">
				<th>${divisionCourse.division }</th>
			</c:forEach>
			<th>총학점</th>
		</tr>
		<tr>
			<c:forEach var="divisionCourse" items="${divisionCourses}">
				<td>${divisionCourse.totalGrades }</td>
			</c:forEach>
			<td>${totalGrades }</td>
		</tr>
	</table>
	<div id="lecture">
		<p>
			<a href="${pageContext.request.contextPath }/">
				<button>뒤로 가기</button>
			</a>
		</p>
	</div>
</body>
</html>