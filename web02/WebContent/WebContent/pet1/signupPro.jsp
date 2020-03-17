<%@page import="web.pet.model.PetmemberDAO"%>
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
	request.setCharacterEncoding("UTF-8");

	String sId = (String)session.getAttribute("sId");
	String cId = null;
	Cookie[] coo = request.getCookies();
	if(coo != null){
		for(int i = 0; i < coo.length; i++){
			if(coo[i].getName().equals("cId")) cId = coo[i].getValue();
		}
	}
	
	if(sId != null || cId != null ){ %>
		<script type="text/javascript">
			alert("접근오류.");
			window.location.href="main.jsp";
		</script>
	<% }else{
		
			String id = request.getParameter("id");
			if(id == null){ %>
				<script type="text/javascript">
					alert("접근오류.");
					window.location.href="main.jsp";
				</script>
		 <% }else{ %>

			<jsp:useBean id="petmember" class="web.pet.model.PetmemberDTO" />
			<jsp:setProperty property="*" name="petmember"/>
			
			<%
				PetmemberDAO dao = new PetmemberDAO();
				dao.signup(petmember);
			%>
			<body>
				<h1>회원가입</h1>
				<table>
					<tr>
						<td>
							<%=petmember.getId()%> 님 회원가입이 완료되었습니다.
							<br/>
							<br/>
							<button onclick="window.location.href='main.jsp'">메인으로</button>
						</td>
					</tr>
				
				</table>
			
			</body>

		<%	}
	   } %>
</html>