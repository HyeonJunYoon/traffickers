package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
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
	    
		to.setFlag(0);
		
	    try{
		    conn = dataSource.getConnection();
		    
		    String sql = "select aid, alevel from tr_admininfo where aid=? and apwd=PASSWORD(?)";
		    
		    pstmt = conn.prepareStatement(sql);
		   
		    pstmt.setString(1, to.getAdminID());
		    pstmt.setString(2, to.getAdminPWD());
		    
		    System.out.println("[로그인확인]" + pstmt.toString());
		    	   
		    rs = pstmt.executeQuery();
			   
		    if(rs.next()){
		    	to.setAdminID(rs.getString("aid"));
		    	to.setAdminLevel(rs.getInt("alevel"));
		    	to.setFlag(1);
		    }
		    
	    } catch(SQLException e){
	    	System.out.println("SQL 에러 : "+ e.getMessage());
	    } finally{
	    	if(pstmt != null) try{pstmt.close();}catch(SQLException e) {}
			if(conn != null) try{conn.close();}catch(SQLException e) {}
	    }
		return to;
	}
	
	public MemberTO AppMemberCheck(MemberTO to) {
	    try{
		    conn = dataSource.getConnection();
		    
		    String sql = "select idx, id, nickName, ctype from tr_member where id=? and pwd=PASSWORD(?)";
		    
		    pstmt = conn.prepareStatement(sql);
		   
		    pstmt.setString(1, to.getUserID());
		    pstmt.setString(2, to.getUserPWD());
		    	   
		    rs = pstmt.executeQuery();
			   
		    if(rs.next()){
		    	System.out.println("[로그인 확인] :  idx : " + rs.getInt("idx") + " / id : "+ rs.getString("id")+ " / nickName : "+ rs.getString("nickName")+ " / ctype : "+ rs.getString("ctype"));
		    	to.setFlag(1);
		    	to.setUserIdx(rs.getInt("idx"));
		    	to.setUserID(rs.getString("id"));
		    	to.setNickName(rs.getString("nickName"));
		    	to.setJoinType(rs.getInt("ctype"));
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
	
	public int AppMemberJoin(MemberTO to) {
		
		int flag = 0;		
		
	    try{
		    conn = dataSource.getConnection();
		    	    
		    String sql = "insert into tr_member values (0, ?, PASSWORD(?), ?, ?, ?, ?, now(), 0)";
		    
		    pstmt = conn.prepareStatement(sql);
		   		    
		    pstmt.setString(1, to.getUserID());
		    pstmt.setString(2, to.getUserPWD());
		    pstmt.setString(3, to.getNickName());
		    pstmt.setString(4, to.getBirth());
		    pstmt.setInt(5, to.getSex());
		    pstmt.setInt(6,  to.getJoinType());
		    
		    System.out.println(pstmt.toString());
		    	   
		    int result = pstmt.executeUpdate();
			   
			   if(result == 1){
				   flag = 1;
			   }
			   
			} catch(Exception e) {
				System.out.println("[에러] : "+ e.getMessage());
			}finally {
				if(pstmt != null) try{pstmt.close();}catch(SQLException e) {}
				if(conn != null) try{conn.close();}catch(SQLException e) {}
			}
	    
		   return flag;
		}
	
	public int AppIdenticalCheck(MemberTO mto) {
		
		int result = 11;
		
		String icType = mto.getIcType() > 1 ? "id" : "nickName";
			
		try {
			conn = dataSource.getConnection();
			
			String sql = "select count(*) as checkNum from tr_member where "+ icType +" = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mto.getIcValue());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("checkNum");
			}
		} catch (SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
	    	if(pstmt != null) try{pstmt.close();}catch(SQLException e) {}
			if(conn != null) try{conn.close();}catch(SQLException e) {}
		}
		
		int flagNum;
		if(mto.getIcType() == 1) {
			flagNum = result == 1 ? 5 : result == 0 ? 4 : result;			
		}else {
			flagNum = result == 1 ? 3 : result == 0 ? 2 : result;
		}
		
		return flagNum;
	}
	
	public ListTO MemberList(ListTO listTO){
	    
		int cpage = listTO.getCpage();
		int recordPerPage = listTO.getRecordPerPage();
		int blockPerPage = listTO.getBlockPerPage();
		String pageURL = listTO.getPageURL();
		
		
	    try{
		    conn = dataSource.getConnection();
		    
		    String sql = "select * from tr_member order by idx desc";
		    
		    pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		    System.out.println("[memberList] :" + pstmt.toString());
		    
		    rs = pstmt.executeQuery();
		    
		    rs.last();
		    listTO.setTotalRecord(rs.getRow());
		    rs.beforeFirst();
		    
		    listTO.setTotalPage(((listTO.getTotalRecord() -1) / recordPerPage) + 1);
		    listTO.setPageURL(pageURL);
		    
		    int skip = (cpage-1) * recordPerPage;
		    if (skip != 0) rs.absolute(skip);
		    
		    ArrayList<MemberTO> lists = new ArrayList();
		    for(int i=0; i<recordPerPage && rs.next(); i++) {
		    	MemberTO mto = new MemberTO();
		    	mto.setUserIdx(rs.getInt("idx"));
		    	mto.setUserID(rs.getString("id"));
		    	mto.setNickName(rs.getString("nickName"));
		    	mto.setBirth(rs.getString("birth"));
		    	mto.setSex(rs.getInt("sex"));
		    	mto.setJoinType(rs.getInt("ctype"));
		    	mto.setJoinDate(rs.getString("wdate"));
		    	mto.setStatus(rs.getInt("etc"));
		    	
		    	lists.add(mto);
		    }
		    listTO.setMemberlists(lists);
		    
		    listTO.setStartBlock(((cpage-1)/blockPerPage)*blockPerPage+1);
		    listTO.setEndBlock(((cpage-1)/blockPerPage)*blockPerPage + blockPerPage);
		    if(listTO.getEndBlock() >= listTO.getTotalPage()) {
		    	listTO.setEndBlock(listTO.getTotalPage());
		    }

		    } catch(SQLException e){
		    	System.out.println("SQL 에러 : "+ e.getMessage());
		    } finally{
		    	if(rs != null) try{rs.close();}catch(SQLException e) {}
				if(pstmt != null) try{pstmt.close();}catch(SQLException e) {}
				if(conn != null) try{conn.close();} catch(SQLException e) {}
		    }
		return listTO;
		}
	
		public int MemberStateChange(MemberTO to) {
				
				int flag = 0;
									
				try {
					conn = dataSource.getConnection();
					
					String sql = "update tr_member set etc = ? where idx = ?";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, to.getStatus());
					pstmt.setInt(1, to.getUserIdx());
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						flag = 1;
					}
				} catch (SQLException e) {
					System.out.println("[에러] : " + e.getMessage());
				} finally {
			    	if(pstmt != null) try{pstmt.close();}catch(SQLException e) {}
					if(conn != null) try{conn.close();}catch(SQLException e) {}
				}
												
				return flag;
			}	
}
