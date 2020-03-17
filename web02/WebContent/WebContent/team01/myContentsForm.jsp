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
	String id = (String)session.getAttribute("sId");
	if(id == null){
		Cookie [] cs = request.getCookies();
		if(cs != null){
			for(Cookie coo : cs){
				if(coo.getName().equals("cId")) id = coo.getValue();
			}session.setAttribute("sId", id);
		}
	}

	
	if(id == null){
	
		%>
		<script>
		alert('로그인이 필요한 서비스');history.back();
		</script>
	<% 
	}else{
		
	int num = Integer.parseInt(request.getParameter("num"));
	QNADAO dao = new QNADAO();	
	List list = dao.getMyContents(id, num);
	int number = dao.countMyContents(id);	

	QNADTO dto = null;
	
	for(int i = 0 ; i < list.size() ; i ++){
		dto = (QNADTO) list.get(i);	
	}				
%>

<body>
<br><br><br><br><br><br><br><br><br><br>
<table>
	<tr>
		<td>제목</td>
		<td><%=dto.getSubject() %></td>
		<td>생성날짜</td>
		<td><%=dto.getReg() %></td>
	</tr>
<form action="myContentsPro.jsp" method="post">
	<tr>
		<td>내용</td>
		<td colspan = "3"><textarea name = "text" cols="100" rows="20"><%=dto.getContent() %></textarea></td>
	</tr>
	
	<tr>
		<td colspan = "4">
			<input type = "button" onclick="window.location.href='myContentsList.jsp'" value="목록">
			<input type = "submit" value = "수정">
			<input type = "hidden" value = "<%=dto.getNum() %>" name = "num"><%System.out.println(); %>
			
</form>			
	</tr>
	
	
</table>
<%} %>


</body>
</html>