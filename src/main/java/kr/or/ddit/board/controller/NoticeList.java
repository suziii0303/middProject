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

import kr.or.ddit.board.service.INoticeService;
import kr.or.ddit.board.service.NoticeServiceImpl;
import kr.or.ddit.board.vo.NoticePageVO;
import kr.or.ddit.board.vo.NoticeVO;

@WebServlet("/NoticeList.do")
public class NoticeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 요청시 전송데이터 받기
		int page = Integer.parseInt(request.getParameter("page"));
		String sword = request.getParameter("search");
		
		
		// service객체 얻기
		INoticeService service = NoticeServiceImpl.getService();
		
		// NoticePageVO객체 얻기
		NoticePageVO pvo = service.noPageInfo(page, sword);
		
		// service메소드 호출해서 결과값 얻기
		Map<String, Object> map = new HashMap<>();
		map.put("start", pvo.getnStart());
		map.put("end", pvo.getnEnd());
		map.put("sword", sword);
		
		List<NoticeVO> list = service.NoticePerPage(map);
		
		// request에 결과값 저장
		request.setAttribute("pageList", list);
		request.setAttribute("pageVo", pvo);
		
		// view페이지로 이동
		request.getRequestDispatcher("/view/noticelist.jsp").forward(request, response);

	}

}
