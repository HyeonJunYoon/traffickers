package model2;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model1.ConcertTO;
import model1.ConcertDAO;

public class App_IndieWrite implements AppAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		//System.out.println("LoginCheckApp 확인");
				
		ConcertTO cto = new ConcertTO();
		
		//String uploardpath = "C:/02.Language/06.git/traffickers/traffickers/WebContent/upload/";
		String uploardpath = "/usr/local/tomcat/webapps/traffickers/upload/";
		int maxFileSize = 1024 * 1024 * 2; // 2mb 를 풀어서
		String encoding = "utf-8";
		int flag = 0;
			
		try {
			MultipartRequest multi = 
					new MultipartRequest(request, uploardpath, maxFileSize, encoding, new DefaultFileRenamePolicy());								
										
			cto.setMem_idx(Integer.parseInt(multi.getParameter("mem_idx") == null ? "0" : multi.getParameter("mem_idx").equals("") ? "0" : multi.getParameter("mem_idx")));
			cto.setSubject(URLDecoder.decode(multi.getParameter("subject") != null ? multi.getParameter("subject") : "", "utf-8"));
			cto.setCtime(URLDecoder.decode(multi.getParameter("cTime") != null ? multi.getParameter("cTime") : "", "utf-8"));			
			cto.setCprice(URLDecoder.decode(multi.getParameter("cplace") != null ? multi.getParameter("cplace") : "", "utf-8"));
			cto.setCplace(URLDecoder.decode(multi.getParameter("cprice") != null ? multi.getParameter("cprice") : "", "utf-8"));
			cto.setcDate(URLDecoder.decode(multi.getParameter("cDate") != null ? multi.getParameter("cDate") : "", "utf-8"));
			cto.setContents(URLDecoder.decode(multi.getParameter("contents") !=null ? multi.getParameter("contents") : "", "utf-8"));			
			cto.setPosterName(URLDecoder.decode(multi.getFilesystemName("filename") != null ? multi.getFilesystemName("filename") : "", "utf-8"));
			cto.setPosterData(URLDecoder.decode(multi.getOriginalFileName("filename") != null ? multi.getOriginalFileName("filename") : "", "utf-8"));			
			cto.setCetc(URLDecoder.decode(multi.getParameter("etc") != null ? multi.getParameter("etc") : "" , "utf-8"));
			
			if(cto.getMem_idx() == 0 || cto.getSubject().equals("") || cto.getCtime().equals("") || cto.getCplace().equals("") || cto.getCprice().equals("") || cto.getcDate().equals("") || cto.getContents().equals("")) {
					cto.setcFlag(5);					
			}
			
			 if(multi.getOriginalFileName("filename") != null) {					
					File file = multi.getFile("filename");
					cto.setPosterSize(file.length());
			}else {
					cto.setcFlag(5);
			}
					
		} catch (Exception e) {
			System.out.println("[에러] : " + e.getMessage());
		}   		
		
		ConcertDAO dao = new ConcertDAO();
		
		if(cto.getcFlag() != 5) {
			flag = dao.App_indieWriteOk(cto);	
		}else {
			flag = cto.getcFlag();
		}
   		   		
   		request.setAttribute("flag", flag);
	}
}