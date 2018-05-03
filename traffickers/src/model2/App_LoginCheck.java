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
		
		String userID = "";
		String userpw = "";
			
		try {
			userID = request.getParameter("id") != null ? URLDecoder.decode(request.getParameter("id"), "utf-8") : "";
			userpw = request.getParameter("pwd") != null ? URLDecoder.decode(request.getParameter("pwd"), "utf-8") : "";
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			System.out.println("[encoding 에러]" + e.getMessage());
		}
				
		to.setUserID(userID);
		to.setUserPWD(userpw);
								
			MemberDAO dao = new MemberDAO();
			
			to = dao.AppMemberCheck(to);		
			request.setAttribute("to", to);
	}
}