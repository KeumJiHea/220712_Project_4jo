<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/220712_Project_4jo/BasicCSS/BasicCSS.css" rel="stylesheet">
</head>
<body onload="printClock()">
<%@include file="/member/header.jsp" %>
<%@include file="/member/nav.jsp" %><br>
<section>
	<jsp:useBean id="dao" class="member.MemberDAO"/>
	<jsp:useBean id="dto" class="member.MemberDTO"/>
	<h3>모든 회원 정보</h3>
	
	<c:set var="list" value="${dao.getAll() }"/>
	<c:forEach var="dto" items="${list }">
	<div align="center">
	<table border="1">
		<tr>
			<td>아이디</td><td>${dto.id }</td>
		</tr>
		<tr>
			<td>비밀번호</td><td>${dto.pwd }</td>
		</tr>
		<tr>
			<td>이름</td><td>${dto.name }</td>
		</tr>
		<tr>
			<td>주소</td><td>${dto.addr }</td>
		</tr>
		<tr>
			<td>전화번호</td><td>${dto.tel }</td>
		</tr>
	</table>
	<br>
	</div>
	</c:forEach>
</section>
<%@include file="/member/footer.jsp" %>	
</body>
</html>