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
<%	
	String id= request.getParameter("id");	


	MemberDAO dao = new MemberDAO();
	boolean check = dao.confirmId(id);
	
	if(check){
		%>
		<script>
			alert("<%=id%> 사용 불가");
			history.back();
		</script> 	
	<%}else{%>
		<script>
			alert("<%=id%> 사용 가능");
			history.back();
		</script>
<%
}
%>
</body>
</html>