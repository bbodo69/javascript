package web.jsp1217.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class TestDAO03 {
	public void insertMember(String id, String pw){
		try{
			Context cnt = new InitialContext();			
			Context env = (Context)cnt.lookup("java:comp/env");
			DataSource ds = (DataSource)env.lookup("jdbc/orcl");
			Connection conn = ds.getConnection();
			
			String sql = "insert into test values(?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();						
		}
	}	
}
