<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link href="https://fonts.googleapis.com/css?family=Gothic+A1|Nanum+Gothic+Coding|Noto+Sans+KR&display=swap&subset=korean" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap&subset=korean" rel="stylesheet">
<style>
	body{
		width: 1500px; margin: 0 auto; background-color: white; FONT-FAMILY: 맑은 고딕,verdana,tahoma; 
	}
	.mainA { margin:0 auto; color:black; font-size:45px; font-family: 'Gothic A1', sans-serif; 
		height:80px; width:1500px; text-align: left; text-color: black; background-color: white;
		margin-bottom: -50px;
	}
	#headerDiv{
		text-align: right; width: 870px; float : right; board-height: 40px;
	}	
	.headerB{
		text-decoration:underline; text-underline-position: under;
		HEIGHT: 40px; font-size: 20px; COLOR: black; FONT-FAMILY: 맑은 고딕,verdana; background-color: white;
		margin-top:7px; margin-bottom:0px; border-radius: 3px; padding-top: 0px; padding-bottom: 20px;
		
	}
	.HeaderMenu{
		display: inline-block; width: 220px; height: 38px; margin: 10px 10px 30px 59px ; vertical-align: middle;
        text-align: center; font-size: 25px; color : black;
        border-radius: 20px; FONT-FAMILY: 맑은 고딕,verdana,tahoma; font-weight: bolder; 	
    }
    .menudiv{text-align: center; width: 1500px; height: 60px; background-color: #fff3dc;
    	
    }
        
	
	.mainA:link {text-decoration:none;color:black}
	.mainA:hover{text-decoration:none;color:black}
	.mainA:visited{text-decoration:none; color:black}

	.HeaderMenu:focus{ background-color:black; }
</style>
</head>
<%
	//세션 쿠키 검사 완료.
	String sId = (String)session.getAttribute("sId");
	String cId = null;
	Cookie[] coo = request.getCookies();
	if(coo != null){
		for(int i = 0; i < coo.length; i++){
			if(coo[i].getName().equals("cId")) cId = coo[i].getValue();
		}
	}
	if(sId == null && cId != null) response.sendRedirect("loginPro.jsp");

%>
<body>
<div id="headerDiv">
	<% if(sId == null && cId == null){//로그인상태X -> 로그인/회원가입 버튼생성%>
		<button class="headerB" onclick="window.location.href='loginForm.jsp'">로그인</button>
		<button class="headerB" onclick="window.location.href='signupForm.jsp'">회원가입</button>
	<% }else{ //로그인상태 -> 마이페이지/로그아웃 버튼생성
			if(sId != null && sId.equals("admin")){ %>
		<button class="headerB" onclick="window.location.href='adminPage.jsp'">관리자페이지</button>
		<% 	}else{ %>
		<button class="headerB" onclick="window.location.href='mypage.jsp'">마이페이지</button>
		<%	} %>
		<button class="headerB" onclick="window.location.href='logout.jsp'">로그아웃</button>
	<% } %>
</div>
<br/>
<h1 class="mainA"><a class="mainA" href="main.jsp">펫 플레닛</a></h1>
<br/>
<br/><div class="menudiv">
	<a href="getpetList.jsp"><div class="HeaderMenu" >펫시터 예약하기</div></a> 
	<a href="tradeList.jsp"><div class="HeaderMenu" >애견 용품 거래</div></a> 
	<a href="boardList.jsp"><div class="HeaderMenu" >커뮤니티</div></a> 
	<a href="commentList.jsp"><div class="HeaderMenu" >펫시터 이용 후기</div></a> 
	<a href="qnaForm.jsp"><div class="HeaderMenu" >QnA</div></a>
	</div> 
	<br/>
	<br/>
</body>
</html>