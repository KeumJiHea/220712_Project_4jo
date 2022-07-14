<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
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
<body>
<%@include file="/member/header.jsp" %>
<%@include file="/member/nav.jsp" %>
<section>
	 <jsp:useBean id="dao" class="board.BoardDAO" />
	<div id="boarddiv" align="center">
	<table id="bodtbl" border="1">
	<tr>
	<th>번호</th> <th>이름 </th> <th>제목 </th> <th>날짜 </th> <th> 조회수</th>
	<!--  <th>group </th> <th>step </th> <th> indent</th> -->
	</tr>
	
	<c:forEach var="dto" items="${dao.list()}">
	
	<tr>
	<td>${dto.id }</td>
	 <td>${dto.name } </td>
	
	 <td>	 
	 <c:forEach begin="1" end="${dto.indent }">↳</c:forEach>
	<a href="content.jsp?id=${dto.id }">
	 ${dto.title }</a>
	 </td> 
	
	<td>${dto.savedate } </td> 
	<td>${dto.hit } </td>
	<!-- 
	<td>${dto.idgroup } </td> 
	<td>${dto.step} </td>
	 <td>${dto.indent } </td>  -->
	</tr>
	</c:forEach>
	<tr>
	<td id="writebtd" colspan="8"><button  type="button" onclick="location.href='write.jsp'">글쓰기</button></td>
	</tr>
	</table>
	</div>
</section>
<div align="center">
<%@include file="/member/footer.jsp" %>
</div>
</body>
</html>