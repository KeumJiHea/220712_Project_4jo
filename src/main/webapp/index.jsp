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
</head>
<body onload="printClock()">

<%@include file="/member/header.jsp" %>
<%@include file="/member/nav.jsp" %><br>
	<section>
		<h1>Main Page</h1>	
		<div id="img">
		<img src="/220712_Project_4jo/images/rabbit.jpg" title="KJH">
		<img src="/220712_Project_4jo/images/shinzzang.jpg" title="KYH">
		<img src="/220712_Project_4jo/images/fox.jpg" title="BEH">
		</div>		
	</section>
<%@include file="/member/footer.jsp" %>		
</body>
</html>