<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2> session 메인 페이지</h2>

	
	<%
	// 세션 존재 여부 확인
	String id = (String)session.getAttribute("sid");
	String pw = (String)session.getAttribute("spw");
	
	if(id != null){ %>
		<h3><%= id %>님 환영</h3>
		<button onclick="window.location.href='sessionLogout.jsp'">로그아웃</button>
	<%}else{ %>
		
		<h3>로그인 실패</h3>
		<button onclick="window.location.href='session01.jsp'">로그인페이지로 이동</button>
	<%}%>


</body>
</html>