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
	// 쿠키가 유무에 따른 처리
	// #1. 쿠키 꺼내기
	Cookie [] cookies = request.getCookies();
	String cookieId = null, cookiePw = null;
	for(Cookie c : cookies){
		out.println(c.getName() + " = " + c.getValue() + "<br />");
		if(c.getName().equals("cookieId")){
			cookieId = c.getValue();
		}
		if(c.getName().equals("cookiePw")){
			cookiePw = c.getValue();			
		}
	}
	
	if(cookieId != null){ // 로그인 되어있다. %>
		<h2> <%= cookieId %> 님 로그인 완료</h2>	
		<input type="button" value="로그아웃" onclick="window.location.href='logout.jsp'" />	
	
	<%	}else{  // 로그인 안된 상태  %>
	
		<h2> form 에서 로그인하세요. </h2>
		<input type="button" value="로그인페이지" onclick="window.location.href='form.jsp'" />


<%  }
%>
	<h2> main page</h2>

</body>
</html>