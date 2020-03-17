<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	int a = 10;
	new Date();
	Date date = new Date();
	int b = date.getDay();
	int c = date.getHours();
	
%>

<body>
	<h1> page 2 정보</h1>
	<%= a %> <br />
	<%= b %> <br />
	<%= c %>
	
</body>
</html>