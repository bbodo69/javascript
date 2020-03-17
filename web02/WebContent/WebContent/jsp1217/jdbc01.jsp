<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
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
  /*
	// #1. JDBC 드라이버로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	// #2. 커넥션 연결
	String user = "java13";
	String password = "java13";
	String url = "jdbc:oracle:thin:@192.168.0.252:1521:ORCL";	
	Connection conn = DriverManager.getConnection(url, user, password);
  */
  
	// Server > contextxml에 설정해 놓은 Resource를 가지고 와서 커넥션 작업
	// InitialContext() 객체를 생성해서 Context 타입의 ctx 래퍼런스에 할당
	// context.xml 에 접근하는 클래스
	Context ctx = new InitialContext();
	//자바 기술로 만들어진 환경설정정보만 찾아와 Context에 다시 담기
	Context env = (Context)ctx.lookup("java:comp/env");
	//name 속성에  jdbc/orcl 이름 붙여놓은 데이터 소스 찾음. type 속성에 저장해놓은 DataSource로 담기
	DataSource ds = (DataSource)env.lookup("jdbc/orcl");
	Connection conn = ds.getConnection();
	// 커넥션 풀 을 사용하기 위해서 맨위 것을 쓰지 않고 바로 위의 것으로 사용.
	
	
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




