package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import model1.MemberTO;
import model2.AppAction;
import model2.App_DetailView;
import model2.App_LoginCheck;
import model2.App_IndieWrite;
import model2.App_MemberJoin;
import model2.App_IdenticalCheck;
import model2.App_ListView;

/**
 * Servlet implementation class AppController
 * @param <JSONarray>
 */
@WebServlet("*.app")
public class AppController<JSONarray> extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
			try {
				request.setCharacterEncoding("utf-8");
				
				String path = request.getRequestURI().replaceAll(request.getContextPath(), "");
				
				String url = "";
				AppAction action = null;
				
				// 로그인체크
				if(path.equals("/*.app") || path.equals("/login_check.app")) {
					action = new App_LoginCheck();
					action.execute(request, response);
					
					url = "/board/model2/app_login_check.jsp";
					
				// 공연등록 - 인디
				}else if(path.equals("/indie_write.app")) {
					action = new App_IndieWrite();
					action.execute(request, response);
					
					url = "/board/model2/app_indieWriteOk.jsp";
					
				// 회원가입
				}else if(path.equals("/member_join.app")) {
					action = new App_MemberJoin();
					action.execute(request, response);
					
					url = "/board/model2/app_MemberJoinOk.jsp";
				
				// 중복값 확인
				}else if(path.equals("/identical_check.app")) {
					action = new App_IdenticalCheck();
					action.execute(request, response);
					
					url = "/board/model2/app_identicalOk.jsp";
					
				// 리스트뷰 
				}else if(path.equals("/listView.app")) {
					action = new App_ListView();
					action.execute(request, response);
					
					url = "/board/model2/app_listView.jsp";
				// 상세뷰
				}else if(path.equals("/detailView.app")) {
					action = new App_DetailView();
					action.execute(request, response);
					
					url = "/board/model2/app_detailView.jsp";
				}
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(url);
				dispatcher.forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.getMessage();
			}

		
	}	

}
