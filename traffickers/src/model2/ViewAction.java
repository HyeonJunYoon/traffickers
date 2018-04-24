package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model1.BoardTO;
import model1.BoardDAO;

public class ViewAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("ViewAction »£√‚");
		
		String seq = request.getParameter("seq");
   		
   		BoardTO to = new BoardTO();
   		to.setSeq(request.getParameter("seq"));
   		BoardDAO dao = new BoardDAO();
   		to = dao.boardView(to);
   		
   		request.setAttribute("to", to);
	}

}
