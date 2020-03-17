<%@page import="web.jsp1219.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deletePro</title>
</head>
<%
	// 회원 탈퇴 로직 작성
	// DB 에서 데이터 삭제
	String id = (String)session.getAttribute("memId");
	// form 페이지에서 넘어온 비밀번호 받기
	String pw = request.getParameter("pw");
	
	MemberDAO dao = new MemberDAO();
	int result = dao.deleteMember(id, pw);
	// result : -1 (아이디 이상, 세션 생성부분 확인), 0 (비번 오류), 1 (삭제 성공)
	if(result==1){	// 탈퇴 처리가 됬다면, 
	// 로그아웃
		session.invalidate();
		// 쿠키도 있다면 쿠키도 삭제
		Cookie[] cs = request.getCookies(); // request 에서 전체쿠키 가져오기
		if(cs != null){// 쿠키가 있다면,
			for(Cookie coo : cs){ // 반복문 돌려서 모든 쿠키에 접근
				                  // 쿠키 이름 뽑아, 저장할때 붙인 이름과 비교해서 동일하면 삭제
				if(coo.getName().equals("autoId") || coo.getName().equals("autoPw") || coo.getName().equals("autoCh")){ 
					coo.setMaxAge(0);
					response.addCookie(coo);
				}
			}
		}		
		%>
		
	<body>
		<br />
		<table>
			<tr>
				<td>회원정보가 삭제 되었습니다.</td>
			</tr>
			<tr>
				<td><input type="button" onclick="window.location.href='main.jsp'"></td>
			</tr>
		</table>
	
	</body>
		
		
<%	}else{ // 비밂번호 오류 : 회원탈퇴 실패		%>
	<script>
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>		
<%}%>
<body>


</body>
</html>