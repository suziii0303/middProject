package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.INoticeService;
import kr.or.ddit.board.service.IQnaService;
import kr.or.ddit.board.service.NoticeServiceImpl;
import kr.or.ddit.board.service.QnaServiceImpl;

@WebServlet("/QnaDelete.do")
public class QnaDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int widx = Integer.parseInt(request.getParameter("idx"));
		System.out.println("QnaDelete.java의 widx: " + widx);

		IQnaService service = QnaServiceImpl.getService();
		service.deleteReplyByQnum(widx);
		int res = service.deleteQna(widx);
		
		request.setAttribute("result", res);
		System.out.println("QnaDelete.java의 res: " + res);
		
		request.getRequestDispatcher("/view/result.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
