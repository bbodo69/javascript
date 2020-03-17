package web.jsp1217.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class outDAO01 {
	
		private Connection conn = null;
	
	private Connection getConnection() throws Exception{
		
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");		
		return conn = ds.getConnection();	
	}
	
	
	public List selectAll() {
		
		List list = null;
		
		try {
			conn = getConnection();
			
			String sql = "select * from test";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			list = new ArrayList();
									
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
		
		
		
		
	}

}
