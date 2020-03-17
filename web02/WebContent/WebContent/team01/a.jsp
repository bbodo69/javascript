<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%


System.out.println(application.getAttribute("a1"));
System.out.println(request.getParameter("a1"+"2222"));


%>
</head>
<form action="b.jsp">
<body>
	<%
	System.out.println("123123");
	%>
	<textarea name="a" ></textarea>
	<input type="button" onclick="window.location.href='b.jsp?id1=value1&id2=value2'">
	<input type="submit">
	<input type = "hidden" value="value1" name = "id1">
	<input type = "hidden" value="value2" name = "id2">
	<textarea name="a1"></textarea>
	<input type="button" onclick="window.location.href='a.jsp'">
	
</body>
</form>
</html>