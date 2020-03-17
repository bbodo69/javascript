<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
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
	//#1. JDBC 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//#2. DB연결 : Connection 객체 생성
	String user = "java13", pw= "java13";
	String url = "jdbc:oracle:thin:@192.168.0.252:1521:ORCL";
	Connection conn = DriverManager.getConnection(url, user, pw);
	
	//#3. 쿼리문작성, Statement 객체 생성
	String sql = "select * from test";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	//#4. 쿼리 실행
	ResultSet rs = pstmt.executeQuery();
	// 실행 결괄를 ResultSet 티입으로 리턴해줌. 
	
	//#5. 결과값 추출
	while(rs.next()){
		String id = rs.getString("id");
		String password = rs.getString("pw");
		String age = rs.getString("age");
		%>
	
	
	
	<h3> 
		id : <%=id %> / password : <%= password %> / age <%= age %> / </h3>
<%	}
	
	//#6. 사용된 객체 반환시켜서 메모리 해제
	rs.close();
	pstmt.close();
	
	//#7. 커넥션객체 반환	
	
%>
<body>

</body>
</html>