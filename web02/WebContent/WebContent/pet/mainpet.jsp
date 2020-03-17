<%@page import="web.pet.model.PetsitterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>펫시터 메인페이지</title>
</head>
<%
	if(session.getAttribute("sId") == null){	%>
		<script>
			alert("잘못된 접근입니다!");
			window.location.href = "main.jsp";
		</script>
<%	}else{
		String id = (String)session.getAttribute("sId");
		PetsitterDAO dao = new PetsitterDAO();
		boolean check = dao.petsitCheck(id); %>

<body>
	<header>
		<jsp:include page="petHeader.jsp" flush="false"/>
	</header>
	<div id="wrapper">
		<aside class="aside">
			<jsp:include page="mypageAside.jsp" flush="false"/>
		</aside>
		<section class="section">

			<br /><br />
			<h2>펫시터 메인페이지</h2>
			<table>
				<br />
				<br />
				<br />
				<% if(check){	%>
				<tr>
					<td>
						<%= id %>님 환영합니다.	<br />
						<button onclick = "window.location.href = 'infopet.jsp'" >내 펫시터 정보보기</button>
						<button onclick = "window.location.href = 'actpet.jsp'" >내 펫시터 활동내역보기</button>
						<button onclick = "window.location.href = 'main.jsp'" >메인페이지로 가기</button>
					</td>
				</tr>
				<%}else{%>
				<tr>
					<td>
						<%= session.getAttribute("sId") %>님 환영합니다. <br />
						<button onclick = "window.location.href = 'applypetForm.jsp'" >펫시터 신청</button>
						<button onclick = "window.location.href = 'main.jsp'" >메인페이지로 가기</button>
					</td>
				</tr>
				<%} %>
			</table>	
			
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
<% 	}%>
</html>