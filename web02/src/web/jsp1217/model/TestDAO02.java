package web.jsp1217.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TestDAO02 {
		private Connection conn=null;
		private PreparedStatement pstmt=null;
	
	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");
		return ds.getConnection();		
	}
	
	// 회원가입 메서드 : DB에 전체 회원의 데이터 저장
//	public void insertMember(id, pw, age) {
	public void insertMember(TestDTO dto) {
		// id, pw, age, reg
		try {
			// db 커넥션 필요
			Connection conn = getConnection();
			// 쿼리 작성
			String sql = "insert into test values (?,?,?,sysdate)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, id);
//			pstmt.setString(2, pw);
//			pstmt.setInt(3, age);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setInt(3, dto.getAge());
			
			// 쿼리 실행
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();};
			if(conn != null) try {conn.close();}catch(SQLException e){e.printStackTrace();}
		}
		
	}
	
	
	
}
