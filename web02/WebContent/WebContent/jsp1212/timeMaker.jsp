<%@page import="java.util.Calendar"%>
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
		Calendar cal = Calendar.getInstance(); 
		// 					"속성명", 데이터(문자, 숫자, 객체 ...)
		request.setAttribute("cal", cal);
		// 데이터를 저장해주는 공간이라고 이해된다.
		// 특정 데이터를 옮길때 옮겨주는 공간.
		
	%>
	
	<jsp:forward page="timeViewer.jsp" />
		
	

</body>
</html>