<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<form action="signupPro.jsp" method="post">
	<input type="text" placeholder="아이디 입력" name="id">
	<input type="password" placeholder="비밀번호 입력" name="pw">
	<input type="submit" value="회원가입">
	<input type="button" value="메인으로" onclick="window.location.href='main.jsp'">
	</form>
</body>
</html>