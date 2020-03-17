<%@page import="web.jsp1219.member.MemberDTO"%>
<%@page import="web.jsp1219.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정/탈퇴</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%
	if(session.getAttribute("memId") == null){%>
	<script>
		alert("로그인해주세요");
		window.location.href="loginForm.jsp";
	</script>
	
<%}else{%>






<%
	// 로그인 된 상태에서 실행 == session 에 memId가 존재
	// DB에 접속해서 회원의 정보를 모두 긁어와 화면에 뿌려주기
	// 세션에 저장된 사용자의 id 꺼내기
	String id = (String)session.getAttribute("memId");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO member = dao.getMember(id);
	System.out.println(member.getId());
	
%>

<body>
	<br />
	<h1 align="center">회원정보 수정</h1>
	<form action="modifyPro.jsp" method="post">
	<table>
		<tr>
			<td>아이디 * </td>
			<td><%=member.getId() %></td> <!-- 수정안하는건 그대로 가져온다 -->
		</tr>
		<tr>
			<td>비밀번호 * </td>
			<td><input type="password" name="pw" value="<%=member.getPw() %>" /></td>
		</tr>
		<tr>
         <td>이름 * </td>
         <td><%=member.getName() %>></td>
      </tr>
      <tr>
         <td>생년월일</td>
         <td>
         <%if(member.getBirth()==null){ %>
         <input type="text" name="birth" maxlength="8" />
         <%}else{%>
         <input type="text" name="birth" maxlength="8" value="<%=member.getBirth()%>">
            
         <%} %>
         </td>
      </tr>
      <tr>
         <td>Email </td>
         <td>
         <%if(member.getEmail()==null) {%>			<!--  들어있는게 없을때 그대로 입력 -->
         <input type="text" name="email" />
         <%}else{ %>
         <input type="text" name="email" value="<%=member.getEmail()%>"/> <!--  들어있는게 있을때 우선 전에 있던것을 입력시켜줌, 이게 없으면 수정시 데이터 유실 될 수 있음 -->
         <%} 
         %>
         </td>
      </tr>
      <tr>
         <td colspan="2" align="center">
            <input type="submit"  value="가입" />
            <input type="reset"  value="재입력" /> 
            <input type="button"  value="취소" onclick="window.location.href ='signupMain.jsp'" /> 
         </td>
      </tr>
   </table>
   </form>
   <%} %>
</body>
</html>