package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model1.BoardTO;
import model1.BoardDAO;

public class WriteOkAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("WriteOkAction 확인");
		
   		BoardTO to = new BoardTO();
   		
   		to.setSubject(request.getParameter("subject")); 
   		to.setWriter(request.getParameter("writer")); 
   		to.setMail(request.getParameter("mail1") + "@" + request.getParameter("mail2"));
   		to.setPassword(request.getParameter("password"));
   		to.setContent(request.getParameter("content"));
   		to.setWip(request.getRemoteAddr()); 
   		  		
   		BoardDAO dao = new BoardDAO();
   		
   		int flag = dao.boardWriteOk(to);
   		
   		request.setAttribute("flag", flag);
	}

}
