<%@page import="web.jsp1218.model.TestDAO01"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dto" class="web.jsp1218.model.TestDTO"></jsp:useBean>		
	<jsp:setProperty property="*" name="dto"/>									
	id : <jsp:getProperty property="id" name="dto"/> <br />						
	pw : <jsp:getProperty property="pw" name="dto"/>							
	
<%	TestDAO01 dao = new TestDAO01();
	
	dao.insertMember(dto);
%>

</body>
</html>