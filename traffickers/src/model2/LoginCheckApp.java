package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.MemberDAO;
import model1.MemberTO;

public class LoginCheckApp implements AppAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		//System.out.println("LoginCheckApp 확인");
				
		MemberTO to = new MemberTO();
			to.setUserID(request.getParameter("id"));
			to.setUserPWD(request.getParameter("pwd"));
			
			//System.out.println("id : " + request.getParameter("id") + " / pwd : " + request.getParameter("pwd"));
					
			MemberDAO dao = new MemberDAO();
			
			to = dao.MemberCheck(to);		
			request.setAttribute("to", to);
	}
}