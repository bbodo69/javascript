package web.jsp1218.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAOt {

		private Connection conn = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		
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
				String sql = "insert into dbJoinForm values()";
				conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPw());
				pstmt.setString(3, dto.getPwCh());
				pstmt.setString(4, dto.getName());
				pstmt.setString(5, dto.getNumber());
				pstmt.setString(6, dto.getA());// 취미를 DTO 에서 모아줘야함
				pstmt.setString(6, dto.getB());
				pstmt.setString(6, dto.getC());
				pstmt.setString(6, dto.getD());
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
