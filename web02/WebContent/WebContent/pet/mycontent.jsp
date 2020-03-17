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
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
		
<%		
	String str = null;
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
	QNADAO dao = new QNADAO();
	
/////////////////////////////////////////////////////////////////////////////////////페이징 처리
	int count = 0;
	
	if(!session.getAttribute("sId").equals("admin")){
		dao = new QNADAO();
		count = dao.countMyContents(id);
	
	}else{
		dao = new QNADAO();
		count = dao.countMyContentsAdmin();
	}
	
	
	int pageNum = 1;	
	int contentsSize = 3;
	double currentPage = 0;
	currentPage = (double)count/contentsSize;	
	if(request.getParameter("pageNum")!=null){pageNum = Integer.parseInt(request.getParameter("pageNum"));}		
	int startNum = count - (pageNum-1)*contentsSize; 
	int endNum = count - (pageNum-1)*contentsSize - contentsSize + 1 ;
	if(endNum<0){}
	if(startNum == 0 && endNum ==0){
	
		startNum = count;
		endNum = count - contentsSize+1;
	}
	System.out.println("pageNum="+pageNum);
	System.out.println("startNum="+startNum);
	System.out.println("endNum="+endNum);
	System.out.println("contentSize="+contentsSize);	

/////////////////////////////////////////////////////////////////////////////////////페이징 처리		

	
	List list = null;
	int number = 0;
	
	
	if(!session.getAttribute("sId").equals("admin")){
		list = dao.getMyContents(id, startNum, endNum, contentsSize);
		number = dao.countMyContents(id, startNum, endNum, contentsSize);
	}else{
		list = dao.getMyContentsAdmin(startNum, endNum, contentsSize);
		number = dao.countMyContentsAdmin(startNum, endNum, contentsSize);
	}
	
	
	String abc = null;
	if(id == null){
	
		%> 
		<script>
		alert('로그인이 필요한 서비스');history.back();
		</script>
	<% 
	}else{
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
		<h2>내가 쓴 글</h2>
		
		
<table>
<br>
<br>
	<tr>
		<td>no</td>
		<%if(session.getAttribute("sId").equals("admin")){ %>
		<td>작성자</td>
		<%} %>
		<td>제목</td>
		<td>내용</td>
		<td>작성날짜</td>
	</tr>

<% 		if( list != null){
			for(int i = list.size()-1; i > -1 ; i--){
				QNADTO article = (QNADTO)list.get(i);
				
				if(article.getContent().length()>10){str = article.getContent().substring(0, 10)+"...";}else{str = article.getContent();}
				%>
			<tr>
		<form action = "myContentsForm.jsp">		
				<td><%=number-- %></td>
				<%if(session.getAttribute("sId").equals("admin")){ %>
				<td><%=article.getId() %></td>
				<%} %>
				<td>	
					<%=article.getSubject() %></a>
					<%-- <input type="hidden" name = "num" value = "<%=article.getNum()%>"> --%>
				</td>
				<td><a href="myContentsForm.jsp?num=<%=article.getNum()%>&id=<%=article.getId()%>"><%= str %></td>
		</form>				
				<td><%=article.getReg()%></td>	
			</tr>
			<%}%>
			<tr>
				<%if(!session.getAttribute("sId").equals("admin")){ %>
				<td colspan = "4">
				<input type="button" value = "메인페이지이동" onclick="window.location.href='main.jsp'"> 
				<input type
				="button" value = "로그아웃" onclick="window.location.href='logout.jsp'">
				</td>
				<%}else{ %>
				<td colspan = "5">
				<input type="button" value = "메인페이지이동" onclick="window.location.href='main.jsp'"> 
				<input type
				="button" value = "로그아웃" onclick="window.location.href='logout.jsp'">
				</td>				
				<%} %>
			</tr>
			<tr><td colspan = "6"><%for(int i = 1 ; i < (int)Math.ceil(currentPage)+1 ; i++){ %>
			<a href="mycontent.jsp?pageNum=<%=i%>"><%= i%></a>
						  <% } %></td></tr>
	
		</table>	
				<%}else{ %>
		<script>alert("작성된 글이 없습니다.");location.href="main.jsp";</script>
		<%}


		}%>
	
		</section>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/>
	</div>	
	<footer>
		<jsp:include page="petFooter.jsp" flush="false"/>
	</footer>
	</body>
	
	

			
	</html>