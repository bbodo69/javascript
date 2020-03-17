<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<form action="loginPro.jsp" method="post">
	<tr>
		<td>id</td>
		<td><input type="text" name="id"></td> 
	</tr>
	<tr>
		<td>password</td>
		<td><input type="password" name="pw"></td>
	</tr>
	<tr>
		
		<td><input type = "submit" value="login"><input type="button" onclick="window.location.href='main.jsp'" value="메인"></td>
		
	</tr>
	</form>
</table>

</body>
</html>
