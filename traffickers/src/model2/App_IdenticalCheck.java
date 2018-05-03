package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.MemberDAO;
import model1.MemberTO;

public class App_IdenticalCheck implements AppAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		MemberTO mto = new MemberTO();
		
		int icType 		= Integer.parseInt(request.getParameter("icType") == null ? "1" : request.getParameter("icType").equals("") ? "1" : request.getParameter("icType"));
		String icValue	= request.getParameter("icValue") == null ? "" : request.getParameter("icValue"); 
		mto.setIcType(icType);
		mto.setIcValue(icValue);
		
		MemberDAO mdao = new MemberDAO();
		int flag = mdao.AppIdenticalCheck(mto);
		
		request.setAttribute("flag", flag);
		
		//System.out.println("리턴값 : " + flag);
	}

}
