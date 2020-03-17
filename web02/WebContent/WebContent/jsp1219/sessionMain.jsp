<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2> session 메인 페이지</h2>
	세션 ID : <%=session.getId() %> <br />
	<% 
	Date time = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 DD일");
	time.setTime(session.getCreationTime());
	%>
	세션 생성시간 : <%=sdf.format(time) %> <br />
	<% time.setTime(session.getLastAccessedTime()); %> <br />
	최근 접근 시간 : <%=sdf.format(time) %> <br />
	
	<%
	// 세션 존재 여부 확인
	String id = (String)session.getAttribute("sid");
	String pw = (String)session.getAttribute("spw");	
	%>
	sid = <%=id %> <br />
	spw = <%=pw %> <br />

</body>
</html>