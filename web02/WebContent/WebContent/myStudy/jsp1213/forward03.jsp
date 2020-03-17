<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String type = request.getParameter("type");
	String grade = request.getParameter("grade");
	String benefit = request.getParameter("sale");
%>
<body>
	<h1>3 page</h1>
	<%= type %>
	<%= grade %>
	<%= benefit %>
	
</body>
</html>