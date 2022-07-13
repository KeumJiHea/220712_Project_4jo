<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>reply<br>
<jsp:useBean id="dao" class="board.BoardDAO" />
<c:set var="dto" value="${dao.getContent(param.id) }" />

<form action="reply_save.jsp" method="post">
<input type="hidden" name="id" value="${dto.id }">
<input type="hidden" name="idgroup" value="${dto.idgroup }">
<input type="hidden" name="step" value="${dto.step }">
<input type="hidden" name="indent" value="${dto.indent }">
<input type="hidden" name="name" value="${dto.name }">

<table border="1">
<tr>
<td>번호</td><td>${dto.id }</td>
</tr>

<tr>
<td>조회수</td><td>${dto.hit }</td>
</tr>

<tr>
<td>이름</td><td>${dto.name }</td>
</tr>

<tr>
<td>제목</td><td><input name="title" value=${dto.title }></td>
</tr>

<tr>
<td>내용</td><td><textarea name="content"></textarea></td>
</tr>

<tr>
<td colspan="2">
<input type="submit" value="답변">
<a href="list.jsp">목록</a>
</td>
</tr>

</table>
</form>

</body>
</html>