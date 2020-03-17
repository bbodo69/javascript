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
			window.location.href="main.jsp";
		</script>
<%	}else if(sId == null && cId != null){
		session.setAttribute("sId", cId);
		sId = cId;
	}

%>
<body>
<br/>
<br/>
<br/>
	<table class="mypage">
		<tr>
			<td><img src="/web/getpetImage/empty.png" width="220"/></td>
		</tr>
		<tr>
			<td><h3><a href="mypage.jsp">마이페이지</a></h3></td>
		</tr>
		<tr>
			<td><h3><a href="modifyForm.jsp">정보 수정</a></h3></td>
		</tr>
		<tr>
			<td><h3><a href="addpet.jsp">나의 애견 정보</a></h3></td>
		</tr>
		<tr>
			<td><h3><a href="myContentsList.jsp">내가 쓴 글</a></h3></td>
		</tr>
		<tr>
			<td><h3><a href="mainpet.jsp">펫시터 페이지</a></h3></td>
		</tr>
	</table>
	<br/>
	<h1><button onclick="window.location.href='main.jsp'">메인으로</button></h1>
</body>
</html></html>