package web.jsp1217.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class TestDAO {
	
	// 자주 사용하는 클래스 3개 변수 인스턴스로 만들기
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	// #2. DB 연결을 담당하는 커렉션 메서드 
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");
		Connection conn = ds.getConnection();
		return conn;		
	}
		
	// #1. 회원정보 모두 가저오기
	public List selectAll() {
		List list = null;
		// DB 작성
		try {
			conn = getConnection();
			/* Context ctx = new InitialContext();
			Context env = (Context)ctx.lookup("java:comp/env");
			DataSource ds = (DataSource)env.lookup("jdbc/orcl");
			Connection conn = ds.getConnection();  */
						
			String sql = "select * from test";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			list = new ArrayList();
			while(rs.next()) {
				// 한 레코드 정보를 DTO 단위로 담아서 list 에 추가
				TestDTO dto = new TestDTO();
				
				String id = rs.getString("id");
				dto.setId(id);
				String pw = rs.getString("pw");
				dto.setPw(pw);
				int age = rs.getInt("age");
				dto.setAge(age);
				Timestamp reg = rs.getTimestamp("reg");
				dto.setReg(reg);
				
				list.add(dto);
				
//				list.add(id);
//				list.add(pw);
//				list.add(age);
//				list.add(reg);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();} catch (SQLException e) {e.printStackTrace();}						
			
		}				
		// 쿼리작성
		// 결과 추출해 리스트에 담고
		//리스트 리턴
		return list;						
	}
	
	public List selectIds() {
		List list = null;
		try {
			conn = getConnection();
			/*
			Context ctx = new InitialContext();
			Context env=(Context)ctx.lookup("java:comp/env");
			DataSource ds = (DataSource)env.lookup("jdbc/orcl");
			Connection conn = ds.getConnection();
			*/
			
			String sql = "select id from test";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			list = new ArrayList();
			while(rs.next()) {
				// 한 레코드 정보를 DTO 단위로 담아서 list 에 추가
				TestDTO dto = new TestDTO();
				
				String id = rs.getString("id");
				dto.setId(id);
				
				list.add(dto);
			}	
						
		} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) try {rs.close();} catch (SQLException e) {e.printStackTrace();}
				if(pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
				if(conn != null) try {conn.close();} catch (SQLException e) {e.printStackTrace();}						
				
			}				
		return list;
		}	
}
