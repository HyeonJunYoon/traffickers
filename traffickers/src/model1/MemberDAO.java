package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	private DataSource dataSource;
	private Connection conn = null;
	private PreparedStatement pstmt = null; 	
	private ResultSet rs = null;
	
	public MemberDAO() {
	    try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			dataSource = (DataSource)envCtx.lookup("jdbc/mysql1");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : "+e.getMessage());
		}
	}
	
	public MemberTO AdminCheck(MemberTO to) {
	    
	    try{
		    conn = dataSource.getConnection();
		    
		    String sql = "select aid, alevel from tr_admininfo where aid='?' and apwd=PASSWORD('?')";
		    
		    pstmt = conn.prepareStatement(sql);
		   
		    pstmt.setString(1, to.getAdminID());
		    pstmt.setString(2, to.getAdminPWD());
		    	   
		    rs = pstmt.executeQuery();
			   
		    if(rs.next()){
		    	to.setAdminID(rs.getString("aid"));
		    	to.setAdminLevel(rs.getInt("alevel"));
		    } 		    
		    
	    } catch(SQLException e){
	    	System.out.println("SQL 에러 : "+ e.getMessage());
	    } finally{
	    	if(pstmt != null) try{pstmt.close();}catch(SQLException e) {}
			if(conn != null) try{conn.close();}catch(SQLException e) {}
	    }
		return to;
	}
	
	public MemberTO MemberCheck(MemberTO to) {
	    try{
		    conn = dataSource.getConnection();
		    
		    String sql = "select idx, id from tr_member where id=? and pwd=PASSWORD(?)";
		    
		    pstmt = conn.prepareStatement(sql);
		   
		    pstmt.setString(1, to.getUserID());
		    pstmt.setString(2, to.getUserPWD());
		    	   
		    rs = pstmt.executeQuery();
			   
		    if(rs.next()){
		    	System.out.println("idx : " + rs.getInt("idx") + "/ id : "+ rs.getString("id"));
		    	to.setFlag(1);
		    	to.setUserIdx(rs.getInt("idx"));
		    	to.setUserID(rs.getString("id"));
		    }else {
		    	to.setFlag(0);
		    }
		    
	    } catch(SQLException e){
	    	to.setFlag(2);
	    	System.out.println("SQL 에러 : "+ e.getMessage());
	    } finally{
	    	if(pstmt != null) try{pstmt.close();}catch(SQLException e) {}
			if(conn != null) try{conn.close();}catch(SQLException e) {}
	    }
		return to;		
	}
	
}
