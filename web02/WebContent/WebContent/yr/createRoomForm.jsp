<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%	
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("sId");
	String latitude = request.getParameter("latitude");
	String longitude = request.getParameter("longitude");
	System.out.println(latitude+"form");
%>


<body><form method="post" action="createRoomPro.jsp">
	<tr>
		<td>
			<input type="text" name="subject" placeholder="방제목입력">
			<input type="password" name="roomPw"  placeholder="비밀번호" >
			<input type="hidden" value="<%=latitude %>" name="latitude">
			<input type="hidden" value="<%=longitude %>" name="longitude">

			<input type="submit" value="방만들기">		
		</td>
	</tr>
</form>
</body>
</html>