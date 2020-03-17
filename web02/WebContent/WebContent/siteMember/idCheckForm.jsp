<%@page import="web.jsp1219.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인 창</title>
<script>
	function useId(){
		opener.document.getElementById("idParents").value=document.getElementById("idChild").value;
		self.close();
	}
</script>
</head>
<body>
	<h1>아이디 중복 확인</h1>
	<form action="idChPro.jsp" method="post">
	<table>
		<tr>
			<td>
				<input type="text" name="id" id="idChild">
				<input type="submit" value="중복확인">
				<input type="button" value="창닫기" onclick="window.close()">
				<input type="button" value="사용하기" onclick="useId()">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>