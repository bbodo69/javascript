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
	
	String id = (String)session.getAttribute("sId");
	String roomPw = request.getParameter("roomPw");
	String subject = request.getParameter("subject");
	String latitude = request.getParameter("latitude");
	String longitude = request.getParameter("longitude");

	
	yrDAO dao = new yrDAO();
	dao.createRoom(id, roomPw, subject, latitude, longitude);
	response.sendRedirect("room.jsp");
	
	
%>
<body>

</body>
</html>