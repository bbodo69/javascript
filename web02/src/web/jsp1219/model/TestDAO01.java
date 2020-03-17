package web.jsp1219.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TestDAO01 {

	private PreparedStatement pstmt;
	private Connection conn;
	private ResultSet rs;
	
	private Connection getConnection() throws Exception{
		
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");
		Connection conn = ds.getConnection();
		return conn;
	}
	
	public boolean loginCheck(String id, String pw) {
		boolean check = false;
		try {
			conn = getConnection();
			String sql = "select * from test where id=? and pw=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				check = true;
			}			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try{rs.close();}catch(SQLException e) {}
			if(pstmt != null)try{pstmt.close();}catch(SQLException e) {}
			if(conn != null)try{conn.close();}catch(SQLException e) {}
		}
		return check;
	}
	
	
	
	
	
}
