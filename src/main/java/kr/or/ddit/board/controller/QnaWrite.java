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
import kr.or.ddit.board.service.QnaServiceImpl;
import kr.or.ddit.board.vo.QnAVO;

@WebServlet("/QnaWrite.do")
public class QnaWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	// GET방식으로 요청시 qna등록폼이 나타나도록 구현
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/board/writeqna.jsp").forward(request, response);
	}
	

	// POST방식으로 요청시 입력한 게시글 정보를 DB에 저장 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String c_id = request.getParameter("c_id");
		
		// 요청시 전송데이터 받기
		QnAVO vo = new QnAVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("QnaWrite.java의 vo: " + vo);
		
		vo.setC_id(c_id);
		
		// 정보를 DB에 insert
		IQnaService service = QnaServiceImpl.getService();
		int res = service.insertQna(vo);
		System.out.println("QnaWrite.java의 res: " + res);
		
		// 작업이 완료되면 ListPage로 이동
		response.sendRedirect(request.getContextPath() + "/board/qna.jsp");
		
	}

}
