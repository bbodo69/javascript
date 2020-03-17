<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	// #1. JDBC 드라이버로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	// #2. 커넥션 연결
	String user = "java13";
	String password = "java13";
	String url = "jdbc:oracle:thin:@192.168.0.252:1521:ORCL";	
	Connection conn = DriverManager.getConnection(url, user, password);
	// #3. 쿼리문 작성, PreparedStatement 객체생성
	String sql = "select * from test";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	// #4. 쿼리 실행
	ResultSet rs = pstmt.executeQuery();
	// #5. 결과 추출 -> 출력 : test 테이블의 레코드 전체 출력
	while(rs.next()){
		String id = rs.getString("id");
		String pw = rs.getString("pw");
		int age = rs.getInt("age");
		Timestamp reg = rs.getTimestamp("reg"); %>
		
		<p>id : <%=id%> / pw : <%=pw%> / age : <%=age%> / reg : <%=reg%> <br /> </p>  
		
	<%}
	// #6. 객체 반환
	rs.close();
	pstmt.close();
	conn.close();
%>
</body>
</html>