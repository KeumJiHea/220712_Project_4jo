<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="loginChk.jsp" method="post">
	<input name="id"><br>
	<input type="password" name="pwd"><br>
	<input type="submit" value="로그인">
</form>
	<input type="button" onclick="location.href='register.jsp'" value="회원가입">

</body>
</html>