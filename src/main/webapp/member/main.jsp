<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>메인 페이지</h1>
	${sessionScope.name }님 환영합니다.
	<input type="button" value="로그아웃" onclick = "location.href='logout.jsp'">
	<input type="button" value="나의 정보" onclick = "location.href='myInfo.jsp'">
</body>
</html>