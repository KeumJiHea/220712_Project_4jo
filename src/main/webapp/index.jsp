<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="BasicCSS/BasicCSS.css" rel="stylesheet">
<script src="weather.js"></script>
</head>
<body onload="printClock()">

<%@include file="/member/header.jsp" %>
<%@include file="/member/nav.jsp" %><br>
	<section>
		<h1>메인페이지 입니다</h1>	
	</section>
<%@include file="/member/footer.jsp" %>
</body>
</html>