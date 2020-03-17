<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 삭제</title>
	<link href="style.css" rel="stylesheet" type="text/css" >
</head>
<%
	// # 로그인 상태 확인하고 페이지 처리
	if(session.getAttribute("sId") == null) { %>
		<script>
			alert("잘못된 접근입니다.");
			window.location="main.jsp";
		</script>	
<%	}else{
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
%>
<body>
	<br />
	<h1 align = "center">게시글 삭제</h1>
	<form action = "tradeDeletePro.jsp?pageNum=<%=pageNum %>" method = "post" >
		<input type = "hidden" name = "num" value = "<%=num %>" />
		<table>
			<tr>
				<td>삭제를 원하시면 비밀번호를 입력하세요.</td>
			</tr>
			<tr>
				<td><input type = "password" name = "pass" /></td>
			</tr>
			<tr>
				<td>
					<input type = "submit" value = "삭제" />
					<input type = "button" value = "취소" onclick = "window.location = 'tradeList.jsp?pageNum=<%=pageNum%>'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
<%	} %>
</html>