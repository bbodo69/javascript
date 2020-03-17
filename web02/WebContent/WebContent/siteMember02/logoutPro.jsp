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
	// 세션삭제
	session.invalidate();
	// 쿠키 삭제
	Cookie [] cs = request.getCookies(); // 전체 쿠키 받아오기
	if(cs != null){
		for(Cookie coo : cs){
			if(coo.getName().equals("autoId") || coo.getName().equals("autoPw") || coo.getName().equals("autoCh")){
				coo.setMaxAge(0);
				response.addCookie(coo);
			}
		}
	}
%>
<script>
	alert("로그아웃 되었습니다.");
	location.href="main.jsp";
</script>
</body>
</html>