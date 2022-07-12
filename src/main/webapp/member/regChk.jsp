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
	<jsp:setProperty property="*" name="dto"/>
	
	<c:choose>
		<c:when test="${dao.register(dto)==1 }">
			<script type="text/javascript">
				alert('가입이 완료되었습니다.')
				location.href="main.jsp"
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert('가입에 실패했습니다.')
				histoty.go(-1);
			</script>
		</c:otherwise>
	</c:choose> 
	
</body>
</html>