<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%session.invalidate(); 
		response.sendRedirect("/220712_Project_4jo/index.jsp");
	%>
</body>
</html>