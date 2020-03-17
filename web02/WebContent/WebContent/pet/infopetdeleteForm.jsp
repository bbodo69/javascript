<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>펫시터 정보 삭제페이지</title>
	<script>
		function check(){
			var checkpet = document.petdel;
			if(!checkpet.pw.value){
				alert("비밀번호를 입력하시오.");
				return false;
			}
		}
	</script>
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
			<br /><br/>
			<h2>펫시터 탈퇴(회원 탈퇴는 아님)</h2>
			<br/><br/><br/>
			<form name = "petdel" action = "infopetdeletePro.jsp" method = "post" onsubmit = "return check()" >
			<table>
				<tr>
					<td>
						<input type = "password" name = "pw" />
					</td>
					<td>
						PW
					</td>
				</tr>	
				<tr>
					<td><input type = "submit" value = "펫시터 탈퇴" /></td>
					<td><input type = "button" value = "취소" onclick = "window.location.href = 'mainpet.jsp'" /></td>
				</tr>
			</table>
			</form>
			<%} %>
			<br/><br/><br/><br/><br/><br/><br/><br/>
			<br/><br/><br/><br/><br/><br/><br/><br/>
			<br/><br/><br/><br/><br/><br/><br/><br/>
			<br/><br/><br/><br/><br/><br/><br/><br/>
		</section>
	</div>	
	<footer>
		<jsp:include page="petFooter.jsp" flush="false"/>
	</footer>			
</body>
</html>