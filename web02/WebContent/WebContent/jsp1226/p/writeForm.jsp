<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="writePro.jsp" method="post">
<% int num = 0; %>
<input type="hidden" name="num" value="<%=num %>">
<input type="text" name="writer"> 
<input type="submit" value="제출">
</form>
</body>
</html>