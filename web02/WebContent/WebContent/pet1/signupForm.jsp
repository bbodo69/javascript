<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script>
	function checkValues(){
		var sinup = document.signup;

		if(!sinup.id.value){
			alert("아이디를 입력하세요.");
			return false;
		}
		if(!sinup.pw.value){
			alert("패스워드를 입력하세요.");
			return false;
		}
		if(!sinup.pw2.value){
			alert("패스워드 확인을 입력하세요.");
			return false;
		}
		if(sinup.pw.value != sinup.pw2.value){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		
	}
	
	function checkId(){
		var sinup = document.signup;
		if(!signup.id.value){
			alert("아이디를 입력하세요.");
			return;
		}
		var url= "signupIdCheck.jsp?id="+signup.id.value;
		open(url, "아이디 중복검사", "toolbar=no, status=no, menubar=no, scrollbars=no, resizalbe=no, width=300px, height==200px"); 
	}
</script>
</head>
<%
	//세션쿠키검사
	//비로그인만 진행
	
	String sId = (String)session.getAttribute("sId");
	String cId = null;
	Cookie[] coo = request.getCookies();
	if(coo != null){
		for(int i = 0; i < coo.length; i++){
			if(coo[i].getName().equals("cId")) cId = coo[i].getValue();
		}
	}

	if(sId != null || cId != null ){ %>
		<script type="text/javascript">
			alert("이미 회원입니다.");
			window.location.href="main.jsp";
		</script>
 <% }
	
	
%>
<body>
	<br/>
	<h1>회원가입</h1>
	<br/><br/>
	<form name="signup" onsubmit="return checkValues()" action="signupPro.jsp" method="post">
		<table>
			<tr>
				<td>*아이디</td>
				<td><input type="text" name="id" autofocus/>
					<input type="button" value="중복검사" onclick="checkId()"/>
				</td>
			</tr>
			<tr>
				<td>*비밀번호</td>
				<td><input type="password" name="pw" /></td>
			</tr>
			<tr>
				<td>*비밀번호 확인</td>
				<td><input type="password" name="pw2" /></td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><input type="text" name="email" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="가입하기" />
					<input type="button" value="뒤로가기" onclick="history.go(-1)"/>
				</td>
			</tr>
			
			
		</table>
	</form>

</body>
</html>