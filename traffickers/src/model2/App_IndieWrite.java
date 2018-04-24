package model2;

import java.io.File;
import java.io.IOException;

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
		
		String uploardpath = "C:/02.Language/03.JSP/01.eclipse-workspace/traffickers/WebContent/upload/";
		int maxFileSize = 1024 * 1024 * 2; // 2mb 를 풀어서
		String encoding = "utf-8";
		
		try {
			MultipartRequest multi = 
					new MultipartRequest(request, uploardpath, maxFileSize, encoding, new DefaultFileRenamePolicy());
			
			System.out.println(multi.getParameter("subject"));
			
			cto.setMem_idx(Integer.parseInt(multi.getParameter("mem_idx")));
			cto.setSubject(multi.getParameter("subject"));
			cto.setCtime(multi.getParameter("ctime"));
			cto.setCplace(multi.getParameter("cplace"));
			cto.setCprice(multi.getParameter("cprice"));
			cto.setcDate(multi.getParameter("cDate"));
			cto.setContents(multi.getParameter("content"));
			cto.setCetc(multi.getParameter("etc"));
			cto.setPosterName(multi.getFilesystemName("filename"));
			cto.setPosterData(multi.getOriginalFileName("filename"));			
								
			File file = multi.getFile("filename");
				
			cto.setPosterSize(file.length());
		} catch (NumberFormatException e) {
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			System.out.println("[에러] : " + e.getMessage());
		}
   		  		
		ConcertDAO dao = new ConcertDAO();
   		
   		int flag = dao.App_indieWriteOk(cto);
   		
   		request.setAttribute("flag", flag);
	}
}