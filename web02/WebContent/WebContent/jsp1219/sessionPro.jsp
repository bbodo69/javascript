<%@page import="web.jsp1219.model.TestDAO01"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	

<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//DB --> DAO
	TestDAO01 dao = new TestDAO01();	
	boolean check = dao.loginCheck(id, pw);
	
	//check 가 true 이면 로그인이 잘된 상태 --> 세션을 만들어야 로그인상태로 세팅
	if(check == true){
		// 세션 추가
		session.setAttribute("sid", id);
		session.setAttribute("spw", pw);
		
//		HttpSession session = request.getSession(); 또 다른 세션 추가 방법
		
	}
	
	response.sendRedirect("sessionMain01.jsp");
	
%>

</body>
</html>