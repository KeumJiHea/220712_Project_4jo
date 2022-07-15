<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<div id="boarddiv" align="center">
 <jsp:useBean id="dao" class="board.BoardDAO" />
	<c:set var="totalpage" value="${dao.getTotalPage() }" />
	<c:set var="pc" value="${dao.pagingNum(param.start) }" />
	<c:set var="list" value="${dao.list(pc.startPage,pc.endPage) }" />
<table id="boardtbl" border="1">
<tr>
<th>번호</th> <th>이름 </th> <th>제목 </th> <th>날짜 </th> <th> 조회수</th>
<!--  <th>group </th> <th>step </th> <th> indent</th> -->
</tr>
<c:choose>
<c:when test="${list.size()==0 }">
<tr><td colspan="5">데이터없음</td></tr>
</c:when>

<c:otherwise>
<c:forEach var="dto" items="${list }">    <!-- 버그수정 -->
<tr>

<td>${dto.id }</td>
 <td>${dto.name } </td>

 <td id="titletd">
 <c:choose>
 		<c:when test="${dto.indent }>0">　</c:when>
 	<c:otherwise>
		 <c:forEach begin="1" end="${dto.indent }"><a href="content.jsp?id=${dto.id }">↳</a> </c:forEach><a href="content.jsp?id=${dto.id }"> ${dto.title }</a>
 	</c:otherwise>	
 </c:choose>
 </td> 

<td><fmt:formatDate pattern = "yy/MM/dd HH:mm:ss" value="${dto.savedate}"/> </td>  
<td>${dto.hit } </td>
</tr>
</c:forEach>
</c:otherwise>
</c:choose>
</table>

<%if(session.getAttribute("id")==null){ %>
	<button id="listbt" disabled>글쓰기</button>
<%}else{ %>
<button id="listbt"type="button" onclick="location.href='write.jsp'">글쓰기</button>
<%} %>
<c:choose>
	<c:when test="${param.start == null }">
		<c:set var="s" value="1"/>
	</c:when>
	<c:otherwise>
		<c:set var="s" value="${param.start}"/>
	</c:otherwise>
</c:choose>

<!-- 이전 -->
<input type="button" onclick="location.href='list.jsp?start=1'" value="처음">
<c:choose>
	<c:when test="${s > 1 }">
		<button type="button" 
		onclick="location.href='list.jsp?start=${s-1}'">이전</button>
	</c:when>
	<c:otherwise>
		<button disabled>이전</button>
	</c:otherwise>
</c:choose>

<c:forEach var="cnt" begin="1" end="${pc.totEndPage }" step="1">
		<a href="list.jsp?start=${cnt }">	
			${cnt}  
		</a>
	</c:forEach>
	

<c:choose>
<c:when test="${s<pc.totEndPage }">
	<button type="button" onclick="location.href='list.jsp?start=${s+1}'">다음</button>
</c:when>
<c:otherwise>
	<button disabled>다음</button>
</c:otherwise>
</c:choose>
</div>
</span>
</div>
</section>
<div align="center">
<%@include file="/member/footer.jsp" %>
</div>
</body>
</html>