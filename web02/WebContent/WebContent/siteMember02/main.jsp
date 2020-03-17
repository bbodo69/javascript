<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	// 세션의 유무에 따라 보여주는 메인 페이지 다르게
	if(session.getAttribute("id") ==null){
		String id = null, pw = null, auto = null;
		Cookie [] cs = request.getCookies();
		if(cs != null){
			for(Cookie coo : cs){
				if(coo.getName().equals("autoId")) id = coo.getValue();
				if(coo.getName().equals("autoPw")) pw = coo.getValue();
				if(coo.getName().equals("autoCh")) auto = coo.getValue();
			}
		}
		// 세션은 없지만, 쿠키가 있어서 id, pw, auto 변수에 값을 담는다.
		if(auto != null && id != null && pw != null){
			response.sendRedirect("main.jsp");
		}

%>
	<h1 align="center">메인페이지</h1>
	<table>
		<tr>
			<td>
				로그인 원하시면 버튼을 누르세요 <br />
				<input type="button" onclick="window.location.href='loginForm.jsp'" value="로그인">
			</td> 
		</tr>
		<tr>
			<td><a href="signupForm.jsp">회원가입</a></td>
		</tr>
	</table>
	<div align="center">
		<img src="img/peaceful.jpg" width=100% >
	</div>
</body>
<%}else{ %>
	<body>
	<h1 align="center">메인페이지</h1>
	<table>
		<tr>
			<td>
				<%=session.getAttribute("id")%>님 환영합니다. <br />
				<input type="button" onclick="window.location.href='logoutPro.jsp'" value="로그아웃">
				<input type="button" onclick="window.location.href='../board/list.jsp'" value="게시판 이동">
			</td> 
		</tr>
		<tr>
			<td><a href="modifyForm.jsp">회원정보 수정</a></td>
		</tr>
	</table>
	<div align="center">
		<img src="img/peaceful.jpg" width=100% >
	</div>
	
	</body>
<%} %>
</html>