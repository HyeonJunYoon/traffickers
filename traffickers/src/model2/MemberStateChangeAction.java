package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model1.BoardDAO;
import model1.BoardTO;
import model1.MemberDAO;
import model1.MemberTO;

public class MemberStateChangeAction implements ConcertAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("MemberStateChangeAction 확인");
		
		MemberTO to = new MemberTO();
		to.setUserIdx(Integer.parseInt(request.getParameter("idx")));
		to.setStatus(Integer.parseInt(request.getParameter("s")));
   		
   		MemberDAO dao = new MemberDAO();
   		
   		int flag = dao.MemberStateChange(to); 		
   		request.setAttribute("flag", flag);
	}
}
