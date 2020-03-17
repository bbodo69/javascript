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
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	
	String [] checkBox = request.getParameterValues("checkBox");
	String str = java.util.Arrays.toString(checkBox);
	
	// DB연결해서 저장하려면.
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//커넥션 받아오기
	String user = "java13", password = "java13";
	String url = "jdbc:oracle:thin:@192.168.0.252:1521:ORCL";
	Connection conn = DriverManager.getConnection(url, user, password);
	//쿼리 작성
	
	String sql = "insert into dbJoinForm values(?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, str);
	
	pstmt.executeUpdate();
	pstmt.close();
	conn.close();	

%>
<body>
	

</body>
</html>