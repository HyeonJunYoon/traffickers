package model2;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.ConcertDAO;
import model1.ConcertTO;
import model1.ListTO;
import model1.MemberDAO;
import model1.MemberTO;

public class MemberListAction implements ConcertAction{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int cpage = 1;
		if(request.getParameter("cpage") != null && !request.getParameter("cpage").equals("")) {
			cpage = Integer.parseInt(request.getParameter("cpage"));
		}
		
		MemberDAO dao = new MemberDAO();
		ListTO listTO = new ListTO();
		
		String pageURL[] = request.getRequestURI().split("/");
		listTO.setPageURL(pageURL[2]);
		
		listTO.setCpage(cpage);
		ListTO lists = dao.MemberList(listTO);		
   		
   		request.setAttribute("lists", lists);
	}	
}
