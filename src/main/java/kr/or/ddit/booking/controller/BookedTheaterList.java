package kr.or.ddit.booking.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.booking.service.BookingServiceImpl;
import kr.or.ddit.booking.service.IBookingService;
import kr.or.ddit.booking.vo.BookingVO;
import kr.or.ddit.theater.vo.TheaterVO;

/**
 * Servlet implementation class TheaterList
 */
@WebServlet("/bookedTheaterList.do")
public class BookedTheaterList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String mid = request.getParameter("mid");	//영화 id값
		String cid = request.getParameter("cid");		//영화관 id값
		String did = request.getParameter("did");		//선택한 날짜 값
		
		BookingVO bVo = new BookingVO();
		bVo.setM_id(mid);
		bVo.setCn_id(cid);
		bVo.setT_date(did);
		
		IBookingService service = BookingServiceImpl.getInstance();
		List<TheaterVO> tList = service.getTimeTableTheater(bVo);
		
		request.setAttribute("tList", tList);
		request.getRequestDispatcher("/view/bookedtheaterlist.jsp").forward(request, response);
	}

}
