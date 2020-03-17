<%@page import="web.jsp1220.member.MemberDAO"%>
<%@page import="web.jsp1220.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="dto" class="web.jsp1220.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%	
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String auto = request.getParameter("auto");
	
	//메인에 세션없고, 쿠키가 있어서 넘어올때,
	// loginFrom을 타고 온것이 아니라 dto.get 으로 값을 얻을 수 없다.
	// 쿠키 안에서 값을 꺼내야 한다.
	Cookie [] cs = request.getCookies();
	if(cs != null){
		for(Cookie coo : cs){
			if(coo.getName().equals("autoId")) {id = coo.getValue();}
			if(coo.getName().equals("autoPw")) {pw = coo.getValue();}
			if(coo.getName().equals("autoCh")) {auto = coo.getValue();}
		}
	}
	
	//로그인 체크
	MemberDAO dao = new MemberDAO();
	boolean check = dao.loginCheck(id, pw);
	
	
	if(check){
		session.setAttribute("memId", id);
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
	}else{%>
		<script>
		alert("아이디 또는 비밀번호 잘못 입력!!!");
		history.go(-1);
		</script>
<%}System.out.println(id);
System.out.println(auto);
%>
	

	
</body>
</html>