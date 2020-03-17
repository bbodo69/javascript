<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	
	session.invalidate();
 	System.out.println("11111111111111");
	response.sendRedirect("main.jsp");

%>
<body>

</body>
</html>