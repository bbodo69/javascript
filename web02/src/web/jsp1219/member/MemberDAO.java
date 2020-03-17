package web.jsp1219.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	private PreparedStatement pstmt;
	private Connection conn;
	private ResultSet rs;
	
	private Connection getConnection() throws Exception{
		
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");
		conn = ds.getConnection();
		return conn;
	}
	
	// 회원가입 메서드
	public void insertMember(MemberDTO member) {
		try {
			conn = getConnection();			
			String sql = "insert into member values (?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getBirth());
			pstmt.setString(5, member.getEmail());
			
			
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
			String sql = "select * from member where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			//rs에 담겼는지 확인
			
			if(rs.next()) {
				check = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}	
		}	
		return check;
	}
	
	// 지정한 회원 정보 가저오기
		
		public MemberDTO getMember(String id) {
			MemberDTO member = null;
			try{
				conn = getConnection();
				String sql = "select * from member where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					System.out.println("a");
					 member = new MemberDTO();
					 member.setId(rs.getString("id"));
					 member.setPw(rs.getString("pw"));
					 member.setName(rs.getString("name"));
					 member.setBirth(rs.getString("birth"));
					 member.setEmail(rs.getString("email"));
					 member.setReg(rs.getTimestamp("reg"));
					
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null)try {rs.close();}catch(SQLException e) {e.printStackTrace();}
				if(pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
				if(conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}	
			}		
			return member;
		}
	
	// 수정 메서드
	public void updateMemner(MemberDTO member) {
		try {
			conn = getConnection();
			String sql = "update member set pw=?, birth=?, email=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPw());
			pstmt.setString(2, member.getBirth());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getId());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {

		} finally {
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}	
		}
	}
	
	// 회원 탈퇴 메서드
	public int deleteMember(String id, String pw) {
		int x = -1;			// id 가 일치하지 않는 경우
		String dbpw = "";
		
		
		try {
			conn = getConnection();
			// DB 에서 해당 id의 비번 가져오기
			String sql = "select pw from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {		// db에서 꺼내온 pw가 있다면, 커서를 가르키고
				dbpw = rs.getString("pw");
				if(dbpw.equals(pw)) { // 비번이 서로 일치하면 회원정보 삭제
					sql = "delete from member where id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					
					pstmt.executeUpdate();
					x=1; // 회원 탈퇴 성공
				}else { // 비번이 서로 일치하지 않을 경우
					System.out.println("비번 오류");
					x = 0; // 비밀번호 오류
				}
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}	
		}
		return x;
	}
	
	// 아이디 확인 메서드
	public boolean confirmId(String id) {
		boolean check = false;
			try {
				conn=getConnection();
				String sql = "select id from member where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				if(rs.next()) { // 결과가 있으면, 이미 db에 동일한 id 가 있다.
					check = true;
				}				
			} catch (Exception e) {
				e.printStackTrace(); 
			}finally {
				if(rs != null)try {rs.close();}catch(SQLException e) {e.printStackTrace();}
				if(pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
				if(conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}	
			}
		return check;
	}
	
	
}
