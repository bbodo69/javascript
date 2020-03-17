<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script>
	
<%--	function confirmIdPopup(inputForm){
		if(inputForm.id.value == ""){
			alert("아이디 입력하세요.");
			return; 		//가입 안했으면 현재 메서드 종료
		}
		
		var url = "confirmId.jsp?id="+inputForm.id.value;
		// 화면의 띄워줄 페이지 이름과 id=값(name속성값이 id인 input 태그에 가입한 값)
		open(url,"comfirm", "toolbar=no, location=no, status=no, menubar=no, resizable=no, width=300, height=200")
	} 
--%>	
	function idCh(){
		window.name = "parentForm";
		window.open("idCheckForm.jsp", "chkForm", 
				"width=200, heigth=100, resizable = no, scrollbars = no");
	}	
	</script>
	
	
	
</head>
<body>
	<br />
	<h1 align="center">회원가입</h1>
	<form action="signupPro.jsp" method="post">
	<table>
		<tr>
			<td>아이디 * </td>
			<td><input type="text" name="id" id="idParents" /></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="button" value="중복확인" onclick="idCh()"></td>
		</tr>
		<tr>
			<td>비밀번호 * </td>
			<td><input type="password" name="pw" /></td>
		</tr>
		<tr>
			<td>이름 * </td>
			<td><input type="text" name="name" /></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="text" name="birth" maxlength="8" /></td>
		</tr>
		<tr>
			<td>Email </td>
			<td><input type="text" name="email" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit"  value="가입" />
				<input type="reset"  value="재입력" /> 
				<input type="button"  value="취소" onclick="window.location.href='main.jsp'" />
			</td>
		</tr>
	</table>
	</form>
	
	
	
	
	
</body>
</html>