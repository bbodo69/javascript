<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초기화 파라미터 읽기</title>
</head>

<%
	Enumeration hanmas = request.getHeaderNames();  


%>
<body>

	<h3>초기화 파라미터 목록</h3>
	<ul>
	<%
		Enumeration initParamNames = application.getInitParameterNames();	
		// 반복해서 이름과 값을 꺼내서 리스트 형태로 화면에 보여주기.
		while(initParamNames.hasMoreElements()){ //목록이 있을때까지 반복
			//목록에서 다음요소 꺼내서 변수에 담기
			String paramName = (String)initParamNames.nextElement(); %>
			
			<li><%=paramName %> = <%=application.getInitParameter(paramName) %></li>
		<% }
	%>
	</ul>


</body>
</html>