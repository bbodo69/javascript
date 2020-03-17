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
	// 쿠키삭제
	Cookie [] cs = request.getCookies(); // 전체 쿠키 받아오기
	if(cs != null){
		for(Cookie coo : cs){ // 반복문 돌려서 모든 쿠키에 접근
							  // 쿠키 이름 뽑아, 저장할때 붙인 이름과 비교해서 동일하면 삭제
			if(coo.getName().equals("autoId") || coo.getName().equals("autoPw") || coo.getName().equals("autoCh")){
				coo.setMaxAge(0);
				response.addCookie(coo);
			}
					
		}
	}
	response.sendRedirect("main.jsp");
%>	

</body>
</html>