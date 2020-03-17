<%@page import="java.net.URLEncoder"%>
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
	// 쿠키 객체 생성		쿠키 이름, 쿠키값
	Cookie c = new Cookie("id","java");
	// 쿠키 유효기간 설정 : 초단위
	c.setMaxAge(60);	// 60초 
	//클라이언트에게 쿠키 전달 response에 쿠키 추가하기
	response.addCookie(c);
	Cookie c1 = new Cookie("name", URLEncoder.encode("알자"));
	response.addCookie(c);
	
	
	
%>


</body>
</html>