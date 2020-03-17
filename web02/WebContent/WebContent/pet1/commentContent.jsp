<%@page import="web.petDAO.model.PetsitterDTO"%>
<%@page import="web.petDAO.model.PetsitterDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="web.petDAO.model.CommentbDTO"%>
<%@page import="web.petDAO.model.CommentbDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기보기</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%
	
	String sId = (String)session.getAttribute("sId");

	String cId = null;
	Cookie[] coo = request.getCookies();
	if(coo != null){
		for(int i = 0; i < coo.length; i++){
			if(coo[i].getName().equals("cId")) cId = coo[i].getValue();
		}
	}
	if(sId == null && cId != null){ 
		session.setAttribute("sId", cId);
		sId = cId;
	}
	
	String pageNum = request.getParameter("pageNum");
	int num = 0;
	if(request.getParameter("num") == null) {%>
		<script>
		alert("접근오류.");
		window.location.href="main.jsp";
		</script>
	<%}else{%>
	
<body>
	<header>
		<jsp:include page="petHeader.jsp" flush="false"/>
	</header>
	<section>
<% 		num = Integer.parseInt(request.getParameter("num"));		
		 //답글인 경우와 아닌경우로 나눌 때,
		
		CommentbDAO dao = new CommentbDAO();
		CommentbDTO comment = dao.getContent(num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	
		
		if(comment.getRe_step() != 0) { //답글%>

		<%-- 답글로직 --%>
		<h1>펫시터 이용후기 답글</h1>			
		<br/>
		<br/>
			<table>
				<tr>
					<td colspan="2"><h2><%=comment.getSubject() %></h2></td>			
				</tr>
				<tr>
					<td >펫시터 : <%=comment.getName() %> &nbsp; 작성일 : <%= sdf.format(comment.getReg())%></td>
				</tr>
				<tr>
					<td>내용
					<table>
						<tr>
							<td width="400" height="200">
								<%if(comment.getImg() != null){%>
									<img src="/web/save/<%=comment.getImg() %>" width="400" /><br/>
								<% }%>
								<%=comment.getContent() %>
							</td>
						</tr>
					</table>
					</td>
				</tr>			
				<%				
					if(sId != null && sId.equals(comment.getId())){%>
				<tr>
					<td>
						<button onclick="window.location.href='recommentModifyForm.jsp?num=<%=comment.getNum()%>&pageNum=<%=pageNum%>'">수정하기</button>
						<button onclick="window.location.href='recommentDeleteForm.jsp?num=<%=comment.getNum()%>'">삭제하기</button>
					</td>
				</tr>
					<%}	%>
		</table>	
			
		<%}else{ //일반글
			
			String[] date = comment.getPetdate().split(" ");%>
		<%-- 후기글 로직--%>
		<h1>펫시터 이용후기</h1>
		<br/>
		<br/>
		<table>
			<tr>
				<td>작성자 : <%= comment.getId() %> &nbsp; 작성일 : <%= sdf.format(comment.getReg())%></td>
			</tr>
			<tr>
				<td><h2><%=comment.getSubject() %></h2></td>
			</tr>
			<tr>
				<td>이용 날짜 : <%=date[0] %> &nbsp; <%=comment.getPetday() %></td>
			</tr>
			<tr>
				<td>지역 : <%=comment.getArea() %> &nbsp; 펫시터 : <%=comment.getName() %> &nbsp; 만족도 : <%=comment.getPoint() %></td>
			</tr>
			<tr>
				<td>후기
					<table>
						<tr>
							<td width="400" height="200">
								<%if(comment.getImg() != null){ %>
									<img src="/web/save/<%=comment.getImg() %>" width="400" /><br/>
								<%} %>
								<%=comment.getContent() %>
							</td>
						</tr>
					</table>		
				</td>
			</tr>
				<%
				PetsitterDAO sitterDAO = new PetsitterDAO();
				PetsitterDTO sitter = sitterDAO.getPetsitter(sId);
				if(sitter !=null && sitter.getName().equals(comment.getName()) ){ //펫시터 본인일 경우 %>
			<tr>
				<td>
					<button onclick="window.location.href='recommentWriteForm.jsp?num=<%=comment.getNum()%>&pageNum=<%=pageNum%>&ref=<%=comment.getRef() %>&re_step=<%=comment.getRe_step() %>'">답글쓰기</button>
				</td>
			</tr>	
				<%} %>	
				<%	if(sId != null && sId.equals(comment.getId())){ //작성자 본인일 경우%>
			<tr>
				<td>
					<button onclick="window.location.href='commentModifyForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">수정하기</button>
					<button onclick="window.location.href='commentDeleteForm.jsp?num=<%=comment.getNum()%>'">삭제하기</button>
				</td>
			</tr>
					<%}	%>
		</table>
		<%}	%>	

		<div align="center">
			<br/>
		<%	//이전글 다음글 표기
			int count = 0;
		
			if(request.getParameter("count") != null){
				count = Integer.parseInt(request.getParameter("count"));
				int realCount = dao.getCommentCount();
			
				if(count == realCount){
					int nextNum = dao.nextnum(num, count);
					if(nextNum > 0){
						%>
					<button onclick="window.location.href='commentContent.jsp?num=<%=nextNum %>&pageNum=<%=pageNum%>&count=<%=count%>'">다음글</button>			
					<%}%>
					<button onclick="window.location.href='commentList.jsp?pageNum=<%=pageNum%>'">리스트보기</button>
				  <%int pastNum = dao.pastnum(num, count);
					if(pastNum > 0){%>
					<button onclick="window.location.href='commentContent.jsp?num=<%=pastNum %>&pageNum=<%=pageNum%>&count=<%=count%>'">이전글</button>			
					<%}		
				}else {%>
					<button onclick="window.location.href='commentList.jsp?pageNum=<%=pageNum%>'">리스트보기</button>		 
			<% }
			}else{%>
			<button onclick="window.location.href='commentList.jsp?pageNum=<%=pageNum%>'">리스트보기</button>
			<%} %>
		</div>
<%	} %>
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
</html>