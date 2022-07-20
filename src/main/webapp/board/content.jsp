<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../BasicCSS/BasicCSS.css" rel="stylesheet">
</head>
<body onload="printClock()">
<%@include file="/member/header.jsp" %>
<%@include file="/member/nav.jsp" %><br>
<section>
<div id="contendiv" align="center">
<jsp:useBean id="dao" class="board.BoardDAO" />
<c:set var="dto" value="${dao.getContent(param.id) }" />

<form action="modify.jsp" method="post">
<input type="hidden" name="id" value="${dto.id }">

<h1> 게시글 보기 </h1>
<table id="contenttbl" border="1">
<tr>
<td>번호</td><td>${dto.id }</td>
</tr>

<tr>
<td>조회수</td><td>${dto.hit }</td>
</tr>

<tr>
<td>이름</td>
<td><input type="text" name="name" value="${dto.name }"></td>
</tr>

<tr>
<td>제목</td>
<td><input type="text" name="title" value="${dto.title }"></td>
</tr>

<tr>
<td>내용</td>
<td><textarea name="content">${dto.content }</textarea></td>
</tr>

<tr>
<td colspan="2">

<button type="submit">수정</button>
<button type="button" onclick="location.href='list.jsp'">목록보기</button>
<button type="button" onclick="location.href='delete.jsp?id=${dto.id }'">삭제</button>
<button type="button" onclick="location.href='reply.jsp?id=${dto.id }'">답변</button>

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