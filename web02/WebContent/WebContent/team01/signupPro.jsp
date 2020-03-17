<%@page import="team01.PetMemberDAO"%>
<%@page import="web.petmember.PetMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="member" class="web.team01.PetMemberDTO" />
<jsp:setProperty property="*" name="member"/>

<%
	// 회원가입 시키기 : DAO 객체 생성
	PetMemberDAO dao = new PetMemberDAO();
	// 회원가입 메서드 호출 
	dao.insertMember(member);
	
	// 가입후 main 페이지로 이동시키기
	response.sendRedirect("main.jsp");
	
%>

</body>
</html>