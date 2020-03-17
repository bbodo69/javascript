<%@page import="com.sun.jmx.snmp.Timestamp"%>
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
	Cookie [] cookies1 = request.getCookies();
	for(Cookie c :cookies1){
		out.println(c.getName()+" = " + c.getValue() + "<br />");	
	}
%>	 



</body>
</html>