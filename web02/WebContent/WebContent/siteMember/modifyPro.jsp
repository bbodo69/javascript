<%@page import="web.jsp1219.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(session.getAttribute("memId") == null){
	%>
		<script>
			alert("로그인 해주세요");
			window.location.href="loginForm.jsp";		
		</script>
<%}else{ %>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="member" class="web.jsp1219.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>

<%
	// 넘어오는 데이터 비밀번호, 생년월일, email
	// form에서 id 안 넘어옴 :  id를 알기위해 session에서 id 꺼내기
	String id = (String)session.getAttribute("memId");
	member.setId(id);	// dto에 직접 id 세팅해서 db에 수정할 데이터를 dto 통으로 보내, 회원정보 수정하기/
	MemberDAO dao = new MemberDAO();
	
	dao.updateMemner(member);
%>

</body>
	<br />
	<h1 align="center">회원정보 수정</h1>
	<table>
		<tr>
			<td><b>회원정보가 수정 되었습니다. </b></td>
		</tr>
		<tr>
			<td>
				<button onclick="window.location.href='main.jsp'">메인으로</button>
			</td>
		</tr>
	</table>
	<%} %>
	
	
</html>