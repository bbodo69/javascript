<%@page import="web.jsp1218.model.DAO01"%>
<%@page import="web.jsp1218.model.DTO01"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");
	String date = request.getParameter("date");	

	//오늘 날짜 출력. 날짜 형식 지정
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date time = new Date();
	String time1 = format.format(time);		
%>

<jsp:useBean id="dto" class="web.jsp1218.model.DTO01"></jsp:useBean>
<jsp:setProperty property="*" name="DTO01"/>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%	 DAO01 dao = new DAO01();
	 dao.insertMember(dto);
%>
	
	<h3.<jsp:getProperty name="
	
	

</body>
</html>