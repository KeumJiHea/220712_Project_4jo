<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/220712_Project_4jo/BasicCSS/BasicCSS.css" rel="stylesheet">
<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="dto" class="member.MemberDTO"/>
<script type="text/javascript">
	function pwdChk(){
		var pwd = document.getElementById("pwd").value;
		var pwdchk = document.getElementById("pwdchk").value;
		var text = document.getElementById("pwdchkspan")

		if(pwd==pwdchk){
			text.innerHTML = "비밀번호 일치"
			text.style.color = 'black'
		}else{
			text.innerHTML = "비밀번호가 일치하지 않습니다."
			text.style.color = 'red'
			document.getElementById("pwdchk").value = ""
			document.getElementById("pwdchk").focus();
		}
	}
	
	function nullchk(){
		var form = document.modform;
		
		if(form.pwd.value=="" || form.pwd.value=="null"){
			alert('비밀번호는 비워둘 수 없습니다.')
			form.pwd.focus();
			return false
		}
		if(form.pwdchk.value=="" || form.pwdchk.value=="null"){
			alert('비밀번호 확인을 완료하세요.')
			form.pwdchk.focus();
			return false
		}
		if(form.name.value=="" || form.name.value=="null"){
			alert('이름은 비워둘 수 없습니다.')
			form.name.focus();
			return false
		}
	}
</script>

</head>
<body onload="printClock()">
<%@include file="/member/header.jsp" %>
<%@include file="/member/nav.jsp" %><br>
<section>
	<h1>나의 정보</h1>
	<c:set var="dto" value="${dao.getUser(sessionScope.name) }"/>
	<form name="modform" action="modChk.jsp" method="post" onsubmit="return nullchk()">
		<div align="center">
		<table id="infotbl" border="1">
		<tr>
			<td>아이디</td><td><input name="id" id="id" value="${dto.id }" readonly></td>
		</tr>
		<tr>
			<td>비밀번호</td><td><input type="password" name="pwd" id="pwd" value="${dto.pwd }"></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td><td><input type="password" name="pwdchk" id="pwdchk" onchange="pwdChk()"><span id="pwdchkspan"></span></td>
		</tr>
		<tr>
			<td>이름</td><td><input name="name" id="name" value="${dto.name }"></td>
		</tr>
		<tr>
			<td>주소</td><td> <input name="addr" id="addr" value="${dto.addr }"></td>
		</tr>
		<tr>
			<td>전화번호</td><td><input name="tel" id="tel" value="${dto.tel }" placeholder="ex) 01012345678"></td>
		</tr>
		 <tr>
		 	<th colspan="2"><input type="submit" value="수정">			
			<button type="button" onclick="location.href='/220712_Project_4jo/member/allMember.jsp'">모든 회원보기</button>
			</th>
		 </tr>		
		</table>
		</div>
	</form>
</section>
<%@include file="/member/footer.jsp" %>	
</body>
</html>