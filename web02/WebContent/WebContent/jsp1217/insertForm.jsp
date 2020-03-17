<%@page import="java.sql.Timestamp"%>
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
<body>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String user = "java13";
	String password = "java13";
	String url = "jdbc:oracle:thin:@192.168.0.252:1521:ORCL";
	
	Connection conn = DriverManager.getConnection(url, user, password);

	String sql = "insert into test values (?,?,?,sysdate)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, "abc1234");
	pstmt.setString(2, "1234");
	pstmt.setInt(3, 21);
//	pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
	
	pstmt.executeUpdate();
	pstmt.close();
	conn.close();

%>



</body>
</html>