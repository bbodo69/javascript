<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="web.jsp0102.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getRealPath("save");
	int max = 1024 * 1024 * 5 ;
	String enc = "UTF-8";
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request, path, max,enc, dp);	
	
	SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");	
		


	String writer = session.getAttribute("id");
	String subject = mr.getParameter("subject");
	String content = mr.getParameter("content");
	String pw = mr.getParameter("pw");
	String reg = format.format(System.currentTimeMillis());
	String ip = request.getRemoteAddr();
	int ref = 0;

	
	
	BoardDAO dao = new BoardDAO();
	dao.insertContent;

%>
<body>
	

</body>
</html>