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

<body>
	<br/>
	<br/>
	<br/>
	<table>
<% 	//세션쿠키 검사완료
	// 세션이나 쿠키가 없고 id값이 있을 때만 가능
	String sId = (String)session.getAttribute("sId");
	String cId = null;
	Cookie[] coo = request.getCookies();
	if(coo != null){
		for(int i = 0; i < coo.length; i++){
		if(coo[i].getName().equals("cId")) cId = coo[i].getValue();
		}
	}
	String id = request.getParameter("id");
		
	if(sId == null && cId == null && id != null){
	
	
		PetmemberDAO dao = new PetmemberDAO();
		boolean b = dao.checkId(id);
		
		if(b){ %>
			<form action="signupIdCheck.jsp" method="post">		
			<tr>
				<td>
					존재하는 아이디입니다. 
					<br/>
					<br/>
					<input type="text" name="id" autofocus/>			
					<input type="submit" value="중복확인" />
				</td>
			</tr>
			
			</form>
	<%	} else{	%>
			<form>
				<tr>
					<td>
						사용 가능한 아이디입니다. 
						<br/>		
						<br/>		
						<input type="button" value="사용하기" onclick="useId()"/>
					</td>
				</tr>
			</form>	
			<script>
				function useId(){
					opener.document.signup.id.value="<%= id %>";
					self.close();
				}
			</script>
	<% 	}
	} else{%>
		<script>
			alert("접근 오류.");
			window.location.href="main.jsp";
		</script>
	<%} %>
	
	</table>
</body>
</html>