<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<style>
	body{
		width: 900px;
		margin: 0 auto;
	}
	#headerDiv{
		text-align: right;
		width: 870px;
	}
	.HeaderMenu{
		display: inline-block; background-color: #AAB9BD; width: 140px; height: 40px; margin: 17px;
        padding-top: 4px; text-align: center; font-size: 17px;
	}
	.headerB{
		HEIGHT: 20px; font-size: 12px;
	}
	#mainA:visited{ color:#77878F; }
	.HeaderMenu:focus{ background-color:black; }
</style>
</head>
<%
	//세션 쿠키 검사 완료.
	String sId = (String)session.getAttribute("sId");
	String cId = null;
	System.out.println(sId);
	Cookie[] coo = request.getCookies();
	if(coo != null){
		for(int i = 0; i < coo.length; i++){
			if(coo[i].getName().equals("cId")) cId = coo[i].getValue();
		}
	}
	if(sId == null && cId != null) response.sendRedirect("loginPro.jsp");

%>
<body>
<div id="headerDiv" >
	<% if(sId == null && cId == null){//로그인상태X -> 로그인/회원가입 버튼생성%>
		<button class="headerB" onclick="window.location.href='loginForm.jsp'">로그인</button>
		<button class="headerB" onclick="window.location.href='signupForm.jsp'">회원가입</button>
	<% }else{ //로그인상태 -> 마이페이지/로그아웃 버튼생성%>
		<button class="headerB" onclick="window.location.href='mypage.jsp'">마이페이지</button>
		<button class="headerB" onclick="window.location.href='logout.jsp'">로그아웃</button>
	<% } %>
</div>
<br/>
<h1><a id="mainA" href="main.jsp">Hog Dog</a></h1>
<br/>
<br/>
	<a href="getpetList.jsp"><div class="HeaderMenu" >펫시터 구하기</div></a> 
	<a href="#"><div class="HeaderMenu" >애견 용품 거래</div></a> 
	<a href="#"><div class="HeaderMenu" >자유게시판</div></a> 
	<a href="commentList.jsp"><div class="HeaderMenu" >펫시터 이용 후기</div></a> 
	<a href="qnaForm.jsp"><div class="HeaderMenu" >QnA</div></a> 

	<br/>
	<br/>
</body>
</html>