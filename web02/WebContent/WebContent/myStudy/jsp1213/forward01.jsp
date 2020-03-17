<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<h1>page 1</h1>
	<%System.out.println("1page"); %>
	<jsp:forward page="forward02.jsp"></jsp:forward>

</body>
</html>