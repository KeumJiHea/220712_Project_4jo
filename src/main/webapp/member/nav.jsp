<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/BasicCSS/BasicCSS.css" rel="stylesheet">
</head>
<body>
	<nav id="remotenav">
		<ul>
			<li>접속중인 회원</li>
			<li><hr></li>
			<%if(session.getAttribute("id")==null){ %>
			<li>로그인을</li>
			<li>해주세요</li>
			<%}else{ %>
			<%= session.getAttribute("id") %>님
			<%} %>
		</ul>
	</nav>
</body>
</html>