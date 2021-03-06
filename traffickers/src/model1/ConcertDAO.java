package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

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
			String sql = "insert into tr_concert values(0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,  now())";
			
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
			pstmt.setString(11, to.getcDate());
			pstmt.setString(12, to.getCprice());
			pstmt.setString(13,  to.getCplace());
			pstmt.setString(14,  to.getClink());
			pstmt.setString(15,  to.getCurl());
			pstmt.setString(16,  to.getCetc());				
			
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
		String pageURL = listTO.getPageURL();
		
	    try{
		    conn = dataSource.getConnection();
		    
		    String sql = "select "
		    		+ "c.idx,"
		    		+ "c.ctype,"
		    		+ "c.mem_idx,"
		    		+ "m.id,"
		    		+ "c.view_yn,"
		    		+ "c.view_level,"
		    		+ "c.subject,"
		    		+ "c.fileName,"
		    		+ "c.dataName,"
		    		+ "c.ctime,"
		    		+ "c.cDate,"		    		
		    		+ "c.cprice,"
		    		+ "c.cplace,"
		    		+ "c.contents,"
		    		+ "c.curl,"
		    		+ "c.cetc,"
		    		+ "c.wdate"
		    		+ " from traffickers.tr_concert c left join traffickers.tr_member m on c.mem_idx = m.idx order by c.idx desc";
		    System.out.println(sql);
		    pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		    
		    rs = pstmt.executeQuery();
		    
		    rs.last();
		    listTO.setTotalRecord(rs.getRow());
		    rs.beforeFirst();
		    
		    listTO.setTotalPage(((listTO.getTotalRecord() -1) / recordPerPage) + 1);
		    listTO.setPageURL(pageURL);
		    
		    int skip = (cpage-1) * recordPerPage;
		    if (skip != 0) rs.absolute(skip);
		    
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
		    	cto.setcDate(rs.getString("cDate"));
		    	cto.setCprice(rs.getString("cprice"));
		    	cto.setCplace(rs.getString("cplace"));
		    	cto.setWdate(rs.getString("wdate"));
		    	cto.setCurl(rs.getString("curl"));
		    	cto.setContents(rs.getString("contents"));
		    	cto.setCetc(rs.getString("cetc"));
		    	
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
	
	public ListTO ConcertList_indie(ListTO listTO){
	    
		int cpage = listTO.getCpage();
		int recordPerPage = listTO.getRecordPerPage();
		int blockPerPage = listTO.getBlockPerPage();
		String pageURL = listTO.getPageURL();
		
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
		    		+ "c.cDate, "		    		
		    		+ "c.cprice, "
		    		+ "c.cplace, "
		    		+ "c.wdate "
		    		+ "from tr_concert c left join tr_member m on c.mem_idx = m.idx "
		    		+ "where c.ctype = 0 "
		    		+ "order by c.idx desc";
		    
		    pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		    System.out.println("[concertList] :" + pstmt.toString());
		    
		    rs = pstmt.executeQuery();
		    	    
		    rs.last();
		    listTO.setTotalRecord(rs.getRow());
		    rs.beforeFirst();
		    		    
		    listTO.setTotalPage(((listTO.getTotalRecord() -1) / recordPerPage) + 1);
		    listTO.setPageURL(pageURL);
		    
		    int skip = (cpage-1) * recordPerPage;
		    if (skip != 0) rs.absolute(skip);
		    
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
		    	cto.setcDate(rs.getString("cDate"));
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

	public int ConcertDeleteOk(ConcertTO to) {
		int flag = 1;
		
		try {
			conn = dataSource.getConnection();
			String sql = "delete from tr_concert where idx = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  to.getCidx());		
			
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
	
	// app에서 인디 등록
	public int App_indieWriteOk(ConcertTO cto) {
		
		int flag = 0;
		
		try {
			conn = dataSource.getConnection();
			String sql = "insert into tr_concert values(0, ?, ?, 0, 0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '', ?,  now())";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cto.getCtype());
			pstmt.setInt(2, cto.getMem_idx());
			pstmt.setString(3, cto.getSubject());
			pstmt.setString(4, cto.getContents());
			pstmt.setString(5, cto.getPosterName());
			pstmt.setString(6, cto.getPosterData());
			pstmt.setLong(7, cto.getPosterSize());
			pstmt.setString(8, cto.getCtime());
			pstmt.setString(9, cto.getcDate());
			pstmt.setString(10, cto.getCprice());
			pstmt.setString(11,  cto.getCplace());
			pstmt.setString(12,  cto.getClink());
			pstmt.setString(13,  cto.getCetc());
			int result = pstmt.executeUpdate();
						
			if(result == 1) {
				flag = 1;
				
				System.out.println("[등록]" + pstmt.toString());				
				
			}
		} catch(SQLException e) {
			System.out.println("[sql 에러] : "+ e.getMessage());
		}finally {
			if(pstmt != null) try{pstmt.close();}catch(SQLException e) {}
			if(conn != null) try{conn.close();}catch(SQLException e) {}
		}
		   return flag;		
	}
	
	public ArrayList<ConcertTO> AppListView(ConcertTO cto){		
		
		Calendar now = Calendar.getInstance();
		
		int atype = cto.getList_Type(); 
		String search_value = "";
		String sql = "select idx, subject, cPlace, cTime, fileName, dataName from tr_concert where";
		
		// 1 - 통합검색 / 2 - 날짜검색 / 3 - 장르검색 / 4 - 지역검색 / 5 - 공연검색		
		if(atype == 2) {
			String sdate = Integer.parseInt(cto.getList_Value()) < 10 ? "0"+cto.getList_Value() : cto.getList_Value();  
			search_value = now.get(Calendar.YEAR)+"-"+sdate+"%";
			sql += " cDate like ?"; 
		}else if(atype == 3) {
			search_value = cto.getList_Value();
			sql += " cType = ?" ;
		}else if(atype == 4) {
			search_value = cto.getList_Value()+"%";
			sql += " cPlace like ?";
		}else if(atype == 5) {
			search_value = cto.getList_Value();
			if(search_value.equals("0")) {
				sql += " cType = ?";
			}else if(search_value.equals("1")) {
				search_value = "0";
				sql += " cType != ?";
			}	
		}else {
			search_value = "%"+cto.getList_Value()+"%";
			sql += " subject like ?";
		}
		
		sql += " order by idx desc";
		
	    ArrayList<ConcertTO> lists = new ArrayList<ConcertTO>();			    
		
		try {
			conn = dataSource.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search_value);
			
			System.out.println("[pstmt] : " + pstmt.toString());
			
			rs = pstmt.executeQuery();
									
			while(rs.next()) {
				ConcertTO to = new ConcertTO();
				to.setCidx(rs.getInt("idx"));
				to.setPosterName(rs.getString("fileName"));
				to.setSubject(rs.getString("subject"));
				to.setCplace(rs.getString("cPlace"));
				to.setCtime(rs.getString("cTime"));
				lists.add(to);
			}			
			
			//cto.setConcertlists(lists);
		} catch (SQLException e) {
			System.out.println("[SQL 에러] : " + e.getMessage());
		} finally{
			if(rs != null) try {rs.close();}catch(SQLException e) {}
			if(pstmt != null) try{pstmt.close();}catch(SQLException e) {}
			if(conn != null) try{conn.close();} catch(SQLException e) {}
	    }
		
		return lists;
	}
	
	public ConcertTO AppDetailView(ConcertTO to) {
		int idx = to.getCidx();

		String sql = "select idx, view_level, subject, cTime, cPlace, cPrice, cDate, contents, cetc, ctype, clink, fileName from tr_concert where idx = ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				to.setcFlag(1);
				to.setCidx(rs.getInt("idx"));
				to.setView_level(rs.getInt("view_level"));
				to.setSubject(rs.getString("subject"));
				to.setCtime(rs.getString("cTime"));
				to.setCplace(rs.getString("cPlace"));
				to.setCprice(rs.getString("cPrice"));
				to.setcDate(rs.getString("cDate"));
				to.setContents(rs.getString("contents"));
				to.setCetc(rs.getString("cetc"));
				to.setCtype(rs.getInt("CType"));
				to.setClink(rs.getString("clink"));
				to.setPosterName(rs.getString("fileName"));	
				
				System.out.println(pstmt.toString());
			}
		} catch (SQLException e) {
				to.setcFlag(0);
			// TODO Auto-generated catch block
			System.out.println("[에러] : " + e.getMessage());
		}
		
		return to;
	}
	
	public ArrayList<ConcertTO> AppMainScrollView(){
		String sql = "select idx, fileName from tr_concert where view_level between 1 and 10";
		
	    ArrayList<ConcertTO> lists = new ArrayList<ConcertTO>();			    
		
		try {
			conn = dataSource.getConnection();
			
			pstmt = conn.prepareStatement(sql);			
			System.out.println("[pstmt] : " + pstmt.toString());			
			rs = pstmt.executeQuery();
									
			while(rs.next()) {
				ConcertTO to = new ConcertTO();
				to.setCidx(rs.getInt("idx"));
				to.setPosterName(rs.getString("fileName"));
				lists.add(to);
			}			
			
			//cto.setConcertlists(lists);
		} catch (SQLException e) {
			System.out.println("[SQL 에러] : " + e.getMessage());
		} finally{
			if(rs != null) try {rs.close();}catch(SQLException e) {}
			if(pstmt != null) try{pstmt.close();}catch(SQLException e) {}
			if(conn != null) try{conn.close();} catch(SQLException e) {}
	    }
		
		return lists;
	}	
	
	public ConcertTO ConcertModify(ConcertTO cto) {		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {			
			conn = dataSource.getConnection();
			
			String sql = "select "
		    		+ "c.idx,"//idx
		    		+ "c.ctype,"//공연타입
		    		+ "c.mem_idx,"//회원idx
		    		+ "m.id,"//회원id
		    		+ "c.view_yn,"//등록승인상태
		    		+ "c.view_level,"//메인페이지 노출 레벨
		    		+ "c.subject," //제목
		    		+ "c.fileName," //파일명(원본)
		    		+ "c.dataName," //서버 보유 파일명
		    		+ "c.ctime," //시간		    		    		
		    		+ "c.cprice,"//금액
		    		+ "c.cplace,"//장소		    		
		    		+ "c.clink," //홍보사이트
		    		+ "c.curl," // 예메사이트*
		    		+ "c.contents," //내용
		    		+ "c.cetc " // 기타사항
		    		+ "from tr_concert c left join tr_member m on c.mem_idx = m.idx where c.idx=?";	
						
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);		
			pstmt.setInt(1, cto.getCidx());
			
			rs = pstmt.executeQuery();	
			
			if(rs.next()) {
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
		    	cto.setClink(rs.getString("clink"));		    	
		    	cto.setCurl(rs.getString("curl"));
		    	cto.setContents(rs.getString("contents"));
		    	cto.setCetc(rs.getString("cetc"));		    			    			    
			}			
		} catch(SQLException e) {
			System.out.println("에러 : " + e.getMessage());
		} finally {
			if(rs !=null) try {rs.close();} catch(SQLException e) {};
			if(pstmt !=null) try {pstmt.close();} catch(SQLException e) {};
			if(conn !=null) try {conn.close();} catch(SQLException e) {};	
		}		
		return cto;
	}
	
	public int ConcertModifyOk(ConcertTO cto) {
		Connection conn = null;
	    PreparedStatement pstmt = null; 
	    String filename = cto.getPosterName();
	    int flag = 2; 
	    
	    try{
		    conn = dataSource.getConnection();
		    
		    // 업로드 파일이 있을때
		    String sql1 = "update tr_concert set "
		    		+ "view_yn = ?,"
		    		+ "view_level = ?,"
		    		+ "subject = ?,"
		    		+ "contents = ?,"		    		
		    		+ "filename = ?,"
		    		+ "dataname = ?,"
		    		+ "filesize = ?,"
		    		+ "ctime = ?,"
		    		+ "cprice = ?,"
		    		+ "cplace = ?,"
		    		+ "clink = ?,"
		    		+ "curl = ?,"
		    		+ "ctype = ?,"
		    		+ "cetc = ?"
		    		+ " where idx = ?";
		    // 업로드 파일이 없을때
		    String sql2 = "update tr_concert set "
		    		+ "view_yn = ?,"
		    		+ "view_level = ?,"
		    		+ "subject = ?,"
		    		+ "contents = ?,"		    		
		    		+ "ctime = ?,"
		    		+ "cprice = ?,"
		    		+ "cplace = ?,"
		    		+ "clink = ?,"
		    		+ "curl = ?,"
		    		+ "ctype = ?,"
		    		+ "cetc = ?"
		    		+ " where idx = ?";
		    if(filename == null) {//업로드 파일이 없을때
		    	pstmt = conn.prepareStatement(sql2);
		    	
		    	 pstmt.setInt(1, cto.getView_yn());
				    pstmt.setInt(2, cto.getView_level());		    
				    pstmt.setString(3, cto.getSubject());
				    pstmt.setString(4, cto.getContents());
				    pstmt.setString(5, cto.getCtime());
				    pstmt.setString(6, cto.getCprice());
				    pstmt.setString(7, cto.getCplace());
				    pstmt.setString(8, cto.getClink());
				    pstmt.setString(9, cto.getCurl());
				    pstmt.setInt(10, cto.getCtype());
				    pstmt.setString(11, cto.getCetc());
				    pstmt.setInt(12, cto.getCidx());
		    } else {//파일이 있을때
		    	pstmt = conn.prepareStatement(sql1);
		    	
		    	pstmt.setInt(1, cto.getView_yn());
			    pstmt.setInt(2, cto.getView_level());		    
			    pstmt.setString(3, cto.getSubject());
			    pstmt.setString(4, cto.getContents());
			    pstmt.setString(5, cto.getPosterName());
			    pstmt.setString(6, cto.getPosterData());
			    pstmt.setLong(7, cto.getPosterSize());
			    pstmt.setString(8, cto.getCtime());
			    pstmt.setString(9, cto.getCprice());
			    pstmt.setString(10, cto.getCplace());
			    pstmt.setString(11, cto.getClink());
			    pstmt.setString(12, cto.getCurl());
			    pstmt.setInt(13, cto.getCtype());
			    pstmt.setString(14, cto.getCetc());
			    pstmt.setInt(15, cto.getCidx());
		    }		    		
		    
		    System.out.println("idx 받아왔냐 : "+cto.getCidx());
		    System.out.println("filesize 받아왔냐 : "+cto.getPosterSize());
		    
		    int result = pstmt.executeUpdate();
		   
		    System.out.println("modify 쿼리 값 : "+result);
		    
		   if(result == 0){			   
			   flag = 1;
		   }else if(result == 1){
			   flag = 0;
		   }
		    
	    } catch(SQLException e){
	    	System.out.println("SQL 에러 : "+ e.getMessage());
	    } finally{
	    	if(pstmt != null) try{pstmt.close();}catch(SQLException e) {}
			if(conn != null) try{conn.close();}catch(SQLException e) {}
	    }
		return flag;
	}
}