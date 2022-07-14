<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>write.jsp<br>

<form action="write_save.jsp" method="post">

<table border="1">

<tr>
	<th> 이름</th>
	<td>
	<input type="text" name="name" placeholder="name"> 
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
<input type="submit" value="저장">
<a href="list.jsp">목록이동</a>
</td>
</tr>


</table>
</form>
</body>
</html>