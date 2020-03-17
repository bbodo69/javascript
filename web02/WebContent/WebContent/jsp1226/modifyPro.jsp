<%@page import="web.jsp1226.board.BoardDTO"%>
<%@page import="web.jsp1226.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href = "style.css" rel = "stylesheet" type = "text/css">
</head>
<body>
<%	
	request.setCharacterEncoding("UTF-8"); // post 방식 인코딩 처리 한글깨짐 방지
%>
<jsp:useBean id="article" class="web.jsp1226.board.BoardDTO" />
<jsp:setProperty property="*" name="article"/>
	
<%
	// 페이지 번호 받기
	String pageNum = request.getParameter("pageNum");

	// DB에 updateArticle() 로 작성 내용 수정하기
	BoardDAO dao = new BoardDAO();
	int result = dao.updateArticle(article);
	
	// 내용 업데이트 결과(result)에 다른 페이지 처리
	if(result == 1){ 	// 업데이트 정상 완료
		String url = "list.jsp?pageNum="+pageNum;
	// content.jsp?num=" +arto article.getNum()+"&pageNum="=pageNum;
		response.sendRedirect(url);
	}else{ %>
	<script>
	
	 alert("비밀번호가 맞지 않습니다. 다시시도해 주세요.")
	</script>
<%}%>	


</body>
</html>