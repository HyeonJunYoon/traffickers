package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.ConcertDAO;
import model1.ConcertTO;

public class App_ListView implements AppAction{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	
		ConcertTO cto = new ConcertTO();
		cto.setList_Type(Integer.parseInt(request.getParameter("list_type")));
		cto.setList_Value(request.getParameter("list_value"));
		
		ConcertDAO cdao = new ConcertDAO();
		cto = cdao.AppListView(cto);
	}	
}
