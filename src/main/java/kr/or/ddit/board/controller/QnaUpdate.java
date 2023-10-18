package kr.or.ddit.board.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.board.service.IQnaService;
import kr.or.ddit.board.service.NoticeServiceImpl;
import kr.or.ddit.board.service.QnaServiceImpl;
import kr.or.ddit.board.vo.QnAVO;

@WebServlet("/QnaUpdate.do")
public class QnaUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		System.out.println("QnaUpdate로 넘어왔습니당");
		
		// 선택한 게시글 번호를 게시글 수정폼으로 전송
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("QnaUpdate의 num: " + num);
		
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		IQnaService service = QnaServiceImpl.getService();
		QnAVO vo = service.getQna(num);
		System.out.println("QnaUpdate의 수정폼으로 전송하는 vo: " + vo);
		
		request.setAttribute("getQna", vo);
		request.setAttribute("currentPage", currentPage);
		request.getRequestDispatcher("/board/updateqna.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		QnAVO vo = new QnAVO();
		
//		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int currentPage = vo.getR_count();  // 편법...
		
		IQnaService service = QnaServiceImpl.getService();
		int res = service.updateQna(vo);
		System.out.println("QnaUpdate의 res: " + res);
		
		response.sendRedirect(request.getContextPath() + "/board/qna.jsp?currentPage=" + currentPage);
	
	}

}
