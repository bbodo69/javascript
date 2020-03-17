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
		<table>
			<tr height="200">
				<td><h2><a href="getpetList.jsp">펫시터구하기</a></h2></td>
				<td><h2><a href="commentList.jsp">펫시터 후기</h2></td>
			</tr>
			<tr height="200">
				<td><h2><a href="">자유게시판</a></h2></td>
				<td><h2><a href="">애견용품 거래</a></h2></td>
			</tr>
			<tr height="200">
				<td colspan="2" width="500"><h2><a href="qnaForm.jsp">QnA</a></h2></td>
			</tr>
		</table>
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