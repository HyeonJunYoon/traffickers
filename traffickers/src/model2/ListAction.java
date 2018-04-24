package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model1.BoardTO;
import model1.BoardDAO;
import java.util.ArrayList;

public class ListAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("ListAction 호출");
		
		BoardDAO dao = new BoardDAO();
   		ArrayList<BoardTO> lists = dao.boardList();
   		
   		request.setAttribute("lists", lists);
	}
}
