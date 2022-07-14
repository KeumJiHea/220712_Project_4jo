<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../BasicCSS/BasicCSS.css" rel="stylesheet">
</head>
<body>
<%@include file="/member/header.jsp" %>
	<%@include file="/member/nav.jsp" %>
	<section>
	<div id="replydiv" align="center">
<jsp:useBean id="dao" class="board.BoardDAO" />
<c:set var="dto" value="${dao.getContent(param.id) }" />

<form action="reply_save.jsp" method="post">
<input type="hidden" name="id" value="${dto.id }">
<input type="hidden" name="idgroup" value="${dto.idgroup }">
<input type="hidden" name="step" value="${dto.step }">
<input type="hidden" name="indent" value="${dto.indent }">
<input type="hidden" name="name" value="<%=session.getAttribute("id") %>">

<table id="replytbl" border="1">
<tr>
<td>번호</td><td>${dto.id }</td>
</tr>

<tr>
<td>조회수</td><td>${dto.hit }</td>
</tr>

<tr>
<td>이름</td><td><%=session.getAttribute("id") %></td>
</tr>

<tr>
<td>제목</td><td><input name="title" value=${dto.title }></td>
</tr>

<tr>
<td>내용</td><td><textarea name="content"></textarea></td>
</tr>

<tr>
<td colspan="2">
<button>답변</button>
<button type="button" onclick="location.href='list.jsp'">목록</button>
</td>
</tr>

</table>
</form>
</div>
</section>
<div align="center">
<%@include file="/member/footer.jsp" %>
</div>
</body>
</html>