<%@page import="web.petDAO.model.PDTO"%>
<%@page import="web.petDAO.model.PDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 회원관리 - 회원정보 수정 페이지</title>
	<link href="style.css" rel="stylesheet" type="text/css" >
	<script>
	function check(){
		var modifyy = document.modify;
		if(!modifyy.id.value){
			alert("아이디를 입력해주세요.");
			return false;
		}
		if(!modifyy.pw.value){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
	}
</script>
</head>
<%
	if(session.getAttribute("sId") == null || !session.getAttribute("sId").equals("admin")){%>
		<script>
			alert("관리자 전용페이지입니다.");
			location.href = "main.jsp";
		</script>
<%	}else{
		String id = request.getParameter("id");
		PDAO dao = new PDAO();
		PDTO member = dao.getAdminmember(id);
%>
<body>
	<h2>관리자 전용 - 회원정보 수정</h2>
	<form name = "modify" action = "adminModifyPro.jsp" method = "post">
		<table>
			<tr>
				<td><%= id %>님의 정보를 수정중입니다.</td>
			</tr>      
			<tr>
				<td>아이디</td>	
				<td><input type = "text" name = "id" value = "<%= member.getId() %>" /></td>		
			</tr>
			<tr>
				<td>비밀번호</td>		
				<td><input type = "text" name = "pw" value = "<%= member.getPw() %>" /></td>	
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type = "text" name = "email" value = "<%= member.getEmail() %>"/></td>
			</tr>
			<tr>
				<td><input type = "submit" value = "수정" /></td>
			</tr>		
		</table>
	</form>
</body>
<%	} %>
</html>