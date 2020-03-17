<%@page import="java.util.List"%>
<%@page import="web.jsp1230.model.MemberDTO"%>
<%@page import="web.jsp1230.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%	
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = (MemberDTO)dao.modify(id);
	
	String pw = dto.getPw();
	String pwCh = dto.getPwCh();
	String name = dto.getName();
	String birth = dto.getBirth();
	String email = dto.getEmail();	
	
	
	List imgs = dao.getImg(id);
//	MemberDTO dto2 = dao.getImg2(id);
//	dto2.getImg();
	
%>
<body>
<form action="modifyPro.jsp" method="post" enctype="multipart/form-data">
	<h2 align="center">회원가입</h2>
	<table>
		<tr>
			<td>
				아이디 *
			</td>
			<td>
				<input type="text" name="id" id="idParent" value="<%= id %>">				
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="중복확인" onclick="idCheck()">
			</td>
			
		</tr>
		<tr>
			<td>
				비밀번호 *
			</td>
			<td>
				<input type="password" name="pw" value="<%= pw%>">
			</td>
		</tr>
		<tr>
			<td>
				비밀번호 확인 *
			</td>
			<td>
				<input type="password" name="pwCh" value="<%= pwCh%>">
			</td>
		</tr>
		<tr>
			<td>
				사진 *
			</td>
			<td>
	 			<input type="file" name="img"> <br />
				<% for(int i = 0 ; i < imgs.size() ; i++){%>
				<img src = "/web/save/<%=imgs.get(i) %>" width="100" />
				<%} %>
			</td>
		</tr>
		<tr>
			<td>
				이름 *
			</td>
			<td>
				<input type="text" name="name" value="<%= name%>">
			</td>
		</tr>
		<tr>
			<td>
				생년월일 *
			</td>
			<td>
				<input type="text" name="birth" value="<%= birth%>">
			</td>
		</tr>
		<tr>
			<td>
				email *
			</td>
			<td>
				<input type="text" name="email" value="<%= email%>">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정">
				<input type="reset" value="초기화">
				<input type="button" value="취소" onclick="window.location.href='main.jsp'">
			</td>
		</tr>
	</table>
</form>

</body>
</html>