<%@page import="web.jsp1219.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>comfirmId</title>
</head>
<body>
<%-- 팝업으로 열람 창 만들기 --%>

<%

	// 로그아웃 상태만 접근 가능하게
	if(session.getAttribute("memId") != null){ %>
		<script>
			alert("로그아웃 후 이용가능합니다.");
			self.close(); 
		</script>	
	<%}
	
	request.setCharacterEncoding("UTF-8");

	// 주소뒤에 붙혀온 파라미터 받기
	String id = request.getParameter("id");
	// DB 연결해서 입력받아 넘어온 id가 DB에 이미 존재하는지 확인
	MemberDAO dao = new MemberDAO();
	
	boolean check = dao.confirmId(id);
	// check == true : DB 에 id가 이미 존재
	// check == false : DB 에 id가 존재 X
	
	if(check){
    %>
<body>
	<table>
		<tr>
			<td><%= id %>는 이미 사용중인 아이디 입니다.</td>
		</tr>
	</table>	
	<form action="confirmId.jsp" method="post">
		<table>
			<tr>
				<td>다른아이디를 사용하세요. <br/>
					<input type="text" name="id" >
					<input type="submit" value="id 중복 확인" >
				</td>
			</tr>
		</table>
	</form>
</body>		
<%	}else{ %>
<body>
	<table>
		<tr>
			<td>입력하신 <%=id %>는 사용가능한 아이디 입니다. <br />
				<input type="button" value="close" onclick="setId()">
			</td>
		</tr>
	</table>
</body>
<script>
	function setId(){
		// signupForm 페이지의 id 기입 input 태그에 위에서 검사한 id 값 적용 시키기.
		opener.document.inputForm.id.value="<%=id%>";
		
		// 팝업창 화면 닫기
		self.close();
	}
</script>


<%
}
%>

</body>
</html>