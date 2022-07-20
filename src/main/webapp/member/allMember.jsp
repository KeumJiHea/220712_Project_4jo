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
	<jsp:useBean id="dao" class="member.MemberDAO"/>
	<jsp:useBean id="dto" class="member.MemberDTO"/>
	<h3>모든 회원 정보</h3>
	
	<c:set var="list" value="${dao.getAll() }"/>
	<c:forEach var="dto" items="${list }">
		아이디: ${dto.id }<br>
		비밀번호: ${dto.pwd }<br>
		이름: ${dto.name }<br>
		주소: ${dto.addr }<br>
		전화번호: ${dto.tel }<br>
		-----------------------<br>
	</c:forEach>

	
</body>
</html>