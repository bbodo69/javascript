<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- #1. 객체 생성 --%>
	<jsp:useBean id="person" class="web.jsp1213.test.Been" />
	<%-- #2. 객체 사용(데이터저장, 꺼내기) --%>
	
	<% 
		person.setId("test");
		person.setPw("1234");
	%>
	
	<%-- 객체에서 데이터 꺼내 출력 --%>
	아이디 : <%= person.getId() %>
	비번 :  <%= person.getPw() %>
</body>
</html>