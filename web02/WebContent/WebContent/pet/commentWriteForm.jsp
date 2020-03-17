<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기작성하기</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<style>
	h1 { COLOR: #77878F; }
</style>
<script>
	function searchId(){
		var url = "commentWriteNameSearch.jsp";
		open(url, "펫시터 검색", "toolbar=no, status=no, menubar=no, scrollbars=no, resizalbe=no, width=400px, height==300px");
	}
	function check(){
		var comment = document.commentWrite;
		if(!comment.area.value){
			alert("지역을 선택하세요.");
			return false;
		}
		if(!comment.name.value){
			alert("펫시터를 선택하세요.");
			return false;
		}
		if(!comment.petdate.value){
			alert("이용 날짜를 선택하세요.");
			return false;
		}
		if(!comment.point.value){
			alert("만족도를 선택하세요.");
			return false;
		}
		if(!comment.subject.value){
			alert("제목을 입력하세요.");
			return false;
		}
		if(!comment.content.value){
			alert("내용을 입력하세요.");
			return false;
		}
	}
</script>
</head>
<%
	//쿠키세션검사 완료.
	//비로그인 시 경고창 -> loginFrom.jsp로 보내기
	
	String sId = (String)session.getAttribute("sId");
	String cId = null;
	Cookie[] coo = request.getCookies();
	if(coo != null){
		for(Cookie c : coo){
			if(c.getName().equals("cId")) cId = c.getValue();
		}		
	}
	if(cId != null) {
		session.setAttribute("sId", cId);
		sId = cId;
	}
	
	if(sId == null){%>
		<script>
			alert("로그인 후 이용 가능한 페이지입니다.");
			window.location.href="loginForm.jsp";
		</script>
	<%}else{ 
	
		int num = 0, ref = 1, re_step = 0;
		String name = null;
	%>
	
	<body>	
		<form name="commentWrite" onsubmit="return check()" action="commentWritePro.jsp" method="post" encType="multipart/form-data">
		<br/>
		<h1>펫시터 이용 후기</h1>
			<table>
				<tr>
					<td>지역</td>
					<td align="left"><select name="area">
							<option value="강원도">강원도</option>
							<option value="경기도">경기도</option>
							<option value="경상남도">경상남도</option>
							<option value="경상북도">경상북도</option>
							<option value="광주">광주</option>
							<option value="대구">대구</option>
							<option value="대전">대전</option>
							<option value="부산">부산</option>
							<option value="울산">울산</option>
							<option value="인천">인천</option>
							<option value="서울">서울</option>
							<option value="세종">세종</option>
							<option value="전라남도">전라남도</option>
							<option value="전라북도">전라북도</option>
							<option value="충청남도">충청남도</option>
							<option value="충청북도">충청북도</option>
							<option value="제주도">제주도</option>
						</select></td>
					<td>펫시터</td>
					<td align="left">
						<input type="text" name="name" readonly/>
						<input type="button" value="검색" onclick="searchId()"/>
					</td>
				</tr>
				<tr>
					<td>이용날짜</td>
					<td colspan="3" align="left">
					<input type="date" name="petdate"/>
					<select name="petday">
						<option value="하루">하루</option>
						<option value="1박2일">1박2일</option>
						<option value="2박3일">2박3일</option>
						<option value="3박 이상">3박 이상</option>
						<option value="일주일">일주일</option>
						<option value="장기">장기</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>만족도</td>
					<td colspan="3">
						<input type="radio" name="point" value="5" />5
						<input type="radio" name="point" value="4" />4 
						<input type="radio" name="point" value="3" />3 
						<input type="radio" name="point" value="2" />2 
						<input type="radio" name="point" value="1" />1  
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td align="left" colspan="3"><input type="text" name="subject" size="60"/></td>
				</tr>
				<tr>
					<td align="left" colspan="4">
						<input type="file" name="img" /><br/>
					</td>
				</tr>
				<tr>
					<td colspan="4">	
						후기<br/>
						<textarea name="content" rows="10" cols="70"></textarea>
					</td>
				</tr>
			</table>
			<h1>
				<input type="submit" value="등록하기" />
				<%String pageNum = "1";
				if(request.getParameter("pageNum") != null)	pageNum = request.getParameter("pageNum"); %>
				<input type="button" value="뒤로가기" onclick="window.location.href='commentList.jsp?pageNum=<%=pageNum%>'"/>
			</h1>
	<%}%>
		</form>
	</body>
</html>