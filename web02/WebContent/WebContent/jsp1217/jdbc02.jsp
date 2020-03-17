<%@page import="web.jsp1217.model.TestDTO"%>
<%@page import="java.util.List"%>
<%@page import="web.jsp1217.model.TestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	// DB 접속해서 전체 회원리스트 받아와 화면에 출력
	// TestDAO 사용하기 위해 객체 생성
	TestDAO dao = new TestDAO();
	// TestDAO 에 만들어 놓은 전체 회원정보를 리턴해주는 메서드 호출해서 실행
	List list = dao.selectAll();
	
	//반복문 사용해서 List의 요소 하나씩 뽑아 화면에 뿌리기
	for(int i = 0 ; i < list.size() ; i++){
		TestDTO dto = (TestDTO)list.get(i); %>
		
		<p>	
		id : <%=dto.getId() %> / pw : <%=dto.getPw() %> / age : <%=dto.getAge() %> / 
		reg : <%=dto.getReg() %>
		</p>  
<%	}

%>
</body>
</html>