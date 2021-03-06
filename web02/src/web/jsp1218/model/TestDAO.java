package web.jsp1218.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TestDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 커넥션 메서드
	private Connection getConnection() throws Exception{
			Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:comp/env");
			DataSource ds = (DataSource)env.lookup("jdbc/orcl");
			Connection conn = ds.getConnection();
			return conn;		
			}
	
	// id, pw 확인 메서드(로그인)
	public boolean loginCheck(String id, String pw) {
		boolean result = false;
		// 커넥션 받아오고
		try {
			conn = getConnection();
		// id와 pw가 존재하는지 확인
			String sql = "select * from test where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();	// 쿼리 실행해서 결과 받아오기
			// rs에 결과가 있으면 id/pw 일치
			// rs에 결과가 없으면 id/pw 둘중하나 불일치
			if(rs.next()) {
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
		
		return result;
	}


}
