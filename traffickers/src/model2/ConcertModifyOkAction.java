package model2;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model1.ConcertDAO;
import model1.ConcertTO;

public class ConcertModifyOkAction implements ConcertAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("ConcertModifyOkAction 확인");
		
		ConcertTO cto = new ConcertTO();
		String uploardpath = "C:/Users/Lazna/git/traffickers/traffickers/WebContent/upload/";
		//String uploardpath = "/usr/local/tomcat/webapps/traffickers/upload/";
		int maxFileSize = 1024 * 1024 * 2; // 2mb 를 풀어서
		String encoding = "utf-8";				
		
		try {
			MultipartRequest multi = 
					new MultipartRequest(request, uploardpath, maxFileSize, encoding, new DefaultFileRenamePolicy());					
			String filename = multi.getFilesystemName("poster") != null ? URLDecoder.decode(multi.getFilesystemName("poster"), "utf-8"): "";
			
			cto.setView_yn(Integer.parseInt(multi.getParameter("view_yn")));
			cto.setView_level(Integer.parseInt(multi.getParameter("view_level")));
			cto.setSubject(multi.getParameter("subject"));
			cto.setContents(multi.getParameter("contents"));
			cto.setPosterName(multi.getFilesystemName("poster"));
			cto.setPosterData(multi.getOriginalFileName("poster"));						
			cto.setCtime(multi.getParameter("ctime"));
			cto.setCprice(multi.getParameter("cprice"));
			cto.setCplace(multi.getParameter("cplace"));
			cto.setClink(multi.getParameter("clink"));
			cto.setCurl(multi.getParameter("curl"));
			cto.setCetc(multi.getParameter("cetc"));
			cto.setCtype(Integer.parseInt(multi.getParameter("ctype")));
			cto.setCidx(Integer.parseInt(multi.getParameter("idx")));
					
			File file = multi.getFile("poster");
			
			System.out.println("filename 시스템이름 : "+ multi.getFilesystemName("poster"));
			System.out.println("filename 데이터이름 : "+ multi.getOriginalFileName("poster"));
			
			/*Enumeration<String> fileNames = multi.getFileNames();							
			if(fileNames.hasMoreElements()) {
				String fileName = fileNames.nextElement(); //업로드된 파일 가져오기
				String updateFile = multi.getFilesystemName(fileName); //
				
				if(updateFile == null) { //파일이 없으면
					
				} else { //파일이 있으면
					cto.setPosterSize(file.length());
				}
			}*/				
							
			
		} catch (NumberFormatException e) {
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			System.out.println("[에러] : " + e.getMessage());
		}
   		  		
		ConcertDAO dao = new ConcertDAO();
   		
   		int flag = dao.ConcertModifyOk(cto);   		
   		System.out.println("flag 값 : "+flag); //2
   		
   		request.setAttribute("flag", flag);
	}
}
