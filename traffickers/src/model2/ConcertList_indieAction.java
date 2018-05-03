package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model1.ConcertTO;
import model1.ListTO;
import model1.ConcertDAO;
import java.util.ArrayList;

public class ConcertList_indieAction implements ConcertAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("ConcertList_indieAction 호출");
		
		int cpage = 1;
		if(request.getParameter("cpage") != null && !request.getParameter("cpage").equals("")) {
			cpage = Integer.parseInt(request.getParameter("cpage"));
		}
		
		ConcertDAO dao = new ConcertDAO();
		ListTO listTO = new ListTO();
		
		listTO.setCpage(cpage);
		ListTO lists = dao.ConcertList_indie(listTO);		
   		
   		request.setAttribute("lists", lists);
	}
}
