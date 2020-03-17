<%@page import="web.jsp1226.board.BoardDTO"%>
<%@page import="web.jsp1226.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	// 넘어오는 파라미터들 담기
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String pw = request.getParameter("pw");
	
	// DB 접속해서 글 삭제
	BoardDAO dao = new BoardDAO();
	int result = dao.deleteArticle(num, pw);
	
	if(result == 1){	// 정상 삭제 처리 됨
		String uri = "list.jsp?pageNum="+pageNum;
		response.sendRedirect("list.jsp?pageNum="+pageNum);
	}else{ %>
		<script>
			alert("비밀번호가 맞지 않습니다. 다시 시도!!");
			history.go(-1);
		</script>
	<%}

%>
</body>
</html>