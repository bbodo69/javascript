<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>관리자 페이지</title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%
	if(session.getAttribute("sId") == null || !session.getAttribute("sId").equals("admin")){%>
		<script>
			alert("관리자 전용페이지입니다.");
			window.location = 'main.jsp';
		</script>
<%	}else{%>
<body>
	<br/>
	<h1>관리자님 환영합니다!</h1>
	<br /><br /><br />
	<table>
		<tr>
			<td width="200"><h2><a href = 'adminManager.jsp'>전체 회원 관리</a></h2></td>
		</tr>
	</table>
	<br/>
	<table>
		<tr>
			<td>게시판 관리</td>
		</tr>
		<tr>
			<td><h2><a href = 'boardList.jsp'>자유 게시판 관리</a></h2></td>
		</tr>
		<tr>
			<td><h2><a href = 'qnaForm.jsp'>정보나눔 게시판 관리</a></h2></td>
		</tr>
		<tr>
			<td><h2><a href = 'tradeList.jsp'>거래 게시판 관리</a></h2></td>
		</tr>
		<tr>
			<td><h2><a href = 'getpetList.jsp'>펫시터 구인 게시판 관리</a></h2></td>
		</tr>
		<tr>
			<td><h2><a href = 'commentList.jsp'>펫시터 후기 게시판 관리</a></h2></td>
		</tr>
	</table>
</body>
<%	} %>
</html>