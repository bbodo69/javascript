<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="pro.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디	</td>
				<td colspan="4">
					<input type="text" name="id">
				</td>				
			</tr>
			<tr>
				<td>비밀번호</td>
				<td colspan="4">
					<input type="password" name="pw">
				</td>				
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td colspan="4">
					<input type="password" name="pwCh">
				</td>				
			</tr>
			<tr>
				<td>이름</td>
				<td colspan="4">
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td colspan="4">
					<input type="text" name="number">
				</td>				
			</tr>
			<tr>
				<td>취미.체크버튼</td>
				<td>
					<input type="checkbox" name="a" value="a">a			
				</td>		
				<td>
					<input type="checkbox" name="b" value="b">b			
				</td>
				<td>
					<input type="checkbox" name="c" value="c">c			
				</td>
				<td>
					<input type="checkbox" name="d" value="d">d			
				</td>				
			</tr>
			<tr>
				<td>성별, 라디오</td>
				<td colspan="5">
					<input type="radio" name="gender" value="male">male
					<input type="radio" name="gender" value="female">female
					<input type="radio" name="gender" value="other">other
				</td>							
			</tr>
			<tr>
				<td colspan="5">
					<input type="submit" value="가입">
					<input type="reset" value="리셋">
				</td>
			</tr>
		</table>	
	</form>

</body>
</html>