package model2;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model1.ConcertDAO;
import model1.ConcertTO;

public class ConcertWriteOkAction implements ConcertAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("ConcertWriteAction 확인");
		
		ConcertTO to = new ConcertTO();
		
		String uploardpath = "C:/02.Language/03.JSP/01.eclipse-workspace/traffickers/WebContent/upload/";
		int maxFileSize = 1024 * 1024 * 2; // 2mb 를 풀어서
		String encoding = "utf-8";
		
		try {
			MultipartRequest multi = 
					new MultipartRequest(request, uploardpath, maxFileSize, encoding, new DefaultFileRenamePolicy());
			
			to.setCtype(Integer.parseInt(multi.getParameter("ctype")));
			to.setMem_idx(Integer.parseInt(multi.getParameter("mem_idx")));
			to.setView_yn(Integer.parseInt(multi.getParameter("view_yn")));
			to.setView_level(Integer.parseInt(multi.getParameter("view_level")));
			to.setSubject(multi.getParameter("subject"));
			to.setContents(multi.getParameter("contents"));
			to.setCtime(multi.getParameter("ctime"));
			to.setCprice(multi.getParameter("cprice"));
			to.setcDate(multi.getParameter("cDate"));
			to.setCplace(multi.getParameter("cplace"));
			to.setClink(multi.getParameter("clink"));
			to.setCurl(multi.getParameter("curl"));
			to.setCetc(multi.getParameter("cetc"));
			to.setPosterName(multi.getFilesystemName("poster"));
			to.setPosterData(multi.getOriginalFileName("poster"));
			
				File file = multi.getFile("poster");
				
			to.setPosterSize(file.length());
		} catch (NumberFormatException e) {
			System.out.println("[에러] : " + e.getMessage());
		} catch (IOException e) {
			System.out.println("[에러] : " + e.getMessage());
		}
   		  		
		ConcertDAO dao = new ConcertDAO();
   		
   		int flag = dao.ConcertWriteOk(to);
   		
   		request.setAttribute("flag", flag);
	}
}
