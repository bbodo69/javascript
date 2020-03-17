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
	
	yrDAO dao = new yrDAO();
	boolean loginCheck = dao.loginCheck(id, pw);
	if(loginCheck){
		session.setAttribute("sId", id);
		response.sendRedirect("main.jsp");
	}else{
		%><script>alert("잘못된 정보");history.back();</script><%
	}
%>
<body>

</body>
</html>