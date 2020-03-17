<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" >
<script>
	function checkValues(){
		var deleteMember = document.deleteMember;
		if(!deleteMember.pw.value){
			alert("비밀번호 확인을 입력하세요.");
			return false;
		}
	}
</script>
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
	
	if(sId == null && cId == null){	%>
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
	<header>
		<jsp:include page="petHeader.jsp" flush="false"/>
	</header>
	<aside class="aside">
		<jsp:include page="mypageAside.jsp" flush="false"/>
	</aside>
	<section>
		<h2 align="center"> 회원 탈퇴 </h2>
		<form name="deleteMember" action="deletePro.jsp" onsubmit="return checkValues()" method="post">
			<table>
				<tr>
					<td colspan="2">
						비밀번호를 입력하세요.<br/>
						<input type="password" name="pw" />
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="회원 탈퇴" /> </td>
					<td><input type="button" value="취소" onclick="history.go(-1)" /> </td>
				</tr>
			
			</table>
		</form>
	</section>
<body>

</body>
</html>