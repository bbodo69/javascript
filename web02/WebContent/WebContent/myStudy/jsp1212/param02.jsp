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
	String value1 = request.getParameter("value1");	
	String value2 = request.getParameter("value2");
%>
	<h1>value1 : <%= value1 %></h1>
	<h2>value2 : <%= value2 %></h2>

</body>
</html>