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
</head>
<body>
 <jsp:useBean id="dao" class="board.BoardDAO" />
	<c:set var="totalpage" value="${dao.getTotalPage() }" />
	<c:set var="pc" value="${dao.pagingNum(param.start) }" />
	<c:set var="list" value="${dao.list(pc.startPage,pc.endPage) }" />
<table border="1">
<tr>
<th>번호</th> <th>이름 </th> <th>제목 </th> <th>날짜 </th> <th> 조회수</th>
<!--  <th>group </th> <th>step </th> <th> indent</th> -->
</tr>
<c:choose>
<c:when test="${list.size()==0 }">
<tr><td colspan="5">데이터없음</td></tr>
</c:when>

<c:otherwise>
<c:forEach var="dto" items="${list }">
<tr>

<td>${dto.id }</td>
 <td>${dto.name } </td>

 <td>
 <c:forEach begin="1" end="${dto.indent }">↳ </c:forEach>
<a href="content.jsp?id=${dto.id }"> ${dto.title }</a>
 </td> 

<td>${dto.savedate } </td> 
<td>${dto.hit } </td>
<!-- 
<td>${dto.idgroup } </td> 
<td>${dto.step} </td>
 <td>${dto.indent } </td>  -->
</tr>
</c:forEach>
</c:otherwise>
</c:choose>


<tr>
<td colspan="8">

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
			[${cnt}]  
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
<!--|${s} / ${pc.totEndPage }|  -->
<a href="write.jsp">글쓰기</a> </td>
</tr>
</table>


</body>
</html>