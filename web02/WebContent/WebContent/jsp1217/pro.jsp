<%@page import="web.jsp1217.model.TestDTO"%>
<%@page import="web.jsp1217.model.TestDAO02"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="dto" class="web.jsp1217.model.TestDTO" />
	
<body>
<%	
	// 회원가입 로직
	// form에서 넘어온 데이터 추출
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	int age = Integer.parseInt(request.getParameter("age"));
//  db연결해서 form에서 받은 데이터를 db에 저장.
	TestDAO02 dao = new TestDAO02();
//	TestDTO dto = new TestDTO();
	dto.setId(id);
	dto.setPw(pw);
	dto.setAge(age);	
	dao.insertMember(dto);
%>
</body>
	<h3><%=id%>님 회원가입 완료!!!</h3>
</html> 