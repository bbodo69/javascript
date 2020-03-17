<%@page import="web.pet.model.CommentbDTO"%>
<%@page import="web.pet.model.CommentbDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%
	//세션쿠키검사완료
	String sId = (String)session.getAttribute("sId");	
	String cId = null;
	Cookie[] coo = request.getCookies();
	if(coo != null){
		for(int i = 0; i < coo.length; i++){
			if(coo[i].getName().equals("cId")) cId = coo[i].getValue();
		}
	}
	if(sId == null && cId != null){ 
		session.setAttribute("sId", cId);
		sId = cId;
	}
	
	int num = 0;
	
	if(request.getParameter("num") == null || sId == null){%>
		<script>
			alert("접근 오류.");
			window.location.href="main.jsp";
		</script>
	<%}else{ 
		num = Integer.parseInt(request.getParameter("num"));
	%>
		<body>
		<br/>
		<br/>
			<form action="recommentDeletePro.jsp" method="post">
			<input type="hidden" name="num" value="<%=num%>"/>
				<table>
					<tr>
						<td>비밀번호를 입력하세요.<br/>
						<input type="password" name="pw" />
						</td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="삭제하기"/>
							<input type="button" value="뒤로가기" onclick="history.go(-1)"/>
						</td>
					</tr>
				</table>
			</form>
		</body>
	<%} %>
</html>