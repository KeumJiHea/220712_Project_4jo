<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="BasicCSS/BasicCSS.css" rel="stylesheet">
</head>
<body>
<div class="header" align="center">
	<header>Web Page 입니다</header>
	<div id="navdiv" align="center">
		<nav id="nav">
			<ul>
				<li><a href="/220712_Project_4jo/index.jsp">Home <span class="aspan">홈으로가기</span></a></li>
				<li><a href="/220712_Project_4jo/member/register.jsp">Join <span class="aspan">회원가입</span></a></li>				
				<li><a href="/220712_Project_4jo/board/list.jsp">Board <span class="aspan">게시판</span></a></li>				
			</ul>
		</nav>
			<nav id="infonav">
			<%if(session.getAttribute("id")==null){ %>
			<div id="headerid">
			<form action="member/loginChk.jsp" method="post">
				<table>
				<tr>
					<td >ID<input id="logid" type="text" name="id"></td>
					<td rowspan="2"><input id="lgbtn" type="submit" value="LogIn"></td>
				</tr>
				<tr>
					<td>PW<input id="logpw" type="password" name="pwd"></td>					
				</tr>
				
				</table>
			</form>
			</div>
			<%}else{ %>
			<div id="sminfo" align="left"><span id="spn"><%= session.getAttribute("id") %>님</span><br> 환영합니다
				<span id="btspan">										
					<a href="#" class="button2">MY Info</a>
					<a href="/220712_Project_4jo/member/logout.jsp" class="button2">LogOut</a>	
				</span>
			</div>													
			</nav>
		</div>
		<%} %>
</div>	
</body>
</html>