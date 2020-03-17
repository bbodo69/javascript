<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	Cookie [] cs = request.getCookies();
	System.out.println(cs);

	for(Cookie coo : cs){
		System.out.println(coo.getName());
	}
	
%>
<body>

</body>
</html>