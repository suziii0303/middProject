package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.IQnaService;
import kr.or.ddit.board.service.QnaServiceImpl;

@WebServlet("/ReplyDelete.do")
public class ReplyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기는 ReplyDelete.do");
		
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		System.out.println("ReplyDelete.do의 rnum: " + rnum);
		
		IQnaService service = QnaServiceImpl.getService();
		
		int res = service.deleteReply(rnum);
		System.out.println("ReplyDelete.do의 res: " + res);
		
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("/view/result.jsp").forward(request, response);
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
