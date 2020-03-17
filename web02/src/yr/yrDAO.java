package yr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sun.corba.se.spi.activation.LocatorPackage.ServerLocation;

public class yrDAO {
	
	private PreparedStatement pstmt = null;
	private Connection conn = null;
	private ResultSet rs = null;

	private Connection getConnection() throws Exception {
		Connection conn = null;
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");
		conn = ds.getConnection();
		
		return conn;
				
	}
	
	yrDTO dto = new yrDTO();
	
	
	
	public boolean loginCheck(String id, String pw) {
		
		boolean check = false;
		
		try {
			conn = getConnection();
			String sql = "select * from mapmember where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()) {				
				check = true;
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs!=null)try{rs.close();}catch(SQLException e){e.printStackTrace();}
			if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
		return check;		
	}

	
	public void signupMember(String id, String pw) {
		try {			
			conn = getConnection();
			String sql = "insert into mapmember (id, pw) values (?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
	}
	
	public List	login(String id) {
		List list = null;
		try {
			conn = getConnection();
			String sql = "select * from mapmember where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				yrDTO dto = new yrDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				list.add(dto);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
		return list;
	}
	
	public void	setGeolocation(String id, String latitude, String longitude) {
		try {
			conn = getConnection();
			String sql = "insert into map values (?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2,latitude);
			pstmt.setString(3, longitude);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			
		} finally {
			if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
	}
	
	public List	getGeolocation(String id) {
		List list = null;
		try {
			conn = getConnection();
			String sql = "select * from map where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				yrDTO dto = new yrDTO();
				dto.setId(rs.getString("id"));
				dto.setLatitude(rs.getString("latitude"));
				dto.setLongitude(rs.getString("longitude"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
		return list;
	}
	
	public void createRoom(String id, String roomPw, String subject, String latitude, String longitude) {
		try {			
			conn = getConnection();			
			String sql = "insert into maproom (id, roomPw, ref, subject, latitude, longitude, no, ref2) values (?,?,createRoom_seq.nextVal,?,?,?,?,MAPROOM_SEQ2.nextval)";
			pstmt = conn.prepareStatement(sql);
			int no = 1;
			pstmt.setString(1, id);
			pstmt.setString(2, roomPw);
			pstmt.setString(3, subject);
			pstmt.setString(4, latitude);
			pstmt.setString(5, longitude);			
			pstmt.setInt(6, no);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {			
			if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
	}
	
	public int getNo(int ref) {
		int no = 0;
		try {
			conn = getConnection();
			String sql = "select max(no) from maproom where ref = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				no = rs.getInt(1) + 1;
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
		return no;
	}
	
	
	
	public List roomList() {
		List list = null;
		int count = 0;
		try {
			conn = getConnection();
			
			String sql1 = "select count(*) from maproom where no = '1'";
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			String sql = "select * from maproom where no = 1 order by ref";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();			
			list = new ArrayList();
			if(rs.next()) {
				do {
					yrDTO dto = new yrDTO();
					dto.setId(rs.getString("id"));
					dto.setPw(rs.getString("roompw"));
					dto.setRef(rs.getString("ref"));
					dto.setSubject(rs.getString("subject"));
					list.add(dto);					
				}while(rs.next());				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();}catch(SQLException e) {e.printStackTrace();}
			if(pstmt != null) try {pstmt.close();}catch(SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();}catch(SQLException e) {e.printStackTrace();}
		}
		return list;
	}

	public boolean checkPw(String pw, int ref) {
		boolean check = false;
		try {
			conn = getConnection();
			String sql = "select * from maproom where ref=? and roompw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(2, pw);
			pstmt.setInt(1, ref);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				check = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}		
		return check;
	}
	
	public void joinRoom(String id, String ref, String latitude, String longitude) {
		try {
			conn = getConnection();
			String sql = "insert into maproom (id, latitude, longitude) values (?,?,?) where ref=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, latitude);
			pstmt.setString(3, longitude);
			pstmt.setString(4, ref);
			pstmt.executeUpdate();	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
	}
	
	
	public yrDTO room(String ref) {
		yrDTO dto = null;
		
		try {
			conn = getConnection();
			String sql = "select * from maproom where ref = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ref);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString(columnIndex));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		
		
		return dto;
	}
	
}
