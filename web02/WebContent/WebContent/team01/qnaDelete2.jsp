<%@page import="team01.QNADAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	

	QNADAO dao = new QNADAO();

	String id = (String)session.getAttribute("sId");
		
	Cookie [] cs = request.getCookies();
	if(cs != null && session.getAttribute("sId") == null){
		for(Cookie coo : cs){
			if(coo.getName().equals("cId")) id = coo.getValue();
		}session.setAttribute("sId", id);
	}
	
	String pw = request.getParameter("pwCheck");
	String str = request.getParameter("ref");
	
	if(str == null){				
		%>
		<script>alert('잘못된접근입니다.');location.href="main.jsp";</script>
		<%
	}else{
		int ref = Integer.parseInt(str);
		
		boolean check = dao.checkUser(id, pw, ref);
		if(check){	
			dao.qnaDelete(ref);
			response.sendRedirect("qnaForm.jsp");
		}else{%>
			<script>
				alert("비밀번호를 입력/확인하세요.");
				location.href="qnaForm.jsp";		
			</script>
		<%}
		}%>	
<body>

</body>
</html>