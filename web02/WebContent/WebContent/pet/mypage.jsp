
<%@page import="web.pet.model.CommentbDAO"%>
<%@page import="web.pet.model.PetsitterDTO"%>
<%@page import="web.pet.model.PetsitterDAO"%>
<%@page import="web.pet.model.PetmemberDTO"%>
<%@page import="web.pet.model.PetmemberDAO"%>
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
	//세션쿠키검사
	//세션이 있는 경우에만 진행 쿠키만 있을 경우 세션 만들어주고 진행
	String sId = (String)session.getAttribute("sId");
	String cId = null;
	Cookie[] coo = request.getCookies();
	if(coo != null){
		for(Cookie c : coo ){
			if(c.getName().equals("cId")) cId = c.getValue();
		}
	}
	
	if(sId == null && cId == null){%>
		<script>
			alert("로그인 후 이용 가능한 페이지입니다.");
			window.location.href="loginForm.jsp";
		</script>
<%	}else{ 
		if(sId == null && cId != null){
			session.setAttribute("sId", cId);
			sId = cId;
		}
		PetmemberDAO dao = new PetmemberDAO();
		PetmemberDTO petmember = dao.getPetmember(sId);
		CommentbDAO comment = new CommentbDAO();
		int commentWriteCount = comment.getcommentWriteCount(sId);
		boolean sitter = dao.checkSitter(sId); //펫시터 등록여부
		
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
			<br/><br/>
			<h2>마이페이지</h2>
			<br/>
			<h4 align="center">'<%=sId %>'님 환영합니다!</h4>
			<p align="center">
			email : <%=petmember.getEmail() %> <br/>
			</p>
			<br/>
			<h2 align="center">나의 반려동물</h2>
			<table>
				<tr>
					<td width="550">
						<br/>
						등록하신 반려동물이 없습니다. 나의 반려동물을 등록해보세요.<br/>
						<button>반려동물 등록하기</button>
						<br/>
						<br/>
					</td>
				</tr>
			</table>
			<br/>
			<h2 align="center">나의 커뮤니티 활동내역</h2>
			<table>
				<tr>
					<td width="550">
						<br/>
						펫시터 이용 : &nbsp; &nbsp; <%=commentWriteCount %> 회 <br/>
						애견용품 거래 글 : &nbsp; &nbsp; 개 <br/>
						자유게시판 글 등록 : &nbsp; &nbsp; 개 <br/>
						펫시터 등록 여부:  
						<% if(sitter){%> &nbsp;  &nbsp;  YES <%}
						else{%> &nbsp; &nbsp; NO <%}%>
						<br/><br/>
						<button onclick="window.location.href='mycontent.jsp'">내가 쓴 글 보러가기</button>
						<br/>
					</td>
				</tr>
			</table>
			<br/>
			<h3 align="center"><a href="modifyForm.jsp">나의 정보 수정하러 가기</a></h3>
			<h3 align="center"><a href="actpet.jsp">나의 펫시터 활동내역 보러가기</a></h3>	

			<br/>
			<br/>
			<br/>
			<br/>
			<br/>
			<br/>
			<br/>
			</section>		
	</div>	
	<footer>
		<jsp:include page="petFooter.jsp" flush="false"/>
	</footer>
</body>
<%}%>
</html>