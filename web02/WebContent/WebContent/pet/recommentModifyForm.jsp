<%@page import="java.text.SimpleDateFormat"%>
<%@page import="web.pet.model.CommentbDTO"%>
<%@page import="web.pet.model.CommentbDAO"%>
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
	
	
	//쿠키세션검사 완료.
	//비로그인 시 경고창 -> loginFrom.jsp로 보내기
	
	String sId = (String)session.getAttribute("sId");
	String cId = null;
	Cookie[] coo = request.getCookies();
	if(coo != null){
		for(Cookie c : coo){
			if(c.getName().equals("cId")) cId = c.getValue();
		}		
	}

	
	String pageNum = "1";
	if(request.getParameter("pageNum") != null)	pageNum = request.getParameter("pageNum");
	int num = 0; 

	if(cId != null) {
		session.setAttribute("sId", cId);
		sId = cId;
	}
	
	if(sId == null){%>
		<script>
			alert("로그인 후 이용 가능한 페이지입니다.");
			window.location.href="loginForm.jsp";
		</script>
	<%}else if(request.getParameter("num") == null){%>
		<script>
			alert("접근오류.");
			window.location.href="main.jsp";
		</script>
		
		
		
		
	<%}else{
	
		num = Integer.parseInt(request.getParameter("num"));
		CommentbDAO dao = new CommentbDAO();
		CommentbDTO comment = dao.getComment(num);	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	
	%>	
	<body>
		<br/>
		<h1>수정하기</h1>		
		<form name="commentWrite" action="recommentModifyPro.jsp?num=<%=num %>&pageNum=<%=pageNum %>" method="post" encType="multipart/form-data">
		<input type="hidden" name="num" value="<%=num %>"/>
		<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
		<br/>
			<table>
				<tr>
					<td colspan="2">펫시터 : <%=comment.getName() %> &nbsp; 작성일 : <%= sdf.format(comment.getReg())%></td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="2"><h2><input type="text" name="subject" value="<%=comment.getSubject() %>"/></h2></td>			
				</tr>
				<tr>
					<td >내용 </td>
					<td>
					<input type="file" name="file" /><br/>
					<%if(comment.getImg() != null){%>
						<img src="/web/commentImg/<%=comment.getImg() %>" width="400" /><br/>
					<% }%>
					<textarea name="content" rows="8" cols="70">
					<%=comment.getContent() %></textarea>
					</td>
				</tr>			
				<tr>
				<td colspan="2">
				<%				
					if(sId != null && sId.equals(comment.getId())){%>
					<input type="submit" value="수정하기"/>
					<input type="button" value="삭제하기" onclick="window.location.href='recommentDeleteForm.jsp?num=<%=comment.getNum()%>'"/>
					<%}	%>
				</td>
			</tr>
		</table>
		</form>
	</body>

<%} %>
</html>