<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/resources/css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강 신청</title>
</head>
<body>
<c:if test="${applylecture != null}">
	<script>alert("수강신청이 완료되었습니다.")</script>
</c:if> 
	<sf:form method="post"
		action="${pageContext.request.contextPath}/courseapplied"
		modelAttribute="course">
		<table class="formtable">
			<tr>
				<th class="label">교과코드</td>
				<td><sf:input class="control" type="text" path="course_id" /> <br />
					<sf:errors path="course_id" class="error"></sf:errors></td>
			</tr>
			<tr>
				<th class="label">교과목 명</td>
				<td><sf:input class="control" type="text" path="name" /> <br />
					<sf:errors path="name" class="error"></sf:errors></td>
			</tr>
			<tr>
				<th class="label">구분</td>
				<td><sf:input class="control" type="text" path="division" /> <br />
					<sf:errors path="division" class="error"></sf:errors></td>
			</tr>
			<tr>
				<th class="label">학점</td>
				<td><sf:input class="control" type="text" path="grades" /> <br />
					<sf:errors path="grades" class="error"></sf:errors></td>
			</tr>
			<tr>
				<td colspan="2"><input class="control" type="submit" value="수강신청" /></td>
			</tr>
		</table>

	</sf:form>
	<div id="lecture"><p>
		<a href="${pageContext.request.contextPath }/">
			<button>뒤로가기</button>
		</a></p>
	</div>

</body>
</html>