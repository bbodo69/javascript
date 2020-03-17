<%@page import="web.jsp1219.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signupPro</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
%>
<body>
<jsp:useBean id="member" class="web.jsp1219.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<%

	MemberDAO dao = new MemberDAO();
	dao.insertMember(member);

	response.sendRedirect("main.jsp");
	
%>

</body>
</html>