<%@page import="yr.yrDTO"%>
<%@page import="java.util.List"%>
<%@page import="yr.yrDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("sId");
	String latitude = request.getParameter("latitude");
	String longitude = request.getParameter("longitude");

	String check = request.getParameter("check");
	if(check == null){

%>
		<body>
		<%
			String a = request.getParameter("ref");			
			yrDAO dao = new yrDAO();
			List list = dao.roomList();	
			yrDTO dto = null;
			int no = 0;
			
		%>
		
		<table>
			<tr>
				<td>no</td><td>방장</td><td>방제목</td>
			</tr>
			<%
			for(int i = list.size()-1 ; i > -1  ; i --){
				dto = (yrDTO)list.get(i);
				no = i+1;
			
			%>
			<tr><td><%= no %></td><td><%= dto.getId() %></td><td><a onclick="window.location.href='roomPro.jsp?ref=<%=dto.getRef()%>'"><%=dto.getSubject() %></a></td></tr>
			<%} %>
			<form method="post" action="createRoomPro.jsp">
				<tr>
					<td>
						<input type="text" name="subject" placeholder="방제목입력">
						<input type="password" name="roomPw"  placeholder="비밀번호" >
						<input type="hidden" value="<%=latitude %>" name="latitude">
						<input type="hidden" value="<%=longitude %>" name="longitude">
			
						<input type="submit" value="방만들기">		
					</td>
				</tr>
			</form>
		</table>
		</body>
<%}else{
	String ref = request.getParameter("ref");
	
	yrDAO dao = new yrDAO();
//	dao.joinRoom();
	
	
%>	
	
	
	
	
<%}%>
</html>