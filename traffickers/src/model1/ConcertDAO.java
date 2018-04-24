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


public class ConcertDAO {
	private DataSource dataSource;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ConcertDAO() {
	    try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			dataSource = (DataSource)envCtx.lookup("jdbc/mysql1");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] : "+e.getMessage());
		}
	}

	public void concertWrite() {
		
	}
	
	public int ConcertWriteOk(ConcertTO to) {
		
		int flag = 1;
			
		try {
			conn = dataSource.getConnection();
			String sql = "insert into tr_concert values(0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  now())";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  to.getCtype());
			pstmt.setInt(2, to.getMem_idx());
			pstmt.setInt(3, to.getView_yn());
			pstmt.setInt(4, to.getView_level());
			pstmt.setString(5, to.getSubject());
			pstmt.setString(6, to.getContents());
			pstmt.setString(7, to.getPosterName());
			pstmt.setString(8, to.getPosterData());
			pstmt.setLong(9, to.getPosterSize());
			pstmt.setString(10, to.getCtime());
			pstmt.setString(11, to.getCprice());
			pstmt.setString(12,  to.getCplace());
			pstmt.setString(13,  to.getClink());
			pstmt.setString(14,  to.getCurl());
			pstmt.setString(15,  to.getCetc());		
			
			int result = pstmt.executeUpdate();
						
			if(result == 1) {
				flag = 0;
			}
		} catch(SQLException e) {
			System.out.println("[sql 에러] : "+ e.getMessage());
		}finally {
			if(pstmt != null) try{pstmt.close();}catch(SQLException e) {}
			if(conn != null) try{conn.close();}catch(SQLException e) {}
		}
		   return flag;		
	}
	
	public ListTO ConcertList(ListTO listTO){
	    
		int cpage = listTO.getCpage();
		int recordPerPage = listTO.getRecordPerPage();
		int blockPerPage = listTO.getBlockPerPage();
		
	    try{
		    conn = dataSource.getConnection();
		    
		    String sql = "select "
		    		+ "c.idx, "
		    		+ "c.ctype, "
		    		+ "c.mem_idx, "
		    		+ "m.id, "
		    		+ "c.view_yn, "
		    		+ "c.view_level, "
		    		+ "c.subject, "
		    		+ "c.fileName, "
		    		+ "c.dataName, "
		    		+ "c.ctime, "
		    		+ "c.cprice, "
		    		+ "c.cplace, "
		    		+ "c.wdate "
		    		+ "from tr_concert c left join tr_member m on c.mem_idx = m.idx order by c.idx desc";
		    
		    pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		    
		    rs = pstmt.executeQuery();
		    
		    rs.last();
		    listTO.setTotalRecord(rs.getRow());
		    rs.beforeFirst();
		    
		    listTO.setTotalPage(((listTO.getTotalRecord() -1) / recordPerPage) + 1);
		    
		    int skip = (cpage-1) * recordPerPage;
		    
		    ArrayList<ConcertTO> lists = new ArrayList();
		    for(int i=0; i<recordPerPage && rs.next(); i++) {
		    	ConcertTO cto = new ConcertTO();
		    	cto.setCidx(rs.getInt("idx"));
		    	cto.setCtype(rs.getInt("ctype"));
		    	cto.setMem_idx(rs.getInt("mem_idx"));
		    	cto.setUser_id(rs.getString("id"));
		    	cto.setView_yn(rs.getInt("view_yn"));
		    	cto.setView_level(rs.getInt("view_level"));
		    	cto.setSubject(rs.getString("subject"));
		    	cto.setPosterName(rs.getString("fileName"));
		    	cto.setPosterData(rs.getString("dataName"));
		    	cto.setCtime(rs.getString("ctime"));
		    	cto.setCprice(rs.getString("cprice"));
		    	cto.setCplace(rs.getString("cplace"));
		    	cto.setWdate(rs.getString("wdate"));
		    	
		    	lists.add(cto);
		    }
		    listTO.setConcertlists(lists);
		    
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
	
}