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
			
			int Mem_idx 	= Integer.parseInt(multi.getParameter("mem_idx") == null ? "0" : multi.getParameter("mem_idx").equals("") ? "0" : multi.getParameter("mem_idx"));
			String subject 	= multi.getParameter("subject") != null ? URLDecoder.decode(multi.getParameter("subject"), "utf-8") : ""; 
			String ctime	= multi.getParameter("ctime") != null ? URLDecoder.decode(multi.getParameter("ctime"), "utf-8") : "";
			String cprice	= multi.getParameter("cplace") != null ? URLDecoder.decode(multi.getParameter("cplace"), "utf-8") : "";
			String cplace 	= multi.getParameter("cprice") != null ? URLDecoder.decode(multi.getParameter("cprice"), "utf-8") : "";
			String cDate 	= multi.getParameter("cDate") != null ? URLDecoder.decode(multi.getParameter("cDate"), "utf-8") : "";
			String content = multi.getParameter("content") !=null ? URLDecoder.decode(multi.getParameter("content"), "utf-8") : "";
			String pName	= multi.getFilesystemName("filename") != null ? URLDecoder.decode(multi.getFilesystemName("filename"), "utf-8") : "";
			String pDate	= multi.getOriginalFileName("filename") != null ? URLDecoder.decode(multi.getOriginalFileName("filename"), "utf-8") : "";
			String cEtc		= multi.getParameter("etc") != null ? URLDecoder.decode(multi.getParameter("etc"), "utf-8") : ""; 
			int cType		= Integer.parseInt(multi.getParameter("ctype") == null ? "0" : multi.getParameter("ctype").equals("") ? "0" : multi.getParameter("ctype"));
			String clink		= multi.getParameter("clink") != null ? URLDecoder.decode(multi.getParameter("clink"), "utf-8") : "";
			
					
			cto.setMem_idx(Mem_idx);
			cto.setSubject(subject);
			cto.setCtime(ctime);
			cto.setCprice(cprice);
			cto.setCplace(cplace);
			cto.setcDate(cDate);			
			cto.setContents(content);			
			cto.setPosterName(pName);
			cto.setPosterData(pDate);
			cto.setCetc(cEtc);
			cto.setCtype(cType);
			cto.setClink(clink);
			
			
			if(Mem_idx == 0 || subject.equals("") || ctime.equals("") || cplace.equals("") || cprice.equals("") || cDate.equals("") || content.equals("")) {
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