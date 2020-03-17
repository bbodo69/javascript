<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%

	
	// 로그인 상태 확인
	// 세션이 없다면 : 로그인 안했다.
	if(session.getAttribute("sId") == null){  
		// 쿠키 있는지 2중 체크 
		String id = null, pw = null, auto = null;	// 변수만들기
		Cookie[] cs = request.getCookies();			// 쿠키 다 꺼내기		
		if(cs != null){								// 쿠기가 있다면
			for(Cookie coo : cs){					// 쿠키들 반복해서 coo에 담고
				// 있으면 변수에 값 담기
				if(coo.getName().equals("cId")) id = coo.getValue(); 
				if(coo.getName().equals("cPw")) pw = coo.getValue();
				if(coo.getName().equals("cCh")) auto = coo.getValue();
			}
			session.setAttribute("sId", id);
		}
		// 세션은 없지만, 쿠키가 있어서 id,pw,auto 변수에 값을 담았다면, 바로 loginPro로 넘어가기.
		// loginPro로 넘어가면 ===>
		if(auto != null && id != null && pw != null){
			response.sendRedirect("loginPro.jsp");
		}
	%>

<body>
	<br />
	<h1 align="center"> HOTDOG </h1>
		<hr {width:500px;}> <br />
		
		<a href=""> 펫시터구인</a><a href=""> 정보나눔 </a></h2></nav> <a href=""> 중고나라 </a> <a href="">
		 자유게시판 </a>
	<table align="right">
		<tr>
			<td> 로그인 원하시면 버튼을 누르세요 <br />
				<button onclick="window.location.href='loginForm.jsp'" >로그인</button>
			</td>
		</tr>
		<tr>
			<td>
				<a href="signupForm.jsp" > 회원가입 </a>
			</td>
		</tr>
	</table>

	<br /><br /><br /><br />
	<div align="center">
		<img src="pet.jpg" width="700" />
	</div>
</body>
	
<%	}else{  // 로그인 된 상태 %>

<body>
	<br />
	<h1 align="center"> HOTDOG </h1>
		<hr {width:500px;}> <br />
		
		<a href=""> 펫시터구인</a><a href=""> 정보나눔 </a></h2></nav> <a href=""> 중고나라 </a> <a href="">
		 자유게시판 </a>
	<table align="right">
		<tr>
			<td> 로그인 원하시면 버튼을 누르세요 <br />
				<%=session.getAttribute("sId") %> 님 환영합니다. <br>
				<button onclick="window.location.href='logout.jsp'" >로그아웃</button>
				<button onclick="window.location.href='modify.jsp'" >회원정보 변경</button>
			</td>
			
		</tr>	
	</table>

	<br /><br /><br /><br />
	<div align="center">
		<img src="pet.jpg" width="700" />
	</div>
</body>

<%}
%>
</html>