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
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%		

	request.setCharacterEncoding("UTF-8");

	String id = null;
	if(!session.getAttribute("sId").equals("admin")){
		id = (String)session.getAttribute("sId");
	}else{
		id = request.getParameter("id");
		System.out.println(request.getAttribute("id"));
	}
	System.out.println(id+" //  id = null ??");
	
	if(id == null){
		Cookie [] cs = request.getCookies();
		if(cs != null){
			for(Cookie coo : cs){
				if(coo.getName().equals("cId")) id = coo.getValue();
			}session.setAttribute("sId", id);
		}
	}

	
	if(id == null){
	System.out.println("id== null??");
		%>
		<script>
		alert('로그인이 필요한 서비스');history.back();
		</script>
	<% 
	}else{
		
	int num = Integer.parseInt(request.getParameter("num"));
	QNADAO dao = new QNADAO();	
	List list = dao.getMyContents(id, num);
	int number = dao.countMyContents(id);	

	QNADTO dto = null;
	
	for(int i = 0 ; i < list.size() ; i ++){
		dto = (QNADTO) list.get(i);	
	}				
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
<br>
<br>
<h2>내가 쓴 글</h2>
<br>
<br>
<table>
	<tr>
		<td>제목</td>
		<td><%=dto.getSubject() %></td>
		<td>생성날짜</td>
		<td><%=dto.getReg() %></td>
	</tr>
<form action="myContentsPro.jsp" method="post">
	<tr>
		<td>내용</td>
		<td colspan = "3"><textarea name = "text" cols="100" rows="20"><%=dto.getContent() %></textarea></td>
	</tr>
	
	<tr>
		<td colspan = "4">
			<input type = "button" onclick="window.location.href='mycontent.jsp'" value="목록">
			<input type ="submit" value = "수정">
			<input type= "button" onclick="window.location.href='myContentsPro.jsp?delete=<%=dto.getNum() %>'" value="삭제" name="delete"> 
			<input type = "hidden" value = "<%=dto.getNum() %>" name = "num">
			
</form>			
	</tr>
	
	
</table>
<%} %>
	
		</section>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/><br/>
	</div>	
	<footer>
		<jsp:include page="petFooter.jsp" flush="false"/>
	</footer>

</body>
</html>