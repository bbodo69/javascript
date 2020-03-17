<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%
//세션쿠키검사 완료
//세션있거나 쿠키 있으면 경고창띄운 후 -> Pro보내기

	String sId = (String)session.getAttribute("sId");
	String cId = null;
	Cookie[] coo = request.getCookies();
	if(coo != null){
		for(Cookie c : coo ){
			if(c.getName().equals("cId")) cId = c.getValue();
		}
	}
	System.out.println("sId = "+sId);
	System.out.println("cId = "+cId);

	if(sId != null || cId != null){%>
		<script>
			alert("이미 로그인 상태입니다.");
			window.location.href="main.jsp";
		</script>
	<%}%>
<body>
	<br/>
	<br/>
	<br/>
	<h1>로 그 인</h1>
	<form action="loginPro.jsp" method="post">
		<table>
			<br/>
			<tr>
				<td width="250px">
					<br/>
					아이디 : <br/>
					<input type="text" name="id" autofocus/>
					<br/>
					패스워드 : <br/>
					<input type="password" name="pw" />
					<br/>
					<input type="checkbox" name="auto" />자동로그인
					<br/>
					<br/>
				</td>
			</tr>
		</table>
		<br/>
		<br/>
		<div align="center">
			<input type="submit" value="로그인" />
			<input type="button" value="회원가입" onclick="window.location.href='signupForm.jsp'"/>
		</div>
	</form>

</body>
</html>