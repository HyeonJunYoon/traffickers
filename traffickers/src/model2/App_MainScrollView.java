package model2;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.ConcertDAO;
import model1.ConcertTO;

public class App_MainScrollView implements AppAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		ConcertDAO dao = new ConcertDAO();
		ArrayList<ConcertTO> lists = dao.AppMainScrollView();
		request.setAttribute("lists", lists);		
	}

}
