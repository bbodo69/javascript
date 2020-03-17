<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
 
	// #1. form에서 보낸 데이터 받기
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	int age = Integer.parseInt(request.getParameter("age"));
	
	// #2. DB연결해서 저장
	// 드라이버로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	// 커넥션 받아오기
	String user = "java13", password = "java13";
	String url = "jdbc:oracle:thin:@192.168.0.252:1521:ORCL";
	Connection conn = DriverManager.getConnection(url, user, password);
	
	// 쿼리작성, Pstmt
	// String sql = "insert into test values("+id+","+pw+","+age+",sysdate)";
	// insert into test values(java,1234,10,sysdate);
	String sql = "insert into test values(?,?,?,sysdate)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	// place holder (?로 치환시켜놓은곳)에 들어갈 값을 차례로 채워주기, (총알장전)
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	pstmt.setInt(3, age);
		
	// 쿼리 실행
	pstmt.executeUpdate();
	
	// 객체 반환
	pstmt.close();
	conn.close();
	
%>
<body>

	<h2> <%=id %>님 가입이 완료되었습니다.</h2>
</body>
</html>