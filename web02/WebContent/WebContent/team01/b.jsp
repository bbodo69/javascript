<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%

	System.out.println(request.getParameter("id1"));
	System.out.println(request.getParameter("id2"));
%>
</head>
<body>
<% response.sendRedirect("a.jsp"); %>	
</body>
</html>