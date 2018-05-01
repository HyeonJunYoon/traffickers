package model2;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.MemberDAO;
import model1.MemberTO;

public class App_MemberJoin implements AppAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		MemberTO mto = new MemberTO();
		int flag = 0;
		
		
		try {
			String id				= request.getParameter("id") != null ? URLDecoder.decode(request.getParameter("id"), "utf-8") : "";
			String pwd			= request.getParameter("pwd") != null ? URLDecoder.decode(request.getParameter("pwd"), "utf-8") : "";
			String nickName	= request.getParameter("nickname") != null ? URLDecoder.decode(request.getParameter("nickname"), "utf-8") : "";
			int joinType			= Integer.parseInt(request.getParameter("ctype") == null ? "0" : request.getParameter("ctype").equals("") ? "0" : request.getParameter("ctype"));
			String birth			= request.getParameter("birth") == null ? "1900-01-01" : request.getParameter("birth").equals("") ? "1900-01-01" : request.getParameter("birth");
			int gender			= Integer.parseInt(request.getParameter("gender") == null ? "0" : request.getParameter("gender").equals("") ? "0" : request.getParameter("gender"));
			
			String Bday[] = new String[2];
			Bday = birth.split("-");
						
			if(Integer.parseInt(Bday[1]) < 10 ) {
				Bday[1] = "0" + Bday[1];
			}
			
			if(Integer.parseInt(Bday[2]) < 10 ) {
				Bday[2] = "0" + Bday[2];
			}
			
			String birthString 		= Bday[0]+"-"+Bday[1]+"-"+Bday[2];
			
			mto.setUserID(id);
			mto.setUserPWD(pwd);
			mto.setNickName(nickName);
			mto.setBirth(birthString);
			mto.setJoinType(joinType);
			mto.setSex(gender);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("에러 :" + e.getMessage());
		}
			
			MemberDAO dao = new MemberDAO();
			
			if(mto.getUserID().equals("") || mto.getUserPWD().equals("")) {
				flag = 5;
			}else {
				flag = dao.MemberJoin(mto);				
			}			

			request.setAttribute("flag", flag);
	}
}
