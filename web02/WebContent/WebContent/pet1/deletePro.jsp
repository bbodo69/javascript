<%@page import="web.pet.model.PetmemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" >

</head>
<%	
	String sId = (String)session.getAttribute("sId");
	String cId = null;
	Cookie[] coo = request.getCookies();
	if(coo != null){
		for(int i = 0; i < coo.length; i++){
		if(coo[i].getName().equals("cId")) cId = coo[i].getValue();
		}
	}
	
	if(sId == null && cId == null){	%>
		<script>
			alert("접근오류.");
			window.location.href="main.jsp";
		</script>	
	<%	}else if(sId == null && cId != null){
		session.setAttribute("sId", cId);
		sId = cId;
	}
	String pw = request.getParameter("pw");
	
	if(pw == null){%>
		<script>
			alert("접근오류.");
			window.location.href="main.jsp";
		</script>	
<%	}else{
	
		PetmemberDAO dao =  new PetmemberDAO();
		int result = dao.deleteMember(sId, pw);
		if(result == 1) {	
			session.invalidate();
			Cookie[] cs = request.getCookies();	
			if(cs != null){	
				for(Cookie c : cs){ 
					if(c.getName().equals("cId")){	
						c.setMaxAge(0);
						response.addCookie(c);
					}
				}
			} %>
		<body>
			<br />
			<table>
				<tr>
					<td>회원탈퇴가 완료 되었습니다.</td>
				</tr>
				<tr>
					<td><button onclick="window.location.href='main.jsp'" > 메인으로 </button> </td>
				</tr>
			</table>
		</body>
			
	<%	}else{	%>
			<script>
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);
			</script>
	<%	}	
	}
%>

</html>