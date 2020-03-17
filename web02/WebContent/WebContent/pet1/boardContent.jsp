<%@page import="web.petDAO.model.BoardDTO"%>
<%@page import="web.petDAO.model.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href = "style.css" rel = "stylesheet" type = "text/css">
</head>
<script>

</script>
<%
	String sId = (String)session.getAttribute("sId");
	String cId = null;
	Cookie[] coo = request.getCookies();
	if(coo != null){
		for(int i = 0; i < coo.length; i++){
			if(coo[i].getName().equals(cId)) cId = coo[i].getValue();
		}
	}
	if(sId == null && cId != null){
		session.setAttribute("sId", cId);
		sId = cId;
	}
	
	if(request.getParameter("num") == null){
		System.out.println("1");%>
		<script>
			alert("잘못된 접근입니다.");
			window.location.href="/web/jspProject/pet/main.jsp";
		</script>
	<%}else{
	int num = Integer.parseInt(request.getParameter("num"));
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
	
	BoardDAO dao = new BoardDAO();
	BoardDTO article = dao.getArticle(num);
	
%>
<body>
 	<header>
		<jsp:include page="petHeader.jsp" flush="false"/>
	</header>
	<section>
		<h1><%=article.getId() %>님의 게시물</h1>
		<table>
		<tr	width = "300">
			<td colspan = "2">
				글쓴이
			</td>
			<td colspan = "2">
				<%=article.getId()%>
			</td>
		</tr>
		<tr>
			<td>
				제목
			</td>
			<td>
				<%=article.getSubject() %>
			</td>
			<td>조회수</td>
			<td><%=article.getReadcount() %></td>
		</tr>
		<tr>
			<td colspan = "4">
				<img src = /web/save/<%=article.getPhoto() %>><br/>
				<textarea rows = "15" cols = "60" readonly ><%=article.getContent()%></textarea>
			</td>
		</tr>
		<tr>
			<td colspan = "4">
			<button onclick = "window.location = 'boardList.jsp'">리스트가기</button>
			<button onclick = "window.location = 'boardModifyForm.jsp?num=<%=article.getNum() %>'">수   정</button>
			<button onclick = "window.location = 'boardDeleteForm.jsp?num=<%=article.getNum() %>'">삭   제</button>
			</td>
		</tr> 
		</table>
			<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
	</section>
	<footer>
		<jsp:include page="petFooter.jsp" flush="false"/>
	</footer>
</body>
<% } %>
</html>