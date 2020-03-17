<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="vo" class="web.jsp1213.test.SignupFormVO01"></jsp:useBean>
	<jsp:setProperty property="*" name="vo"/>
	
	아이디 : <jsp:getProperty property="id" name="vo"/><br/>
	비밀번호 : <jsp:getProperty property="pw" name="vo"/><br/>
	비밀번호 확인 : <jsp:getProperty property="pwCh" name="vo"/><br/>
	이름 : <jsp:getProperty property="name" name="vo"/><br/>
	전화번호 : <jsp:getProperty property="number" name="vo"/><br/>
	a : <jsp:getProperty property="a" name="vo"/><br/>
	b : <jsp:getProperty property="b" name="vo"/><br/>
	c : <jsp:getProperty property="c" name="vo"/><br/>
	d : <jsp:getProperty property="d" name="vo"/><br/>
	성별 : <jsp:getProperty property="gender" name="vo"/><br/>


	
	<a href="joinForm.jsp">가입페이지 이동</a>

</body>
</html>