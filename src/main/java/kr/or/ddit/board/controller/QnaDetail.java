package kr.or.ddit.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.IQnaService;
import kr.or.ddit.board.service.QnaServiceImpl;
import kr.or.ddit.board.vo.NoticeVO;
import kr.or.ddit.board.vo.QnAVO;

@WebServlet("/QnaDetail.do")
public class QnaDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기는 QnaDetail.java");

		request.setCharacterEncoding("utf-8");
		
		int widx = Integer.parseInt(request.getParameter("widx"));
		System.out.println("QnaDetail.java의 widx: " + widx);
		int currentPage = Integer.parseInt(request.getParameter("page"));
		
		IQnaService service = QnaServiceImpl.getService();
		
		QnAVO vo = service.getQna(widx);
		System.out.println("QnaDetail.java의 vo: " + vo);
		
		request.setAttribute("getQna", vo);
		request.setAttribute("currentPage", currentPage);
		
		request.getRequestDispatcher("/board/viewqna.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
