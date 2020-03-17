<%@page import="java.util.List"%>
<%@page import="team01.PetMemberDTO"%>
<%@page import="team01.PetMemberDAO"%>
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
	
	String id = null;

	Cookie [] cs = request.getCookies();
	if(cs != null && session.getAttribute("sId") == null){
		for(Cookie coo : cs){
			if(coo.getName().equals("cId")) id = coo.getValue();
		}session.setAttribute("sId", id);
	}

	request.setCharacterEncoding("UTF-8");
	
	PetMemberDAO dao = new PetMemberDAO();
	List list = dao.getQNA();			// DTO 에 게시글 담아주기
	PetMemberDTO dto = null;
	PetMemberDTO dto1 = null;
	
	int count = dao.getQNANum()+1;		// QNA 게시글 숫자
	int pageNum = 0;	
	int contentsSize = 3;
	int currentPage = count/contentsSize;
	

%>


<% if(list != null){ %>
<body>
<header>
      <jsp:include page="petHeader.jsp" flush="false"/>
   </header><section>
	<table>	
		<tr>
	<form action = "qnaPro.jsp" method="post">	
			<td colspan="4"><textarea cols="50" rows="10" name="content"></textarea></td>
			<td><input type="submit" value="글 작성"></td>
		</tr>
	</form>
		<%for(int i = list.size()-1 ; i > -1 ; i --){
			dto = (PetMemberDTO)list.get(i);
			dto.getRef();
			if(!dao.checkContent(dto.getRef())){				
				count--;
			%>
		<tr>			
			<td>글쓴이</td>
			<td><%= dto.getId()%></td>
			<td>작성 날짜/시간</td>
			<td><%= dto.getReg()%></td>
						
		</tr>
	<form action = "qnaReplePro.jsp" method="post">
		<tr>
			<td>글번호<br><%=count %></td>	
			<td>내용</td>
			<td colspan = "3"><%= dto.getContent()%><br>
			<textarea cols="35" rows="1" name="reple<%=dto.getRef()%>"></textarea><input type="submit" value="답글">				
			<tr>
				<td colspan="4"><p align="center">														
					<input type = "hidden" name="ref" value="<%=dto.getRef() %>">
	</form>												
	<form action = "qnaDelete.jsp" method="post">					
					<input type="text" name="pwCheck">
					<input type="submit" value="글 삭제">
					<input type="hidden" value="<%=dto.getRef()%>" name="ref">
					</p></td>
			</tr>	
	</form>			
			<%}else{count--; %>
			
			<tr>
				<td>글번호<br><%=count %></td>	
				<td>내용</td>
				<td colspan = "3"><%= dto.getContent()%></td>
			</tr>			
					<%} %>			
			
			<%
			if(dao.getCount(dto.getRef()) != 0){
				List getReple = dao.getReple(dto.getRef());							
				
				for(int j = getReple.size()-1 ; j > -1 ; j--){
					dto = (PetMemberDTO)getReple.get(j);
					if(!dao.checkContentReple(dto.getRefQNA(), dto.getRe_levelQNA())){
				%>
					<form action = "qnaDeleteReple.jsp" method="post">
	 	 			<tr>
						<td>댓글</td>															
						<td colspan = "2"><%= dto.getContentQNA() %></td>
						<td>							
								<input type="password" name="pwCheck">
								<input type="hidden" value="<%=dto.getRe_levelQNA() %>" name="re_level">
								<input type="hidden" value="<%=dto.getRefQNA() %>" name="ref">
								<input type="submit" value="댓 삭제">							
						</td>
					</tr>	
					</form>																													
				<%
					}else{%>
					<tr>
						<td>댓글</td>
						<td colspan = "3"><%= dto.getContentQNA() %></td>						
					</tr>									
					<%}
				}
			}
			%>	
		</tr>		
		<%} %>
		<tr>			
			<td colspan = "6">
				<input type="button" value="메인 페이지 이동" onclick="window.location.href='main.jsp'">				
			</td>			
		</tr>
		<tr><td colspan = "6"><%for(int i = 1 ; i < (int)Math.ceil(currentPage)+1 ; i++){ %><%=i %>  <%} %></td></tr>
	</table>
	</section>
  <footer>
      <jsp:include page="petFooter.jsp" flush="false"/>
   </footer>
</body>
<%}else{ %>
	<body>
	<header>
      <jsp:include page="petHeader.jsp" flush="false"/>
   </header><section>
	<form action="qnaPro.jsp" method="post">
		<table>	
			<tr>
				<td width = "10"><input type="file" name="img"></td>
				<td colspan="4"><textarea cols="50" rows="10" name="content"></textarea></td>
				<td><input type="submit" value="글 작성"></td>
			</tr>
		</table>
	</form>
	</section>
  <footer>
      <jsp:include page="petFooter.jsp" flush="false"/>
   </footer>
	</body>
<%} %>
</html>