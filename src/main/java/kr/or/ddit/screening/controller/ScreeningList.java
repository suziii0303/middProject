package kr.or.ddit.screening.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.screening.service.IScreeningService;
import kr.or.ddit.screening.service.ScreeningServiceImpl;
import kr.or.ddit.screening.vo.ScreeningVO;
import kr.or.ddit.timetable.vo.TimeTableVO;

/**
 * 
 * 상영일정관리 페이지 출력
 * @author MJ
 *
 */
@WebServlet("/screeningList.do")
public class ScreeningList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String vid = (String) session.getAttribute("id");

		IScreeningService service = ScreeningServiceImpl.getInstance();
		
		List<ScreeningVO> screeningList = service.getScreening(vid);
		request.setAttribute("screeningList", screeningList);
		
		request.getRequestDispatcher("/view/shop/screeningList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
