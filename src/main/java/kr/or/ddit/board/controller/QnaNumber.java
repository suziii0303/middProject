package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.IQnaService;
import kr.or.ddit.board.service.QnaServiceImpl;

@WebServlet("/QnaNumber.do")
public class QnaNumber extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기는 QnaNumber.do");
		
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("QnaNumber.do의 글 번호: " + num);
		
		IQnaService service = QnaServiceImpl.getService();
		int count = service.totalReply(num);
		System.out.println("QnaNumber.do의 댓글 개수: " + count);
		
		request.setAttribute("count", count);
		request.getRequestDispatcher("/view/replycount.jsp").forward(request, response);
		
	}

}
