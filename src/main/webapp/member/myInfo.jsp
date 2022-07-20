<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body>
	
	<h3>나의 정보</h3>
	<c:set var="dto" value="${dao.getUser(sessionScope.name) }"/>
	<form name="modform" action="modChk.jsp" method="post" onsubmit="return nullchk()">
		아이디 <input name="id" id="id" value="${dto.id }" readonly><br>
		비밀번호 <input type="password" name="pwd" id="pwd" value="${dto.pwd }"><br>
		비밀번호 확인<input type="password" name="pwdchk" id="pwdchk" onchange="pwdChk()"><span id="pwdchkspan"></span><br>
		이름 <input name="name" id="name" value="${dto.name }"><br>
		주소 <input name="addr" id="addr" value="${dto.addr }"><br>
		전화번호 <input name="tel" id="tel" value="${dto.tel }" placeholder="ex) 01012345678"><br>
		<input type="submit" value="수정">
		<input type="button" value="뒤로가기" onclick="history.go(-1)">
	</form>
</body>
</html>