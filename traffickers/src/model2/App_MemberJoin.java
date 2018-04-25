package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.MemberDAO;
import model1.MemberTO;

public class App_MemberJoin implements AppAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String Bday[] = new String[2];
		Bday = request.getParameter("birth").split("-");
		
		//System.out.println("Bday[0] : " + Bday[0] + "Bday[1] : " + Bday[1] + "Bday[2] : " + Bday[2]);
		
		if(Integer.parseInt(Bday[1]) < 10 ) {
			Bday[1] = "0" + Bday[1];
		}
		
		if(Integer.parseInt(Bday[2]) < 10 ) {
			Bday[2] = "0" + Bday[2];
		}
		
		String birthString = Bday[0]+"-"+Bday[1]+"-"+Bday[2];		
		
		MemberTO mto = new MemberTO();
			mto.setUserID(request.getParameter("id"));
			mto.setUserPWD(request.getParameter("pwd"));
			mto.setNickName(request.getParameter("nickname"));
			mto.setBirth(birthString);
			mto.setJoinType(Integer.parseInt(request.getParameter("type")));
			mto.setSex(Integer.parseInt(request.getParameter("gender")));
			
			MemberDAO dao = new MemberDAO();
			   		
			int flag = dao.MemberJoin(mto);
			request.setAttribute("flag", flag);
	}
}
