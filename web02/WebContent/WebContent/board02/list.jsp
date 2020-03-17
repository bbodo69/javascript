<%@page import="java.util.List"%>
<%@page import="web.jsp0102.board.BoardDAO"%>
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
	// 게시글 갯수
	BoardDAO dao = new BoardDAO();
	List list = dao.getArticles();

	int count = dao.getArticleCount();
	String id = null;
	String subject = null;
	String email = null;
	String ip = null;
	String reg = null;
	
	
%>
<body>
<form action="insertContentForm.jsp" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>작성자</td>
			<td>제목</td>
			<td>이메일</td>
			<td>ip</td>
			<td>작성시간</td>
		</tr>
		<tr>
		</tr>
		<tr>
			<td colspan="6">
			<input type="submit" value="글쓰기">
			<input type="button" onclick="window.location.href='list.jsp'" value="미정">
			<input type="button" onclick="window.location.href='list.jsp'" value="미정">
			</td>
		</tr>
	</table>
</form>	
</body>
</html>