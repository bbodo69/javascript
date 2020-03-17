<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function idCheck(){
		window.name = "parentForm";
		window.open("idCheck.jsp", "idCheck", 
				"width=200, heigth=100, resizable = no, scrollbars = no");
	}	
</script>


<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form action="signupPro.jsp">
	<h2 align="center">회원가입</h2>
	<table>
		<tr>
			<td>
				아이디 *
			</td>
			<td>
				<input type="text" name="id" id="idParent" >
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="중복확인" onclick="idCheck()">
			</td>
			
		</tr>
		<tr>
			<td>
				비밀번호 *
			</td>
			<td>
				<input type="password" name="pw">
			</td>
		</tr>
		<tr>
			<td>
				비밀번호 확인 *
			</td>
			<td>
				<input type="password" name="pwCh">
			</td>
		</tr>
		<tr>
			<td>
				이름 *
			</td>
			<td>
				<input type="text" name="name">
			</td>
		</tr>
		<tr>
			<td>
				생년월일 *
			</td>
			<td>
				<input type="text" name="birth">
			</td>
		</tr>
		<tr>
			<td>
				email *
			</td>
			<td>
				<input type="text" name="email">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="가입">
				<input type="reset">
				<input type="button" value="취소" onclick="window.location.href='main.jsp'">
			</td>
		</tr>
	</table>
</form>
</body>
</html>