package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model1.BoardDAO;
import model1.BoardTO;

public class ModifyOkAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("ModifyOkAction È£Ãâ");
		
   		String seq = request.getParameter("seq");
   		System.out.println("seq °ª : "+ seq);
   		String password = request.getParameter("password");
   		String content = request.getParameter("content");
   		String subject = request.getParameter("subject");
   		String mail = request.getParameter("mail1")+"@"+request.getParameter("mail2");
   		BoardTO to = new BoardTO();
   		to.setSeq(seq);
   		to.setPassword(password);
   		to.setContent(content);
   		to.setSubject(subject);
   		to.setMail(mail);
   		
		BoardDAO dao = new BoardDAO();
   		
   		int flag = dao.boardModifyOk(to);
   		request.setAttribute("seq", seq);
   		request.setAttribute("flag", flag);
	}
}
