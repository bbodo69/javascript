<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2> param page </h2>
	<jsp:include page="param02.jsp">
		<jsp:param value="<%= new java.util.Date() %>" name="date"/> 
		
	</jsp:include>
	<%-- 문자열만 보낼수있음 --%>

</body>
</html>