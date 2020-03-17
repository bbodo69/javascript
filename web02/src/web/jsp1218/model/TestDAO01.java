package web.jsp1218.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class TestDAO01 {
	
	private Connection conn = null;
	private String sql = null;
	private PreparedStatement pstmt = null;
	
	private Connection getConnection() throws Exception{ 
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");
		conn = ds.getConnection();	
		return conn;
	}	
		
	public void insertMember(TestDTO dto) {
		try {
			conn = getConnection();
			sql = "insert into test_01 values (?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn!=null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}				
	}	 
	//	sql = "insert into test values (?,?)";
}
