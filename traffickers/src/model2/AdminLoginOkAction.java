package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.BoardDAO;
import model1.BoardTO;
import model1.MemberDAO;
import model1.MemberTO;

public class AdminLoginOkAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("AdminLoginOkAction 확인");
				
		MemberTO to = new MemberTO();
			to.setAdminID(request.getParameter("admin_id"));
			to.setAdminPWD(request.getParameter("admin_pwd"));
					
			MemberDAO dao = new MemberDAO();
			
			to = dao.AdminCheck(to);		
			request.setAttribute("to", to);		
	}
}