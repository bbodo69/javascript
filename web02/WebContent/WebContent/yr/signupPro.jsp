<%@page import="yr.yrDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	System.out.println(id+"   //   "+pw);

	yrDAO dao = new yrDAO();
	dao.signupMember(id, pw);
	response.sendRedirect("main.jsp");
%>
<body>

</body>
</html>