package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model2.BoardAction;
import model2.DeleteAction;
import model2.DeleteOkAction;
import model2.ListAction;
import model2.ModifyAction;
import model2.ModifyOkAction;
import model2.ViewAction;
import model2.WriteOkAction;

import model2.ConcertAction;
import model2.AdminLoginAction;
import model2.AdminLoginOkAction;
import model2.ConcertWriteAction;
import model2.ConcertWriteOkAction;
import model2.ConcertListAction;

import model2.LoginCheckApp;

/**
 * Servlet implementation class URIController
 */
@WebServlet("*.tk")
public class URIController extends HttpServlet {
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
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response){
		// TODO Auto-generated method stub
		
		
		try {
			request.setCharacterEncoding("utf-8");
			
			String path = request.getRequestURI().replaceAll(request.getContextPath(), "");
			
			String url = "";
			BoardAction action = null;
			ConcertAction cAction = null;
			
			System.out.println("url 에러 : "+url);
				
			if(path.equals("/*.tk") || path.equals("/admin_login.tk")) {
				action = new AdminLoginAction();
				
				action.execute(request, response);
				
				url = "/board/model2/admin_login.jsp";				
			}else if(path.equals("/admin_login_ok.tk")) {
				action = new AdminLoginOkAction();
				
				action.execute(request, response);
				
				url = "/board/model2/admin_login_ok.jsp";
			}else if(path.equals("/concert_write.tk")) {
				cAction = new ConcertWriteAction();
				
				cAction.execute(request, response);
				
				url = "/board/model2/concertWrite.jsp";
			}else if(path.equals("/concert_write_ok.tk")) {
				cAction = new ConcertWriteOkAction();
				
				cAction.execute(request, response);
				
				url = "/board/model2/concertWrite_ok.jsp";
			}else if(path.equals("/concert_list.tk")) {
				cAction = new ConcertListAction();
				
				cAction.execute(request, response);
				
				url = "/board/model2/concertList.jsp";
			}
			
			System.out.println("url 에러 : "+url);
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			System.out.println("[UnsupportedEncodingException 에러] : "+ e.getMessage());
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			System.out.println("[ServletException 에러] : "+ e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[IOException 에러] : "+ e.getMessage());
		}
	}
}
