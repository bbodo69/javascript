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
		String value = "forwarding value";
	%>


	<jsp:forward page="param02.jsp">
		<jsp:param value="<%=value %>" name="value1"/>
		<jsp:param value="22222" name="value2"/>
	</jsp:forward>
</body>
</html>