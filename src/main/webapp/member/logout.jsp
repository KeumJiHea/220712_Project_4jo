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

	<script type="text/javascript">
	<%session.invalidate(); 	
	%>
		alert('로그아웃 되었습니다.')
		location.href = '/220712_Project_4jo/index.jsp'
	</script>
	
</body>
</html>