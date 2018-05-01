package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.ConcertDAO;
import model1.ConcertTO;

public class App_DetailView implements AppAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ConcertTO cto = new ConcertTO();
		
		int idx = Integer.parseInt(request.getParameter("idx") == null ? "0" : request.getParameter("idx").equals("") ? "0" : request.getParameter("idx"));
		cto.setCidx(idx);
		
		ConcertDAO dao = new ConcertDAO();
		cto = dao.DetailView(cto);
		
		request.setAttribute("cto", cto);		
	}

}
