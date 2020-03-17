<%@page import="web.petDAO.model.QNADTO"%>
<%@page import="web.petDAO.model.QNADAO"%>
<%@page import="web.petDAO.model.CommentbDTO"%>
<%@page import="web.petDAO.model.CommentbDAO"%>
<%@page import="web.petDAO.model.TradeDTO"%>
<%@page import="web.petDAO.model.TradeDAO"%>
<%@page import="java.util.Date"%>
<%@page import="web.petDAO.model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="web.petDAO.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="xPetMain.css" rel="stylesheet" type="text/css" />
<style>

	table {
    width: 720px;
    height: 10px;
    border-collapse: separate;    
 	}
  	th, td {
    border-bottom: 1px solid #444444;
    border-color: #aaaaaa;
    padding: 0px;    
  	}
  	
  	.cell_padding {

	padding : -10px;	 
	}

	#superMain { margin:0 auto; width: 700; height: 700px; }



	#main{ font-family: 'Nanum Pen Script', cursive; text-align: center; width:100%; 
		 margin:0 auto; height:200px; 
	}
	#mainSub {  font-size: 50px; display: inline-block; background-color: #f7dfdf; height:35px; padding:0; margin-top:0; margin-bottom: 0;
		border-radius: 40px; color:#e04a2a;
	} 
	#mainSub_b {  font-size: 35px; display: inline-block; padding:0; margin-top:1; margin-bottom: 0; color: #485a74;}
	#mainText { font-size: 25px; color: black;}

	
	.board{ display: inline-block;}
	.boardList { font-family: 'Nanum Pen Script', cursive; font-size: 23px; color:#655f86; 
		margin:0; margin-bottom: 10px; display: inline-block; height: 15px; background-color: whi; border-radius: 6px;
	}
	.arrow { margin:0; padding : 0;}
	img { border-radius: 3px; }
	
	
	#sitter { font-family: 'Nanum Pen Script', cursive; text-align: center; border : 2px solid #cfcfe1; width:70%;
		border-radius: 10px; margin:0 auto;	background-color: #f0f0fc;
	}
	#sitterSub { font-size: 30px; font-weight: bolder; color: #312838;}
	#sitterText { font-size: 25px; color:#655f86; }
	#a:link { text-decoration:none; color:#fb4c4c; }
	#a:visited { text-decoration:none; color:#fb4c4c;}
</style>
</head>
<%
	//세션 쿠키 검사 완료.
	String sId = (String)session.getAttribute("sId");
	String cId = null;
	Cookie[] coo = request.getCookies();
	if(coo != null){
		for(int i = 0; i < coo.length; i++){
			if(coo[i].getName().equals("cId")) cId = coo[i].getValue();
		}
	}
	if(sId == null && cId != null) response.sendRedirect("loginPro.jsp");
	
%>
<body>
	<header>
		<jsp:include page="petHeader.jsp" flush="false"/>
	</header>
	<section>
		<br/>
		<br/>
		<br/>
		<div id="superMain" align="center">
		<div style="width:13%;float:left;">
			<table >
				<tr>
					<td colspan="3" class="cell_padding" align=left bgcolor=#fff3dc><h2>애견 용품 거래</h2></td>
				</tr>
				<%TradeDAO dao1 = new TradeDAO();				  
				  List list1 = dao1.getArticles(1, 5);
				  TradeDTO dto1 = new TradeDTO();
				  for(int i = 0 ; i < list1.size() ; i++){
					  dto1 = (TradeDTO)list1.get(i);  
					  Date time = new Date();
					  int currentDay = time.getDay(); int currentHour = time.getHours(); int currentMinute = time.getMinutes();
					  int regDay = dto1.getTime().getDay(); int regHour = dto1.getTime().getHours(); int regMinute = dto1.getTime().getMinutes();
					  int beforeTime = (currentDay-regDay)*60*24+(currentHour-regHour)*60+(currentMinute-regMinute);
				%>				
					<tr>
						<td width = 220 align=left><%=dto1.getId() %></td><td width = 400 align=left><%=dto1.getSubject() %></td><td width = 100 align=left><%=beforeTime%>분 전</td>
					</tr>
				<%} %>
				</table>
			</div>
			<div style="width:13%;float:right; ">	
			<table >
				<tr>
					<td colspan="3" class="cell_padding" align=left bgcolor=#fff3dc><h2>펫 시터 이용 후기</h2></td>
				</tr>
				<%CommentbDAO dao2 = new CommentbDAO();				  
				  List list2 = dao2.getConmmentList(1, 5);
				  CommentbDTO dto2 = new CommentbDTO();
				  for(int i = 0 ; i < list2.size() ; i++){
					  dto2 = (CommentbDTO)list2.get(i);  
					  Date time = new Date();
					  int currentDay = time.getDay(); int currentHour = time.getHours(); int currentMinute = time.getMinutes();
					  int regDay = dto2.getReg().getDay(); int regHour = dto2.getReg().getHours(); int regMinute = dto2.getReg().getMinutes();
					  int beforeTime = (currentDay-regDay)*60*24+(currentHour-regHour)*60+(currentMinute-regMinute);
				%>				
					<tr>
						<td width = 220 align=left><%=dto2.getId() %></td><td width = 400 align=left><%=dto2.getSubject() %></td><td width = 100 align=left><%=beforeTime%>분 전</td>
					</tr>
				<%} %>
				</table>
				</div>
			<div style="width:13%;float:left;">
			<table >
				<tr>
					<td colspan="3" class="cell_padding" align=left bgcolor=#fff3dc><h2>커뮤니티</h2></td>
				</tr>
				<%BoardDAO dao = new BoardDAO();				  
				  List list = dao.getArticles(1, 5);
				  BoardDTO dto = new BoardDTO();
				  for(int i = 0 ; i < list.size() ; i++){
					  dto = (BoardDTO)list.get(i);  
					  Date time = new Date();
					  int currentDay = time.getDay(); int currentHour = time.getHours(); int currentMinute = time.getMinutes();
					  int regDay = dto.getReg().getDay(); int regHour = dto.getReg().getHours(); int regMinute = dto.getReg().getMinutes();
					  int beforeTime = (currentDay-regDay)*60*24+(currentHour-regHour)*60+(currentMinute-regMinute);
				%>				
					<tr>
						<td width = 220 align=left><%=dto.getId() %></td><td width = 400 align=left><%=dto.getSubject() %></td><td width = 100 align=left><%=beforeTime%>분 전</td>
					</tr>
				<%} %>
				</table>
				</div>
			<div style="width:13%;float:right;">	
			<table >
				<tr>
					<td colspan="3" class="cell_padding" align=left bgcolor=#fff3dc><h2>QNA</h2></td>
				</tr>
				<%QNADAO dao3 = new QNADAO();				  
				  List list3 = dao3.getQNA(5, 1, 5);
				  QNADTO dto3 = new QNADTO();
				  for(int i = 0 ; i < list3.size() ; i++){
					  dto3 = (QNADTO)list3.get(i);  
				%>				
					<tr>
						<td width = 220 align=left><%=dto3.getId() %></td><td width = 400 align=left><%=dto3.getContent() %></td>
					</tr>
				<%} %>
				</table>
			</div>
		</div> 

		<br/>
		<br/>
		<br/>
	</section>
	<footer>
		<jsp:include page="petFooter.jsp" flush="false"/>
	</footer>

</body>
</html>