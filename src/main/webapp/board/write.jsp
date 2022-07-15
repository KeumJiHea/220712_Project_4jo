<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form action="write_save.jsp" method="post">
<div id="writediv"align="center">
<table id="writetbl" border="1">

<tr>
	<th> 이름</th>
	<td>
	<input type="text" name="name" value="<%= session.getAttribute("id")%>"> 
	</td>
</tr>

<tr>
	<th> 제목</th>
	<td>
	<input type="text" name="title" placeholder="title"> 
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
	<textarea name="content"></textarea>
	</td>
</tr>

<tr>
<td colspan="2">
<button type="submit">저장</button>
<button type="button" onclick="location.href='list.jsp'">목록이동</button>
</td>
</tr>


</table>
</div>
</form>
</section>
<%@include file="/member/footer.jsp" %>
</body>
</html>