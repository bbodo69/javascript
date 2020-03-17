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
	int count = 0;
	
	/////////////////////////////////////////////////////////////////////////////////////페이징 처리
	if(!session.getAttribute("sId").equals("admin")){
		dao = new QNADAO();
		count = dao.countMyPetList(id);
		
	}else{
		dao = new QNADAO();
		count = dao.countMyPetListAll();
	}
	
	
	int pageNum = 1;	
	int contentsSize = 3;
	double currentPage = 0;
	currentPage = (double)count/contentsSize;
	
	if(request.getParameter("pageNum")!=null){pageNum = Integer.parseInt(request.getParameter("pageNum"));}	
	System.out.println("pageNum="+pageNum);
	int startNum = count - (pageNum-1)*contentsSize; 
	int endNum = count - (pageNum-1)*contentsSize - contentsSize + 1 ;
	if(endNum<0){}
	if(startNum == 0 && endNum ==0){
		
		startNum = count;
		endNum = count - contentsSize+1;
	}
	System.out.println("startNum="+startNum);
	System.out.println("endNum="+endNum);
	System.out.println("contentSize="+contentsSize);	
		
/////////////////////////////////////////////////////////////////////////////////////페이징 처리							  
	
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
			<br/>
			<br/>
			<h2>나의 애견 정보</h2>
			
			
<% if(!session.getAttribute("sId").equals("admin")){%>			
	<form action="addpet.jsp" method="post">		
	<table>
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
				if(category == null){System.out.println("11111111111");
					petList = dao.myPetList(id, startNum, endNum, contentsSize);
				}
				else if(category.equals("name")){					
					petList = dao.myPetListName(id, keyword, startNum, endNum, contentsSize);
				}
				else if(category.equals("kind")){
					petList = dao.myPetListKind(id, keyword, startNum, endNum, contentsSize);
				}
				else{
					petList = dao.myPetListAge(id, keyword, startNum, endNum, contentsSize);
				}
					for(int i = 0 ; i < petList.size() ; i ++){
					System.out.println(petList.size()+"=petListSize");
					QNADTO dto = (QNADTO)petList.get(i);
					
					%>
				<tr>
					<td>이름</td>
					<td><%= dto.getName()%></td>
					<td rowspan = "3"><img src = "/web/save/<%=dto.getImg()%>" width="60"/></td>
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
		<tr><td colspan = "6"><%for(int i = 1 ; i < (int)Math.ceil(currentPage)+1 ; i++){ %>
			<a href="addpet.jsp?pageNum=<%=i%>"><%= i%></a>
						  <% } %></td></tr>
	</table>
	</form>
	</table>
	</form>
	
	
	<%}else{%>
	
	
	<form action="addpet.jsp" method="post">		
	<table>
	<br>
	<br>
		<tr>
			<td><input type="submit" value="검색"> </td>			
			<td colspan = "3">
				<select name = "category">
				<option style='background:black' value ="id" >작성자</option>
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
					petList = dao.myPetListAll(startNum, endNum, contentsSize);
				}
				else if(category.equals("id")){	
					System.out.println("id");
					petList = dao.myPetListIdAdmin(keyword, startNum, endNum, contentsSize);
				}
				else if(category.equals("name")){					
					petList = dao.myPetListNameAdmin(keyword, startNum, endNum, contentsSize);
				}
				else if(category.equals("kind")){
					petList = dao.myPetListKindAdmin(keyword, startNum, endNum, contentsSize);
				}
				else{
					petList = dao.myPetListAgeAdmin(keyword);
				}
					for(int i = 0 ; i < petList.size() ; i ++){
					QNADTO dto = (QNADTO)petList.get(i);
					
					%>
				<tr>
					<td>작성자</td>
					<td><%= dto.getId() %></td>
					<td rowspan = "4"><img src = "/web/save/<%=dto.getImg()%>" width="60"/></td>
					<td rowspan = "4"><input type="button" value="삭제" name=delete onclick="window.location.href='addPetDelete.jsp?hidden1=<%= i%>'">
									  <input type="hidden" value="<%= i %>" name = "hidden1">
									  									 
					</td>					
				</tr>
				<tr>
					<td>이름</td>
					<td><%= dto.getName()%></td>
					
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
		<tr><td colspan = "6"><%for(int i = 1 ; i < (int)Math.ceil(currentPage)+1 ; i++){ %>
			<a href="addpet.jsp?pageNum=<%=i%>"><%= i%></a>
						  <% } %></td></tr>
				  
	</table>
	</form>
	
	<%} %>
		

	
	
</body>	
	</section>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/>
</div>
	<footer>
		<jsp:include page="petFooter.jsp" flush="false"/>
	</footer>
</html>