package kr.or.ddit.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.IQnaService;
import kr.or.ddit.board.service.QnaServiceImpl;
import kr.or.ddit.board.vo.QnAVO;
import kr.or.ddit.board.vo.QnaPageVO;
import kr.or.ddit.board.vo.ReplyVO;

@WebServlet("/QnaList.do")
public class QnaList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 요청시 전송데이터 받기
		int page = Integer.parseInt(request.getParameter("page"));
		String sword = request.getParameter("search");
		//System.out.println("page: " + page + "sword: " + sword);
		
		// service객체 얻기
		IQnaService service = QnaServiceImpl.getService();
		
		// QnaPageVO객체 얻기
		QnaPageVO qvo = service.qnaPageInfo(page, sword);
		//System.out.println("QnaList.java의 qvo: " + qvo);
		
		// service메소드 호출해서 결과값 얻기
		Map<String, Object> map = new HashMap<>();
		map.put("start", qvo.getqStart());
		map.put("end", qvo.getqEnd());
		map.put("sword", sword);
		
		List<QnAVO> list = service.qnaPerPage(map);
		System.out.println("QnaList.java의 list: " + list);
		
		// request에 결과값 저장
		request.setAttribute("pageList", list);
		request.setAttribute("pageVo", qvo);
		
		// view페이지로 이동
		request.getRequestDispatcher("/view/qnalist.jsp").forward(request, response);
				
	}

}
