package model2;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.ConcertDAO;
import model1.ConcertTO;
import model1.ListTO;

public class ConcertModifyAction implements ConcertAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub		
		int idx = Integer.parseInt(request.getParameter("idx"));			
		
		ConcertDAO dao = new ConcertDAO(); //dao
		ConcertTO to = new ConcertTO(); //cto
		
		//cto.setCidx(request.getParameter("idx"));		
		//cto = dao.ConcertModify(cto);
				
		to.setCidx(idx);
		ConcertTO cto = dao.ConcertModify(to);	
		System.out.println("5.Action 시작");		
		
   		request.setAttribute("to", to);
	}
}