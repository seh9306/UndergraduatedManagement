<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/main.css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>학기별 이수 학점 조회</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>년도</th>
				<th>학기</th>
				<th>이수 학점</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<c:forEach var="semesterCourse" items="${semesterCourses}">
			<tr>
				<td><c:out value="${semesterCourse.year}"></c:out></td>
				<td><c:out value="${semesterCourse.semester}"></c:out></td>
				<td><c:out value="${semesterCourse.totalGrades}"></c:out></td>
				<td><a
					href="javascript:document.getElementById('detail${semesterCourse.year}${semesterCourse.semester}').submit()">링크</a></td>
				<form id="detail${semesterCourse.year}${semesterCourse.semester}"
					action="${pageContext.request.contextPath }/details" method="POST">
					<input type="hidden" name="year" value="${semesterCourse.year}" />
					<input type="hidden" name="semester"
						value="${semesterCourse.semester}" /> <input type="hidden"
						name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			</tr>
		</c:forEach>
	</table>	
	
	<div id="lecture"><p>
		<a href="${pageContext.request.contextPath }/">
			<button>뒤로 가기</button>
		</a></p>
	</div>
</body>
</html>