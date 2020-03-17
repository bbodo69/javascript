<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
<jsp:include page="mypage.jsp" flush="false"/>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("sId");
	if( id != null ){%>
<body>
<form>

	<table>
		<tr>
			<td>
				<%= id %> 님 환영합니다!
				<input type="button" value="로그아웃" onclick="window.location.href='logout.jsp'">
				<input type="button" value="내가쓴글 이동" onclick="window.location.href='mycontent.jsp'">
				<input type="button" value="펫 추가 메인" onclick="window.location.href='addpet.jsp'">			
			</td>
		</tr>
	</table>
</form>	
</body>	
	<%
	}else{
	%>
<body>
<form action = "loginPro.jsp">
<table>
	<tr>
		<td>
			<input type="text" name="id">
			<input type="submit" value="로그인">
			<input type="button" value="로그아웃" onclick="window.location.href='logout.jsp'">
			<input type="button" value="내가쓴글 이동" onclick="window.location.href='mycontent.jsp'">
			<input type="button" value="펫 추가 메인" onclick="window.location.href='addpet.jsp'">			
		</td>
	</tr>1`
</table>
</form>
</body>
<%} %>
</html>