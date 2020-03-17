<%@page import="web.jsp1227.board.testDTO"%>
<%@page import="web.jsp1227.board.BoardDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href = "style.css" rel = "stylesheet" type = "text/css">
</head>
<jsp:useBean id="test" class="web.jsp1227.board.testDTO" />
<%
BoardDAO dao = new BoardDAO();	
int count = dao.getArticleCount();
int number = count;
%>

<body>
	<table>
			<tr>
				<td colspan = "6" align = "right">
					<button onclick = "window.location.href = 'writeForm.jsp'">글쓰기</button>
				</td>
			</tr>
			<tr>
				<td>no.</td>
				<td>BehindNo.</td>
				<td>작성자</td>
			</tr>
			
<%			
						
			
	List articles = null;
	articles = dao.articles(count);		

			for(int i = 0 ; i<articles.size() ; i++){
				testDTO article = (testDTO)articles.get(i);
			


			%><tr>
				<td><%= number-- %>
				<td><%=article.getNum() %></td>
				<td><%=article.getWriter() %></td>
			</tr>
			<%
}%>			
	</table>
</body>
</html>