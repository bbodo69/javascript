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
	Cookie[] cs = request.getCookies(); // request 에서 전체쿠키 가져오기
	if(cs != null){// 쿠키가 있다면,
		for(Cookie coo : cs){ // 반복문 돌려서 모든 쿠키에 접근
			                  // 쿠키 이름 뽑아, 저장할때 붙인 이름과 비교해서 동일하면 삭제
			if(coo.getName().equals("autoId") || coo.getName().equals("autoPw") || coo.getName().equals("autoCh")){ 
				coo.setMaxAge(0);
				response.addCookie(coo);
			}
		}
	}
	// 쿠키, 세션삭제==> 로그아웃 ==> 로그아웃한 후에 main으로 돌아가라 
	response.sendRedirect("main.jsp");
%>
</body>

	<div align="center">
		<button onclick="window.location.href='main.jsp'">메인으로</button>
	</div>
</html>