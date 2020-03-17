<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String str = "안녕하세요";
	int num = 100;
	request.setAttribute("str", str);
	request.setAttribute("num", num);

%>
<body>
	
	<h1>2 page</h1>
	<% System.out.println("2page"); %>
	<jsp:include page="forward03.jsp">
		<jsp:param value="adventure" name="type"/> 		
		<jsp:param value="15 year" name="grade"/>		
		<jsp:param value="5000000" name="sale"/>
	</jsp:include>
	<br />
	<%=str %><br/>
	<%=num %>
	
	
</body>
</html>