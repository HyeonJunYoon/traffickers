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
		mto.setIcType(Integer.parseInt(request.getParameter("icType")));
		mto.setIcValue(request.getParameter("icValue"));
		
		MemberDAO mdao = new MemberDAO();
		int flag = mdao.IdenticalCheck(mto);
		
		request.setAttribute("flag", flag);
		
		//System.out.println("리턴값 : " + flag);
	}

}
