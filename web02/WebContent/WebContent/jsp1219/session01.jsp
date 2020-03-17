<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(session.getAttribute("sid")== null){ %>
<form action = "sessionPro.jsp" method="post">
	id : <input type="text" name="id"><br />
	pw : <input type="password" name="pw"><br />
		 <input type="submit" value="가입"><br />

</form>
<%}else{ // 세션이 있을때 ==> 로그인된 상태 %>

	<script>
		alert("로그인된 상태");
		window.location.href="sessionMain01.jsp";	
	</script>
<%}%>
</body>
</html>