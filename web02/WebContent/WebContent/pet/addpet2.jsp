<%@page import="web.pet.model.QNADAO"%>
<%@page import="web.pet.model.QNADTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>


<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("sId");
	
	Cookie [] cs = request.getCookies();
	if(cs != null && session.getAttribute("sId") == null){
		for(Cookie coo : cs){
			if(coo.getName().equals("cId")) id = coo.getValue();
		}session.setAttribute("sId", id);
	}
	
	if(id == null){
		%>
		<script>alert("로그인이 필요한 서비스");history.back();</script>
		<%
	}
	
	QNADAO dao = null;
	List petList = null;
%>
<body>
	<header>
		<jsp:include page="petHeader.jsp" flush="false"/>
	</header>
	<div id="wrapper">
		<aside class="aside">
			<jsp:include page="mypageAside.jsp" flush="false"/>
		</aside>
		<section class="section">
		<div style="position: relative; left: -50px; top: -50px;">

			<br/>
			<br/>
			<h2>나의 애견 정보</h2>
	<form action="addpet.jsp" method="post">		
	<table border="1" witdh = "1000">
	<br>
	<br>
		<tr>
			<td><input type="submit" value="검색"> </td>			
			<td colspan = "3">
				<select name = "category">
				<option style='background:black' value ="name" >이름</option>
				<option style='background:black' value ="kind" >종류</option>
				<option style='background:black' value ="age" >나이</option>
				</select>
				<input type="text" name="keyword">				
			</td>			
		</tr>
			<%	
				String category = request.getParameter("category");
				String keyword = request.getParameter("keyword");
				dao = new QNADAO(); 				
				if(category == null){
					petList = dao.myPetList(id);
				}
				else if(category.equals("name")){					
					petList = dao.myPetListName(id, keyword);
				}
				else if(category.equals("kind")){
					petList = dao.myPetListKind(id, keyword);
				}
				else{
					petList = dao.myPetListAge(id, keyword);
				}
					for(int i = 0 ; i < petList.size() ; i ++){
					QNADTO dto = (QNADTO)petList.get(i);
					
					%>
				<tr>
					<td width="150">이름</td>
					<td width="250"><%= dto.getName()%></td>
					<td rowspan = "3" width="600"><img src = "/web/save/<%=dto.getImg()%>" width="60"/></td>
					<td rowspan = "3"><input type="button" value="삭제" name=delete onclick="window.location.href='addPetDelete.jsp?hidden1=<%= i%>'">
									  <input type="hidden" value="<%= i %>" name = "hidden1">
									  									 
					</td>					
				</tr>
				<tr>
					<td>종류</td>
					<td><%= dto.getKind()%></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><%= dto.getAge()%></td>
				</tr>
				<%} %>
		<tr>
			<td colspan = "4">
				<input type="button" value="메인페이지 이동" onclick="window.location.href='main.jsp'">
				<input type="button" value="펫 추가" onclick="window.location.href='addPetForm.jsp'">							
			</td>
		</tr>	
	</table>
	</form>
	</div>
	</section>
</body>	
	
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/>
	</div>
	<footer>
		<jsp:include page="petFooter.jsp" flush="false"/>
	</footer>
</html>