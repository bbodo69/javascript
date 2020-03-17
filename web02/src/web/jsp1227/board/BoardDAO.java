package web.jsp1227.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");
		conn = ds.getConnection();
		return conn;
	}
	
	public void insertData(testDTO dto) {
		try {
			conn = getConnection();
			String sql = "insert into a(num, writer) values (a_seq.nextVal,?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn!= null)try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}		
	}	
	
	public BoardDTO getData(BoardDTO dto) {
		dto = null;		
		try {
			conn = getConnection();
			String sql = "select * from a where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(2, dto.getWriter());
			rs = pstmt.executeQuery();
			
			dto.setNum(rs.getInt(1));
			dto.setWriter(rs.getString(2));
						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		return dto;
	}
	
	public List articles(int count) {
		
		List articles = null;
		try {
			conn = getConnection();
			String sql = "select * from a";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				articles = new ArrayList(count);
				while(rs.next()) {
					testDTO article = new testDTO();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					articles.add(article);
				}
			}		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
		

		return articles;
	}
	
	public int getArticleCount() {
		int count = 0;
		try {
			conn = getConnection();
			String sql = "select count(*) from a";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}			
		} catch (Exception e) {
			e.printStackTrace();	
		} finally {
			if(rs != null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
		}
		return count;
	}
}
