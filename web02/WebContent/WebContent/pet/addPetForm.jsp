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
<form action="addPetPro.jsp" method="post" enctype="multipart/form-data">
<%	
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("sId");
	
	Cookie [] cs = request.getCookies();
	if(cs != null && session.getAttribute("sId") == null){
		for(Cookie coo : cs){
			if(coo.getName().equals("cId")) id = coo.getValue();
		}session.setAttribute("sId", id);
	}
	if(id != null){
%>
<table>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
		<td>이미지 등록</td>
	</tr>
	<tr>
		<td>종류</td>
		<td><input type="text" name="kind"></td>
		<td><input type="file" name="img"></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><input type="text" name="age"></td>
		<td rowspan = "3"></td>
	</tr>
	<tr>
		<td>@</td>
		<td></td>
	</tr>
	<tr>
		<td>@</td>
		<td></td>
	</tr>
	<tr>
		<td colspan = "3">
		<input type="submit" value="저장">
		<input type="button" value="펫메인페이지 이동" onclick="window.location.href='addpet.jsp'">
		<input type="button" value="메인페이지 이동" onclick="window.location.href='mypage.jsp'">
		</td>
	</tr>
</table>
<%}else{%>
	<script>alert('로그인 필요');history.back();</script>
<%	
	} %>
</form>
</body>
</html>