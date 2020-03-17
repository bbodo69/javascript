<%@page import="web.jsp1230.model.MemberDAO"%>
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
	
	System.out.println("loginPro");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String auto = request.getParameter("auto");
	request.setCharacterEncoding("UTF-8");
	
	System.out.println(id);
	System.out.println(pw);
	System.out.println(auto);
	
	// loginForm 이 아닌 외부에서 들어올때. 쿠키 있으면 자동 로그인 처리.
	Cookie [] cs = request.getCookies();
	if(cs != null){
		for(Cookie coo : cs){
			if(coo.getName().equals("autoId")){id = coo.getValue();}
			if(coo.getName().equals("autoPw")){pw = coo.getValue();}
			if(coo.getName().equals("autoCh")){auto = coo.getValue();}
		}
	}
	
	
	// 로그인 체크
	MemberDAO dao = new MemberDAO();
	boolean check = dao.loginCheck(id, pw);
	
	if(check){
		session.setAttribute("id", id);		
		System.out.println(id);
		if(auto != null){
			Cookie c1 = new Cookie("autoId", id);
			Cookie c2 = new Cookie("autoPw", pw);
			Cookie c3 = new Cookie("autoCh", auto);
			
			c1.setMaxAge(60*60*24);
			c2.setMaxAge(60*60*24);
			c3.setMaxAge(60*60*24);
			
			response.addCookie(c1);
			response.addCookie(c2);
			response.addCookie(c3);			
		}
		response.sendRedirect("main.jsp");
	}else{
		%>
	<script>
		alert("아이디와 비밀번호 잘못 입력 !!");
		location.href="loginForm.jsp";
	</script>
<%}
%>

</body>
</html>