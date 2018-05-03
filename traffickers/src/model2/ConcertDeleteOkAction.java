package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model1.ConcertDAO;
import model1.ConcertTO;

public class ConcertDeleteOkAction implements ConcertAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("DeleteOkAction 확인");
		
   		ConcertTO cto = new ConcertTO();
   		cto.setCidx(Integer.parseInt(request.getParameter("idx"))); //idx 받아오기  		
   		
   		ConcertDAO dao = new ConcertDAO();   		
   		int flag = dao.ConcertDeleteOk(cto);
   		
   		request.setAttribute("flag", flag);
	}
}
