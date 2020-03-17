package web.jsp1220.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



	public class MemberDAO {

	private PreparedStatement pstmt = null;
	private Connection conn = null;
	private ResultSet rs = null;
	
	// 싱글턴으로 변경
	private static MemberDAO instance = new MemberDAO();
	private MemberDAO() {}
	public static MemberDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception{
		
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");
		conn = ds.getConnection();
		return conn;
	}
	
	//회원가입 메서드
	public void insertMember(MemberDTO dto) {
		try {
			conn = getConnection();
			String sql = "insert into site01 values (?,?,?,?,?,?)";
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getPwCh());
			pstmt.setString(4, dto.getName());
			pstmt.setString(5, dto.getBirth());
			pstmt.setString(6, dto.getEmail());
			
			pstmt.executeUpdate();						
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
	}
	
	// 로그인 확인 메서드
	public boolean loginCheck(String id, String pw) {
		
		boolean check = false;
		try {
			conn = getConnection();
			String sql = "select * from site01 where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				check=true;
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
		return check;
	}
	
	// 중복아이디 확인 메서드
	
	public boolean checkId(String id) {
		boolean check = false;
		
		try {
			conn = getConnection();
			String sql = "select id from site01 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);			
			rs = pstmt.executeQuery();			
			if(rs.next()) {
				check = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
		
		
		return check;
	}
	
	public void getmember(String id) {
		MemberDTO member = null;
		
		try {
			conn = getConnection();
			String sql = "select * from site01 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setBirth(rs.getString("birth"));
				member.setEmail("email");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	
}
