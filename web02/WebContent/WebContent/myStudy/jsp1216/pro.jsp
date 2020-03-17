<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String age= request.getParameter("age");

	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String user = "java13";
	String password = "java13";
	String url = "jdbc:oracle:this:@192.168.0.252:1521:ORCL";
	
	Connection conn = DriverManager.getConnection(user, password, url);
	
	String sql = "insert into test values (?,?,?,sysdate)";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	pstmt.setString(3, age);
	pstmt.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	




%>
	

</body>
</html>