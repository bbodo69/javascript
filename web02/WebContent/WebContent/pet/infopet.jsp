<%@page import="web.pet.model.PetsitterDTO"%>
<%@page import="web.pet.model.PetsitterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href = "style.css" rel = "stylesheet" type = "text/css">
</head>
<%
//필요한 변수 세팅
String sId = (String)session.getAttribute("sId");

//( 로그인해야 글 볼 수 있도록 )세션쿠키검사 완료.
String cId = null;
Cookie[] coo = request.getCookies();
if(coo != null){
	for(int i = 0; i < coo.length; i++){
		if(coo[i].getName().equals("cId")) cId = coo[i].getValue();
	}
}

if(sId == null && cId == null){ //세션쿠키 둘 다 없으면 메인으로 %>
	<script>
		alert("로그인 후 이용가능 한 페이지입니다.");
		window.location.href="main.jsp";
	</script>
<%}else {
	if( sId == null && cId != null){ //쿠키만 존재할 경우 세션 만들어주고  sId에 값도 담아주기
	session.setAttribute("sId", cId);
	sId = cId;
	}
	PetsitterDAO dao = new PetsitterDAO();
	PetsitterDTO article = dao.getPetsitter(sId);
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
			<h2>내 펫시터 정보</h2>
			<br/><br/>
			<form action = "infopetmodifyPro.jsp">
			<table>	<%-- 펫시터 평점 컬럼도 만들어져는 있으나 자신이 입력하지 못하는 항목이므로 여기에는 넣지 않음 --%>
					<tr>
						<td>아이디(회원가입 아이디와 동일)</td>
						<td><%=article.getId() %></td>
					</tr>
					<tr>
						<td>이름 *</td>
						<td><%=article.getName()%></td>
					</tr>
					<tr>
						<td>지역 *</td>
						<td>
			                <%=article.getArea() %>
			            </td>
					</tr>
					<tr>
						<td>펫시터 경험회수 *</td>
						<td><%= article.getPetsit()%></td>
					</tr>
					<tr>
						<td>키우고 있거나 키워본 반려동물 수 *</td>
						<td><%= article.getPet()%></td>
					</tr>
					<tr>
						<td>휴대폰 번호</td>
						<td><%= article.getPhon()%></td>
					</tr>
					<tr>
						<td>기타사항(관련 자격증이나 하고 싶은 말 등을 적으시면 됩니다.)</td>
						<td>
							<textarea name = "box" cols = "50" rows = "10" readonly><%= article.getBox()%></textarea>
						</td>
					</tr>
					<tr>
						<td>프로필 사진</td>
						<td>
							<img src = "/web/save/<%=article.getPhoto()%>">
						</td>
					</tr>
					<tr>
						<td colspan = "2">
						<input type = "button" onclick = "window.location.href='infopetmodifyForm.jsp?'" value = "펫시터정보수정">
						<input type = "button" onclick = "window.location.href='infopetdeleteForm.jsp?'" value = "펫시터탈퇴">
						<input type = "button" onclick = "window.location.href='mainpet.jsp?'" value = "뒤로가기">
						</td>
					</tr>
				</table>
			</form>
			<br/><br/><br/><br/><br/><br/><br/><br/>
			<br/><br/><br/><br/>

		</section>
	</div>	
	<footer>
		<jsp:include page="petFooter.jsp" flush="false"/>
	</footer>
</body>
<% } %>
</html>