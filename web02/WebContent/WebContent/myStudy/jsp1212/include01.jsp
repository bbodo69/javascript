<%@page import="com.sun.org.apache.bcel.internal.classfile.Attribute"%>
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
	String str = "한글이다";
	request.setAttribute("name", str);
%>

	<table>
		<tr>
			<td>
			 	<jsp:forward page="top.jsp"></jsp:forward>
			</td>
		</tr>
		<tr>
			<td>
				<jsp:forward page="content.jsp">
			</td>
		</tr>
		<tr>
			<td>
				<jsp:forward page="/myStudy/bottom.jsp">
			</td>
		</tr>
	</table>
	
</body>
</html>