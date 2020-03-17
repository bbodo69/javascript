<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String pw = (String)request.getParameter("pw");
	System.out.println(pw);
%>
<form action = "test6.jsp" method="get">
<body>
	<input type="password" name="pw">
	<input type="submit" value="제출">
</body>
</form>
</html>