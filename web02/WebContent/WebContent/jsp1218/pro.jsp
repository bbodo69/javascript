<%@page import="web.jsp1218.model.TestDAO"%>
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
	// 로그인 확인창
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// DB에 저장된 회원들 데이터에서 id/pw가 일치하는 정보있는지 확인.
	TestDAO dao = new TestDAO();
	boolean result = dao.loginCheck(id, pw);	
	System.out.println(result);
	
	// id,pw 확인한 result 결과값이 true 이면 쿠키 생성
	if(result == true){
		Cookie c1 = new Cookie("cookieId",id);
		Cookie c2 = new Cookie("cookiePassword",pw);
		c1.setMaxAge(60*60*24);		//1day
		c2.setMaxAge(60*60*24);
		response.addCookie(c1);
		response.addCookie(c2);
	}
	else{%>
	<script>
		alert('아이디, 패스워드 불일치');
	</script>
		
	<%}
	
	// main으로 이동
	response.sendRedirect("main.jsp");
	
%>

</body>
</html>