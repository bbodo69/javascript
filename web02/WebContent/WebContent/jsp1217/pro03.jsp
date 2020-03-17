<%@page import="web.jsp1217.model.TestDAO03"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% request.setCharacterEncoding("UTF-8"); %>
	
<%	
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	

	TestDAO03 dao = new TestDAO03();
		dao.insertMember(id, pw);	
%>	
	


</body>
</html>