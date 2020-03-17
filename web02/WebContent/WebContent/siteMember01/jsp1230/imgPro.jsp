<%@page import="java.util.List"%>
<%@page import="web.jsp1230.model.uploadDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Image viewer</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");

	String writer = request.getParameter("writer");

	// DB에서 writer와 동일한 작성자의 img 파일명 가져와 화면에 이미지 띄우기
	uploadDAO dao = new uploadDAO();
	List imgList = dao.getImg(writer);
	
%>
<body>
	<h1> img viewer </h1>
	<% for(int i = 0 ; i < imgList.size() ; i++){ %>
	<img src = "/web/save/<%=imgList.get(i) %>" />
	<%} %>
</body>
</html>