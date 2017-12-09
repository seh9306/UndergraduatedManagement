<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/main.css">
<title>수강 신청조회</title>
</head>
<body>
	<c:if test="${not empty courses }">
		<table id="detail">
			<thead>
				<tr>
					<th>수강년도</th>
					<th>학기</th>
					<th>교과코드</th>
					<th>교과목명</th>
					<th>구분</th>
					<th>학점</th>
				</tr>
			</thead>
			<c:forEach var="course" items="${courses}">
				<tr>
					<td>${course.year }</td>
					<td>${course.semester }</td>
					<td>${course.course_id }</td>
					<td>${course.name }</td>
					<td>${course.division }</td>
					<td>${course.grades }</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<c:if test="${empty courses}">
		<table>
			<tr>
				<th>수강신청 목록이 없습니다.</th>
			</tr>
		</table>
	</c:if>
	<div id="lecture">
		<p>
			<a href="${pageContext.request.contextPath }/">
				<button>뒤로가기</button>
			</a>
		</p>
	</div>
</body>
</html>