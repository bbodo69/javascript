<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	session.invalidate();
	
	Cookie[] cs = request.getCookies() ;
	
	if(cs != null){
		for(int i=0; i < cs.length; i++){			
			// 쿠키의 유효시간을 0으로 설정하여 만료시킨다
			cs[i].setMaxAge(0) ;
			response.addCookie(cs[i]);
		}
	response.sendRedirect("main.jsp");
	}	
%>
</head>
<body>

</body>
</html>