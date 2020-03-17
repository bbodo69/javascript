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
	int num = 0;
	String id = (String)session.getAttribute("sId");
	String cid = null;
	Cookie[] coo = request.getCookies();
	if(coo != null){
		for(int i = 0; i < coo.length; i++){
			if(coo[i].getName().equals("cid")) cid = coo[i].getValue();
		}
	}
	
	if(id == null && cid == null){%>
		<script>
			alert("로그인 후 이용하실수 있습니다.");
			window.location.href="/web/jspProject/pet/main.jsp";
		</script>
<%	}else{
		if(id == null && cid != null){
			session.setAttribute("sId", cid);
			id = cid;
		}
	}
%>
<body>
	<br/><br/>
	<form action="boardWriterPro.jsp" name = "input" method = "post" encType = "multipart/form-data">
		<input type = "hidden" name = "num" value = "<%=num %>">
		<table>
			<tr>
				<td width = "600" colspan = "4"><h1 align = "center">글쓰기</h1></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><%= id %></td>
				<td>제목</td>
				<td><input type = "text" name = "subject"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan = "3">
				<textarea rows="20" cols="70" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td>사진</td>
				<td colspan = "3" align = "left">
				<input type = "File" name = "photo">
				</td>
			</tr>
			<tr>
				<td colspan = "4">
					<input type = "submit" value = "저장">
					<input type = "reset" value = "다시쓰기">
					<input type = "button" value = "리스트" onclick ="window.location='boardList.jsp'">
				</td>
			</tr>
			
		</table>
	</form>
	<br/><br/>
</body>
</html>