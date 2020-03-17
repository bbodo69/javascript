<%@page import="team01.QNADTO"%>
<%@page import="java.util.List"%>
<%@page import="team01.QNADAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="mypage.jsp" flush="false"/>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%		
	request.setCharacterEncoding("UTF-8");
	QNADAO dao = new QNADAO();
	String id = (String)session.getAttribute("sId");
	List list = dao.getMyContents(id);
	int number = dao.countMyContents(id);	
	
	if(id == null){
		%> 
		<script>
		alert('로그인이 필요한 서비스');history.back();
		</script>
	<% 
	}else{
%>
<body>
<br><br><br><br><br><br><br><br><br><br>
<table>
	<tr>
		<td>no</td>
		<td>제목</td>
		<td>작성날짜</td>
	</tr>
<% 	
	if( list != null){
		for(int i = list.size()-1; i > -1 ; i--){
			QNADTO article = (QNADTO)list.get(i);
			%>
		<tr>
	<form action = "myContentsForm.jsp">		
			<td><%=number-- %></td>
			<td>	
				<a href="myContentsForm.jsp?num=<%=article.getNum()%>"><%=article.getSubject() %></a>
				<%-- <input type="hidden" name = "num" value = "<%=article.getNum()%>"> --%>
			</td>
	</form>			
			
			
			<td><%=article.getReg() %></td>
			
		</tr>
		<%}%>
		<tr>
			<td colspan = "3">
			<input type="button" value = "메인페이지이동" onclick="window.location.href='main.jsp'"> 
			<input type
			="button" value = "로그아웃" onclick="window.location.href='logout.jsp'">
			</td>
		</tr>
	</table>
	</body>
	<%}else{ %>
	<script>alert("작성된 글이 없습니다.");history.back();</script>
	<%}
	}%>
	</html>