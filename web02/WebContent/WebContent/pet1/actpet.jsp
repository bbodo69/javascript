<%@page import="web.pet.model.CommentbDTO"%>
<%@page import="web.pet.model.CommentbDAO"%>
<%@page import="web.pet.model.PetsitterDAO"%>
<%@page import="web.pet.model.PetsitterDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>펫시터 활동내역</title>
	<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String id = (String)session.getAttribute("sId");
	PetsitterDAO dao = new PetsitterDAO();
	PetsitterDTO article = dao.getPetsitter(id);
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	System.out.println("pagenum " + pageNum);
	int currentPage = Integer.parseInt(pageNum);
	System.out.println("currentPage " + currentPage);
	
	int pagesize = 10;
	int startRow = (currentPage - 1) * pagesize + 1;
	int endRow = currentPage * pagesize;
	int count = 0;
	int number = 0;
	
	CommentbDAO dao1 = new CommentbDAO();
	String name = article.getName();
	System.out.println(name);
	count = dao1.sitterCommentCount(name);
	System.out.println(count);
	List articleList = null;
	articleList = dao1.getConmmentList1(startRow, endRow, name);
	
	number = count - (currentPage - 1) * pagesize;
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
			<br/><br/>
			<h1 align = "center">펫시터 활동 내역</h1>
			<br/><br/>
			<table width = "500" align = "center">
				<tr>
					<td  colspan = "1" rowspan = "5" width = "150">
					<img src = "/web/save/<%=article.getPhoto()%>" width = "150" />
					</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td colspan = "3">
						<%=session.getAttribute("sId") %>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td colspan = "3">
						<%=article.getName() %>
					</td>
				</tr>
				<tr>
					<td>지역</td>
					<td colspan = "3">
						<%=article.getArea() %>
					</td>
				</tr>
				<tr>
					<td>평점</td>
					<td colspan = "3">
					<%=String.format("%.1f", article.getAvgpoint()) %>
					</td>
				</tr>
			</table>
			<br/>
			<table>
				<tr>
					<td>No.</td>
					<td>제목</td>
					<td>글쓴이</td>
					<td>날짜</td>
					<td>조회수</td>
				</tr>
				<%
				if(count == 0){%> 
					<tr>
						<td colspan = "5" align = "center">
						작성된 글이 없습니다.
						
						</td>
				<%}else{
			 	CommentbDTO comment = null;
					for(int i = 0; i < articleList.size(); i++){
						comment = (CommentbDTO)articleList.get(i);
						//String[] petdate = comment.getPetdate().split(" ");
						%>
					<tr>
							<td><%= number-- %></td>
							<td width="350">
							<h2><a href="commentContent.jsp?num=<%=comment.getNum()%>&pageNum=<%=pageNum%>&count=<%=count%>"><%= comment.getSubject() %></a></h2>
							이용날짜 :  &nbsp; <%=comment.getPetday() %> <br/>
							지역 : <%=comment.getArea() %> &nbsp; 펫시터 : <%= comment.getName() %>님 &nbsp; 만족도 :<%= comment.getPoint() %> 점
							</td>
							<td><%= comment.getId() %></td>
							<td><%= sdf.format(comment.getReg()) %></td>
							<td><%= comment.getReadcount() %></td>
						</tr>
				
				
				<%}
				}%>
				
				
			</table>	
			<br/>
				<div align="center">
				
				<%
				System.out.println(currentPage+"hjjh");
				if(count > 0){
						int pagecount = (count / pagesize) + (count % pagesize == 0?0:1);
						int pageBlock = 5;
						int startpage = 0;
							if(currentPage % pageBlock == 0){
								startpage = (currentPage - 1 / pageBlock) * pageBlock + 1 ;
							}else{
								startpage = (currentPage / pageBlock) * pageBlock + 1;
							}
							
						int endpage = startpage + pageBlock - 1;//9
						if(endpage > pagecount) endpage = pagecount;
						
						System.out.println("-----------");
						System.out.println(startpage);
						System.out.println(endpage);
						
					if(startpage > pageBlock){%>
						<a href = "actpet.jsp?pageNum=<%=startpage - 1%>">&lt;</a>
					<%}
					for(int i = startpage; i <= endpage; i++){%>
						<a href = "actpet.jsp?pageNum=<%=i %>">&nbsp;<%=i %>&nbsp;</a>
					<%}
					if(endpage < pagecount){%>
						<a href = "actpet.jsp?pageNum=<%=endpage + 1%>">&gt;</a>
				<%
						}
					}	%>
				
				</div>
			<br/><br/><br/><br/><br/><br/><br/><br/>
			<br/><br/><br/><br/><br/><br/><br/><br/>
			<br/><br/><br/><br/>
		</section>
	</div>	
	<footer>
		<jsp:include page="petFooter.jsp" flush="false"/>
	</footer>		
</body>
</html>