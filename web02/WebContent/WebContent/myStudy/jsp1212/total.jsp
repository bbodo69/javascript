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
		String str = "한글출력할꺼다.";
		request.setAttribute("name", str);
	%>  >

	<table border="1">
		<tr>
			<td>
				<jsp:include page="top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="content.jsp"></jsp:include>
			</td>
		</tr>		
		<tr>
			<td>
				<jsp:include page="/myStudy/bottom.jsp"></jsp:include>
			</td>
		</tr>				
	</table>



</body>
</html>