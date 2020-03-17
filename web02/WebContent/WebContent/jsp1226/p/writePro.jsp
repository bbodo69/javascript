<%@page import="web.jsp1227.board.testDTO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="web.jsp1227.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="insertData" class="web.jsp1227.board.testDTO" />
<jsp:setProperty property="*" name="insertData"/>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String writer = request.getParameter("writer");
	
	testDTO dto = new testDTO();
	
	dto.setWriter(writer);
	dto.setNum(num);

	BoardDAO dao = new BoardDAO();
	dao.insertData(dto);
	
	response.sendRedirect("list.jsp");
%>
 



</body>
</html>