package model2;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.MemberDAO;
import model1.MemberTO;

public class App_LoginCheck implements AppAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		//System.out.println("LoginCheckApp 확인");
				
		MemberTO to = new MemberTO();
		
			try {
				to.setUserID(request.getParameter("id") == null ? "" : URLDecoder.decode("id", "utf-8"));
				to.setUserPWD(request.getParameter("pwd") == null ? "" : URLDecoder.decode("pwd", "utf-8"));
			} catch (UnsupportedEncodingException e) {
				System.out.println("[encoding 에러]" + e.getMessage());
			}
			
			//System.out.println("id : " + request.getParameter("id") + " / pwd : " + request.getParameter("pwd"));
					
			MemberDAO dao = new MemberDAO();
			
			to = dao.MemberCheck(to);		
			request.setAttribute("to", to);
	}
}