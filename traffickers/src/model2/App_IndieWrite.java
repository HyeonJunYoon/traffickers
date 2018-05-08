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
		int maxFileSize = 1024 * 1024 * 20; // 20mb 를 풀어서
		String encoding = "utf-8";
		int flag = 0;
		
		int Mem_idx 	= 0;
		String subject 	= ""; 
		String ctime	= "";
		String cplace	= "";
		String cprice 	= "";
		String cDate 	= "";
		String content = "";
		String pName	= "";
		String pDate	= "";
		String cEtc		= ""; 
		int cType		= 0;
		String clink		= "";				
			
		try {
			MultipartRequest multi = 
					new MultipartRequest(request, uploardpath, maxFileSize, encoding, new DefaultFileRenamePolicy());		
			
			if(Integer.parseInt(multi.getParameter("insertType")) == 1) {
				Mem_idx 	= Integer.parseInt(multi.getParameter("mem_idx") == null ? "0" : multi.getParameter("mem_idx").equals("") ? "0" : multi.getParameter("mem_idx"));
				subject 		= multi.getParameter("subject") != null ? multi.getParameter("subject") : ""; 
				ctime			= multi.getParameter("ctime") != null ? multi.getParameter("ctime") : "";
				cplace		= multi.getParameter("cplace") != null ? multi.getParameter("cplace") : "";
				cprice 		= multi.getParameter("cprice") != null ? multi.getParameter("cprice") : "";
				cDate 		= multi.getParameter("cDate") != null ? multi.getParameter("cDate") : "";
				content 		= multi.getParameter("content") !=null ? multi.getParameter("content") : "";
				pName		= multi.getFilesystemName("filename") != null ? multi.getFilesystemName("filename") : "";
				pDate			= multi.getOriginalFileName("filename") != null ? multi.getOriginalFileName("filename") : "";
				cEtc			= multi.getParameter("etc") != null ? multi.getParameter("etc") : ""; 
				cType		= Integer.parseInt(multi.getParameter("ctype") == null ? "0" : multi.getParameter("ctype").equals("") ? "0" : multi.getParameter("ctype"));
				clink			= multi.getParameter("clink") != null ? multi.getParameter("clink") : "";				
			}else{			
				 Mem_idx 	= Integer.parseInt(multi.getParameter("mem_idx") == null ? "0" : multi.getParameter("mem_idx").equals("") ? "0" : multi.getParameter("mem_idx"));
				 subject 	= multi.getParameter("subject") != null ? URLDecoder.decode(multi.getParameter("subject"), "utf-8") : ""; 
				 ctime	= multi.getParameter("ctime") != null ? URLDecoder.decode(multi.getParameter("ctime"), "utf-8") : "";
				 cplace	= multi.getParameter("cplace") != null ? URLDecoder.decode(multi.getParameter("cplace"), "utf-8") : "";
				 cprice 	= multi.getParameter("cprice") != null ? URLDecoder.decode(multi.getParameter("cprice"), "utf-8") : "";
				 cDate 	= multi.getParameter("cDate") != null ? URLDecoder.decode(multi.getParameter("cDate"), "utf-8") : "";
				 content = multi.getParameter("content") !=null ? URLDecoder.decode(multi.getParameter("content"), "utf-8") : "";
				 pName	= multi.getFilesystemName("filename") != null ? multi.getFilesystemName("filename") : "";
				 pDate	= multi.getOriginalFileName("filename") != null ? multi.getOriginalFileName("filename") : "";
				 cEtc		= multi.getParameter("etc") != null ? URLDecoder.decode(multi.getParameter("etc"), "utf-8") : ""; 
				 cType		= Integer.parseInt(multi.getParameter("ctype") == null ? "0" : multi.getParameter("ctype").equals("") ? "0" : multi.getParameter("ctype"));
				 clink		= multi.getParameter("clink") != null ? URLDecoder.decode(multi.getParameter("clink"), "utf-8") : "";
			}
			
			System.out.println("Midx:"+Mem_idx+"/ subject:"+ subject+"/ ctime:"+
			ctime+"/ cprice:"+cprice+"/ cplace: "+cplace+"/ cDate: "+cDate+"/ content:"+
			content+"/ pName: "+pName+"/ pDate:"+pDate+"/ cEtc: "+cEtc+"/ cType: "+cType+"/ clink:"+clink);
					
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
			
			 if(!pName.equals("") && cto.getcFlag() != 5) {
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