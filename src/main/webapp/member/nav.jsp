<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function printClock() {
    
    var clock = document.getElementById("clock");            // 출력할 장소 선택
    var currentDate = new Date();                                     // 현재시간
    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
    var amPm = 'AM'; // 초기값 AM
    var currentHours = addZeros(currentDate.getHours(),2); 
    var currentMinute = addZeros(currentDate.getMinutes() ,2);
    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
    
    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
    	amPm = 'PM';
    	currentHours = addZeros(currentHours - 12,2);
    }

    if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
    }
    clock.innerHTML ="<span style='font-size:10pt;'>"+ amPm+"</span>"+ currentHours+":"+currentMinute+":"+currentSeconds; //날짜를 출력해 줌
    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { // 자릿수 맞춰주기
	  var zero = '';
	  num = num.toString();
	  if (num.length < digit) {
	    for (i = 0; i < digit - num.length; i++) {
	      zero += '0';
	    }
	  }
	  return zero + num;
}
</script>
</head>
<body>	
		<nav class="nav">
			<ul id="ul1">
				<li><a href="/220712_Project_4jo/index.jsp">Home <span class="aspan">홈으로가기</span></a></li>
				<li><a href="/220712_Project_4jo/member/register.jsp">Join <span class="aspan">회원가입</span></a></li>				
				<li><a href="/220712_Project_4jo/board/list.jsp">Board <span class="aspan">게시판</span></a></li>							
			</ul>
			<ul id="ul2">
			
				<%if(session.getAttribute("id")==null){ %>
				<li id="loginli">
					<form action="/220712_Project_4jo/member/loginChk.jsp">
						<table>
							<tr>
								<td>ID</td>
								<td>
									<input type="text" name="id">
								</td>
								<td rowspan="2">
									<button>로그인</button>
								</td>
							<tr>
								<td>PW</td>
								<td>
									<input type="password" name="pwd">
								</td>
							</tr>							
						</table>
					</form>
				</li>
				
				
				<%}else{ %>
				<li><div id="username"><span id="spn"><%= session.getAttribute("id") %>님</span><br> 환영합니다</div>
						<div id="navbtn2">
						<button type="button" onclick="location.href='/220712_Project_4jo/member/myInfo.jsp'">MY Info</button>
						<button type="button" onclick="location.href='/220712_Project_4jo/member/logout.jsp'">LogOut</button></div></li>
			<%} %>
				<li id="clockli"><div class="clockdiv" id="clock"></div></li>
						
						
			</ul>
			</nav>
</body>
</html>