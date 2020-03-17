<%@page import="java.util.Arrays"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	
	// DB연결해서 저장
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//커넥션 받아오기
	String user = "java13" , password="java13";
	String url = "jdbc:oracle:thin:@192.168.0.252:1521:ORCL";
	Connection conn = DriverManager.getConnection(url, user, password);
	//쿼리작성, Pstmt
	
	
	String sql = "delete from dbJoinForm where id='?'";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	// place holder (?로 치환시켜놓은곳)에 들어갈 값을 차례로 채워주기. (총알장전)

	
	pstmt.executeUpdate();
	pstmt.close();
	conn.close();

%>





<body>

</body>
</html>