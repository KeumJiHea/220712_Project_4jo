<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="dao" class="member.MemberDAO"/>
	<jsp:useBean id="dto" class="member.MemberDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	
	<c:set var="result" value="${dao.modify(dto) }"/>
	<c:choose>
		<c:when test="${result==1 }">
			<script type="text/javascript">
				alert('수정이 완료되었습니다.')
				location.href='myInfo.jsp'
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert('수정에 실패했습니다.')
				histoty.go(-1)
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>