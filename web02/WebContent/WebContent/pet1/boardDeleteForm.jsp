<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href = "style.css" rel = "stylesheet" type = "text/css">
</head>
<%
	String sId = (String)session.getAttribute("sId");
	String cId = null;
	Cookie[] coo = request.getCookies();
	if(coo != null){
		for(int i = 0; i < coo.length; i++){
			if(coo[i].getName().equals(cId)) cId = coo[i].getValue();
		}
	}
	if(sId == null && cId != null){
		session.setAttribute("sId", cId);
		sId = cId;
	}
	
	if(request.getParameter("num") == null || sId == null){%>
		<script>
		alert("로그인 후 이용하실수 있습니다.");
		window.location.href = "/web/jspProject/pet/main.jsp"
		</script>	
<%	}else{
	int num = Integer.parseInt(request.getParameter("num"));
%>
<body>

	<br/>
	<br/>
	<form name = "delete" action = "boardDeletePro.jsp" method = "post" onsubmit = "return check()">
			<input type = "hidden" name = "num" value ="<%=num %>">
		<table>
		<%if(!(sId.equals("admin"))) {%>
			<tr>
				<td colspan = "2"><h1>삭제하시려면 비밀번호를 입력해주세요</h1></td>			
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type = "password" name = "pw"></td>			
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type = "password" name = "pwre"></td>			
			</tr>
		<%}else{ %>
			<tr>
				<td>이 게시물을 삭제하시겠습니까?</td>
			</tr>
		<%} %>
			<tr>
				<td align = "center" colspan = "2">
					<input type = "submit" value = "확인">
					<input type = "button" onclick = "window.location='boardList.jsp'" value = "리스트가기">
				</td>			
			</tr>
		</table>
	</form>

</body>
<%} %>
</html>