<%@page import="web.petDAO.model.PDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 정보 관리</title>
	<link href="style.css" rel="stylesheet" type="text/css" >
	<script>
	function adminmodify(id){
		document.modify.id.value = id;
		document.modify.submit();
	}
	function admindelete(id){
		document.deletee.id.value = id;
		document.deletee.submit();
	}
	</script>
</head>
<%
	if(session.getAttribute("sId") == null || !session.getAttribute("sId").equals("admin")){%>
		<script>
			alert("관리자 전용페이지입니다.");
			window.location = 'main.jsp';
		</script>
<%	}else{ %>
<jsp:useBean id = "manager" class = "web.petDAO.model.PDAO" />
<body>
	<br/>
	<h1 align = "center">** 관리자 - 전체 회원 관리 **</h1>
	<br /><br />
	<table>
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이메일</td>
			<td>가입날짜</td>
		</tr>
		<%
		ArrayList<PDTO> list = manager.getMemberAll();
		for(PDTO dto : list){	%>
			<tr>
				<td><%=dto.getId() %></td>
				<td><%=dto.getPw() %></td>
				<td><%=dto.getEmail() %></td>
				<td><%=dto.getReg() %></td>
				<td><a href = "javascript:adminmodify('<%=dto.getId() %>')">수정하기</a></td>
				<td><a href = "javascript:admindelete('<%=dto.getId() %>')">삭제하기</a></td>
			</tr>
	<%	}%>
	</table>
	<h2 align = "center"><a href = "adminPage.jsp">관리자 페이지로 돌아가기</a></h2>
</body>
<%	} %>
</html>