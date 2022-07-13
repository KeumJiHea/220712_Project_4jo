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
				<li><a href="/220712_Project_4jo/index.jsp">Home</a></li>
				<li><a href="/220712_Project_4jo/member/register.jsp">Join</a></li>				
				<li><a href="#">Board</a></li>				
			</ul>
		</nav>
			<nav id="infonav">
			<%if(session.getAttribute("id")==null){ %>
			<div id="headerid">
			<form action="member/loginChk.jsp" method="post">
				ID <input type="text" name="id">
				PW <input type="password" name="pwd">
				<input id="lgbtn" type="submit" value="LogIn">
			</form>
			</div>
			<%}else{ %>
			<div id="sminfo" align="left"><%= session.getAttribute("id") %>님 환영합니다</div>
				<span class="wrap">
					<span id="infospan">		
  						<a href="#" class="button2">MY Info</a>
  						<a href="#" class="button2">LogOut</a>
					</span>
				</span>										
			</nav>
		</div>
		<%} %>
</div>	
</body>
</html>