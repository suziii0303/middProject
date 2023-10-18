package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.IQnaService;
import kr.or.ddit.board.service.QnaServiceImpl;
import kr.or.ddit.board.vo.ReplyVO;

@WebServlet("/ReplyList.do")
public class ReplyList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ReplyList.do에 왔다!!!!!!");
		
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("ReplyList.do의 num: " + num);
		
		IQnaService service = QnaServiceImpl.getService();
		
		List<ReplyVO> list = service.getAllReply(num);
		System.out.println("ReplyList.do의 list: " + list);
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/view/replylist.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
