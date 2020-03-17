package web.jsp0102.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	
	private Connection getConnection() throws Exception{
		Connection conn = null;
		
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource	dc = (DataSource)env.lookup("jdbc/orcl");
		conn = dc.getConnection();
		
		return conn;
	}
	
	public int getArticleCount() {
		int count = 0;		
			try {
				conn = getConnection();
				String sql = "select count(*) from board01";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(rs != null)try{rs.close();}catch(SQLException e){e.printStackTrace();}
				if(pstmt != null)try{pstmt.close();}catch(SQLException e){e.printStackTrace();}
				if(conn != null)try{conn.close();}catch(SQLException e){e.printStackTrace();}
			}			
		return count;
	}
	
//	public void insertContent() {
//		try {
//			conn = getConnection();
//			String sql = "insert into board01 values (board01_seq.valnext,?,?,?,?,?,?,?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, writer);
//			pstmt.setString
//			
//		} catch (Exception e) {
//			
//		}
//		
//	}
	
	public List getArticle(BoardDTO dto) {
		
		
	}
}
