<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%
	String id = (String)session.getAttribute("id");
	
%>
<body>
<form action = "insertContentPro.jsp" method="post" enctype="multipart/form-data">
<table>
	<tr>
		<td>작성자</td><td><%= id%></td>
		<td>이메일</td><td></td>
		<td>비밀번호</td><td><></td>
		
	</tr>
	<tr>
		<td>제목</td>
		<td colspan = "5"><textarea rows="20" cols="70" name="subject"></textarea></td>
	</tr>
	<tr>
		<td>내용</td>
		<td colspan = "5"><textarea rows="20" cols="70" name="content"></textarea></td>
	</tr>
	<tr>
		<td colspan = "6">
		<input type="submit" value="저장">
		<input type="button" value="답글" onclick="window.location.href='reply.jsp'">
		<input type="button" value="취소" onclick="window.location.href='list.jsp'">
		</td>
	</tr>
</table>
</form>

</body>
</html>