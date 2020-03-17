package web.jsp1230.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.websocket.Session;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MemberDAO {

	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private Connection conn = null;
	
	private Connection getConnection() throws Exception{
		
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");
		conn = ds.getConnection();
	
		return conn;
	}
	
	public void insertMember(MemberDTO dto) {		
			System.out.println(dto.getImg()+"DAO");
			try {
				conn = getConnection();
				String sql = "insert into signup (id, pw, pwCh, img, name, birth, email) values (?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPw());
				pstmt.setString(3, dto.getPwCh());
				pstmt.setString(4, dto.getImg());
				pstmt.setString(5, dto.getName());
				pstmt.setString(6, dto.getBirth());
				pstmt.setString(7, dto.getEmail());
				pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if( pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
				if( conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}
			} 
		}
	
	// 로그인 확인 메서드
	public boolean loginCheck(String id, String pw) {
		System.out.println("확인메서드1");
		boolean check = false;
		
		try {
			conn = getConnection();
			String sql = "select * from signup where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("확인메서드2");	
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
	
	public MemberDTO modify(String id) {	
		MemberDTO dto = new MemberDTO();
		try {
			conn = getConnection();
			String sql = "select * from signup where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {		
				dto.setPw(rs.getString("pw"));
				dto.setPwCh(rs.getString("pwCh"));
				dto.setImg(rs.getString("img"));
				dto.setName(rs.getString("name"));
				dto.setBirth(rs.getString("birth"));
				dto.setEmail(rs.getString("email"));				
			}
			
		} catch (Exception e) {e.printStackTrace();} finally {
			if(rs != null)try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null)try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}		
		return dto;		
	}
	
	public List getImg(String id) {
		List list = null;
		try {
			conn = getConnection();
			String sql = "select * from signup where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList();
				do {
					list.add(rs.getString("img"));
				}while(rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)try {rs.close();}catch(SQLException e){e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e){e.printStackTrace();}
			if(conn!=null)try {conn.close();}catch(SQLException e){e.printStackTrace();}
		}
		return list;				
	}	
	
	public MemberDTO getImg2(String id) {
		System.out.println("aaa");
		MemberDTO dto = null;
		try {
			conn = getConnection();
			String sql = "select * from signup where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setImg(rs.getString("img"));	
				System.out.println(rs.getString("img"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)try {rs.close();}catch(SQLException e){e.printStackTrace();}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException e){e.printStackTrace();}
			if(conn!=null)try {conn.close();}catch(SQLException e){e.printStackTrace();}
		}
		return dto;
	}	
	
	
	public void update(MemberDTO dto) {
		try {
			conn = getConnection();
			String sql = "update signup set pw=?, pwCh=?, img=?, name=?, birth=?, email=? where id="+"'"+dto.getId()+"'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getPwCh());
			pstmt.setString(3, dto.getImg());
			pstmt.setString(4, dto.getName());
			pstmt.setString(5, dto.getBirth());
			pstmt.setString(6, dto.getEmail());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try {pstmt.close();}catch (SQLException e){e.printStackTrace();}
			if(conn != null)try {conn.close();}catch (SQLException e){e.printStackTrace();}			
		}
		
	}
}
