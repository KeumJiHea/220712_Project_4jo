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
	
	<c:set var="userId" value="${param.id }"/>
	<c:set var="userPwd" value="${param.pwd }"/>
	<c:set var="result" value="${dao.chkUser(userId,userPwd) }"/>
	
	<c:choose>
		<c:when test="${result==1 }">
			<script type="text/javascript">
				alert('로그인 성공')
				location.href="main.jsp"
			</script>
		</c:when>
		<c:when test="${result==0 }">
			<script type="text/javascript">
				alert('존재하지 않는 아이디입니다.')
				location.href="login.jsp"
			</script>
		</c:when>
		<c:when test="${result==-1 }">
			<script type="text/javascript">
				alert('잘못된 비밀번호입니다.')
				location.href="login.jsp"
			</script>
		</c:when>
	</c:choose>
	
</body>
</html>