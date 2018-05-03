package model2;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.ConcertDAO;
import model1.ConcertTO;

public class App_ListView implements AppAction{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int listType = 0;
		String listValue = "";
		
		try {
			listType = Integer.parseInt(request.getParameter("list_type") == null ? "1" : request.getParameter("list_type").equals("") ? "1" : request.getParameter("list_type"));
			listValue = request.getParameter("list_value") != null ? URLDecoder.decode(request.getParameter("list_value"), "utf-8") : "";
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			System.out.println("[NumberError] : " + e.getMessage());
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			System.out.println("[DecodingError] : " + e.getMessage());
		} 
	
		ConcertTO cto = new ConcertTO();
		cto.setList_Type(listType);
		cto.setList_Value(listValue);
		
		ConcertDAO dao = new ConcertDAO();
		ArrayList<ConcertTO> lists = dao.AppListView(cto);
		request.setAttribute("lists", lists);
	}	
}
