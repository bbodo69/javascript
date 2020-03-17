<%@page import="web.jsp1220.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	String id = request.getParameter("id");
		
	MemberDAO dao = MemberDAO.getInstance();
	boolean check = dao.checkId(id);
	
	if(check){
		%>
		<script>
		alert("<%=id %>사용 불가");
		history.back();
		</script>
	<%}else{%>
		<script>
		alert("<%=id %>사용 가능");
		history.back();
		</script>
<%}%>
<body>

</body>
</html>