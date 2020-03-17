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
	String pw = request.getParameter("pw");
	int ref = Integer.parseInt(request.getParameter("ref"));
	
	if(pw == null){
%>
<form action="roomPro.jsp">;
<body>
	비밀번호 입력<input type="password" name = "pw">
	<input type="submit" value="제출">
	<input type="hidden" value="<%=ref %>" name="ref">
</body>
</form>
<%}else{
	pw = request.getParameter("pw");
	yrDAO dao = new yrDAO();
	boolean check = dao.checkPw(pw, ref);
	if(check){response.sendRedirect("room.jsp?check="+check+"&ref="+ref);
	
	
	//------여기부터 작성 비밀번호 맞췄을때 방에 들어가서 채팅하고 지도 띄우기.	
	}else{%><script>alert('잘못된 비밀번호');history.back();</script>
	<%
		}
	}
%>


</html>