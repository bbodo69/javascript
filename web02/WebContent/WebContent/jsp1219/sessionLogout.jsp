<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 로그아웃 ----> 세션 삭제
	// #1. 해당 세션 삭제
	session.removeAttribute("sid");
	// #2. 세션 모두 삭제
	session.invalidate();
	
	// 로그인폼으로 단순이동
	response.sendRedirect("session01.jsp");





%>
</body>
</html>