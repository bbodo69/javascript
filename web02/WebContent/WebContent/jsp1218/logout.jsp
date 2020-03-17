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
	//로그아웃 --> 쿠키 삭제
	//쿠키들 다 꺼내서 cookieId, cookidPw 업애기
	Cookie [] cookies = request.getCookies();
	for(Cookie c : cookies){
		if(c.getName().equals("cookieId")){		// 쿠키 걸러서 삭제
			c.setMaxAge(0);						// 삭제 없어서 유효시간 0초로
			response.addCookie(c);			    // response에 적용
			}									
		if(c.getName().equals("cookiePw")){
			c.setMaxAge(0);
			response.addCookie(c);
			}
		}
	
		
		response.sendRedirect("form.jsp");
%>

</body>
</html>