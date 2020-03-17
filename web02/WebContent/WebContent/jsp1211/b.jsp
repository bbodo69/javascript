<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>B page</title>
</head>
<body>
<h1>B page 안녕, 반가워.</h1>

	<%
	System.out.println("88888888");
	response.sendRedirect("c.jsp"); // c.jsp 페이지로 강제이동!!
	System.out.println("B sendRedirect");
	%>


</body>
</html>