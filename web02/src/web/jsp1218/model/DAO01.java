package web.jsp1218.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO01 {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");
		Connection conn = ds.getConnection();
		return conn;
	}
	
	public void insertMember(DTO01 dto) {
					
		try {
			conn = getConnection();
			
			String sql = "insert into dbjoinForm values(?,?,?,?,?,?,?,sysdate)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getPwCh());
			pstmt.setString(4, dto.getName());
			pstmt.setString(5, dto.getNumber());
			pstmt.setString(6, dto.getHobby());
			pstmt.setString(7, dto.getGender());
			pstmt.setString(8, dto.getDate());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {		
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();};
			if(conn!=null)try {conn.close();}catch(SQLException e) {e.printStackTrace();};			
		}
		
	}

}
