<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:useBean id="dao" class="member.MemberDAO"/>
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
		var form = document.joinform;
		
		if(form.id.value=="" || form.id.value=="null"){
			alert('아이디를 입력하세요.')
			form.id.focus();
			return false
		}
		if(form.pwd.value=="" || form.pwd.value=="null"){
			alert('비밀번호를 입력하세요.')
			form.pwd.focus();
			return false
		}
		if(form.pwdchk.value=="" || form.pwdchk.value=="null"){
			alert('비밀번호 확인을 완료하세요.')
			form.pwdchk.focus();
			return false
		}
		if(form.name.value=="" || form.name.value=="null"){
			alert('이름을 입력하세요.')
			form.name.focus();
			return false
		}
	}
</script>

</head>
<body>
	
	<h3>회원가입</h3>
	
	<form name="joinform" action="regChk.jsp" method="post" onsubmit="return nullchk()">
		* 표시가 있는 항목은 필수 항목입니다.<br>
		*아이디 <input name="id" id="id"><br>
		*비밀번호 <input type="password" name="pwd" id="pwd"><br>
		*비밀번호 확인<input type="password" name="pwdchk" id="pwdchk" onchange="pwdChk()"><span id="pwdchkspan"></span><br>
		*이름 <input name="name" id="name"><br>
		주소 <input name="addr" id="addr"><br>
		전화번호 <input name="tel" id="tel" placeholder="ex) 01012345678"><br>
		<input type="submit" value="가입">
		<input type="reset" value="취소">
	</form>
</body>
</html>