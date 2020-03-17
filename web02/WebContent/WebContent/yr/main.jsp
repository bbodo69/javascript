<%@page import="yr.yrDTO"%>
<%@page import="java.util.List"%>
<%@page import="yr.yrDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	
	String id = (String)session.getAttribute("sId");
	// 세션 검사, 쿠키 검사, 없을시 세션 아이디 생성
	Cookie [] cs = request.getCookies();	
	if(cs != null && id == null){
		for(Cookie coo : cs){
			if(coo.getName().equals("cId")){ id = coo.getValue(); }
		}
	}
	
%>

	<% if(id == null){ %>
<body>
<table>
	<tr><form action="loginForm.jsp" method="post">
		<td><input type="submit" value="로그인"><input type="button" onclick="window.location.href='signupForm.jsp'" value="회원가입"><input type="button" onclick="window.location.href='logout.jsp'" value="로그아웃"></td>
	</tr></form>
</table>

</body>
<%}else{ %>
<body>
<table>
	<tr>
		<td><%= id %>님 로그인 완료</td>
	</tr>
	<tr>
		<td><input type="button" onclick="window.location.href='createRoomGeo.jsp'" value="게시판이동"></td>
		<td><input type="button" onclick="window.location.href='logout.jsp'" value="로그아웃"></td>	
	</tr>
</table>


</body>
<%} %>
</html>