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
	Cookie c = new Cookie("id", "java");
	c.setMaxAge(15);
	response.addCookie(c);
	Cookie c1 = new Cookie("name", URLEncoder.encode("알자"));
	response.addCookie(c);
%>

</body>
</html>