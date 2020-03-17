<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 작성</title>
	<link href="style.css" rel="stylesheet" type="text/css" >
</head>
<%
	if(session.getAttribute("sId") == null) { %>
		<script>
			alert("잘못된 접근입니다.");
			window.location="main.jsp";
		</script>	
<%	}

	String id = "";
	if(session.getAttribute("sId") != null){
		id = (String)session.getAttribute("sId");
	}
	
	int num = 0, ref = 1, re_step = 0, re_level = 0;
	
	if(request.getParameter("num") != null){
		num = Integer.parseInt(request.getParameter("num"));
		ref = Integer.parseInt(request.getParameter("ref"));
		re_step = Integer.parseInt(request.getParameter("re_step"));
		re_level = Integer.parseInt(request.getParameter("re_level"));
	}
%>
<body>
	<br />
	<h1 align = "center">글 작성</h1>
	<form action = "tradeWritePro.jsp" method = "post" enctype = "multipart/form-data">
		<input type = "hidden" name = "num" value = "<%= num %>" />
		<input type = "hidden" name = "ref" value = "<%= ref %>" />
		<input type = "hidden" name = "re_step" value = "<%= re_step %>" />
		<input type = "hidden" name = "re_level" value = "<%= re_level %>" />
		<table>
			<tr>	
				<td></td>
				<td align="right">
					<input type="button" value="리스트 보기" onclick="window.location='tradeList.jsp'" /> 
				</td>
			</tr>
			<tr>
				<td>작성자(회원가입 아이디와 동일)</td>
				<td><%= id %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td align = "left">
					<%if(request.getParameter("num") == null){ %>
					<input type = "text" name = "subject" />
					<%}else{ %>
					<input type = "text" name = "subject" value = "[답변]" />
					<%} %>
				</td>
			</tr>
			<tr>
				<td>지  역 * </td>
				<td align = "left">
                <select name = "local">
                    <option value = "경기도" selected>경기도</option>
                    <option value = "강원도">강원도</option>
                    <option value = "경상북도">경상북도</option>
                    <option value = "경상남도">경상남도</option>
                    <option value = "충청북도">충청북도</option>
                    <option value = "충청남도">충청남도</option>
                    <option value = "전라북도">전라북도</option>
                    <option value = "전라남도">전라남도</option>
                    <option value = "제주도">제주도</option>
                    <option value = "서울특별시">서울특별시</option>
                    <option value = "인천광역시">인천광역시</option>
                    <option value = "대전광역시">대전광역시</option>
                    <option value = "세종특별시">세종특별시</option>
                    <option value = "광주광역시">광주광역시</option>
                    <option value = "대구광역시">대구광역시</option>
                    <option value = "부산광역시">부산광역시</option>
                    <option value = "울산광역시">울산광역시</option>
                </select>
            	</td>
			</tr>
			<tr>
				<td>내  용</td>
				<td align = "left"><textarea rows = "20" cols = "70" name = "content"></textarea></td>
			</tr>
			<tr>
				<td>사  진</td>
				<td>
					<input type = "file" name = "picture" />
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td align = "left"><input type = "password" name = "pass" /></td>
			</tr>
			<tr>
				<td colspan = "2" align = "right">
					<input type = "submit" value = "저장" />
					<input type = "reset" value = "재작성" />
					<input type = "button" value = "리스트보기" onclick = "window.location.href = 'tradeList.jsp'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>