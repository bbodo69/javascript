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
		String str = (String)request.getAttribute("name"); 
	%>      
	<h1><a href="#">헤드 </a></h1>
 	<%=str %>      
	<h1><a href="#">메뉴 </a></h1>
	
	

</body>
</html>