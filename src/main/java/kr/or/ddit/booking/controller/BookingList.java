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
import kr.or.ddit.timetable.vo.TimeTableVO;

/**
 * 영화관을 클릭하면 영화 id와 영화관 id값을 받아서 존재하는 해당 영화, 영화관에 대한 상영일정을 보여주는 서블릿
 */
@WebServlet("/bookingList.do")
public class BookingList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String mid = request.getParameter("mid");	//영화 id값
		String cid = request.getParameter("cid");		//영화관 id값
		
		BookingVO bVo = new BookingVO();	//파라에 들어갈 BookingVO 객체 생성
		bVo.setM_id(mid);
		bVo.setCn_id(cid);		//받아온 값들 셋팅
		
		IBookingService service = BookingServiceImpl.getInstance();
		List<TimeTableVO> tList = service.getTimeTableDate(bVo);	//반환값은 TimeTableVO 리스트
		
		request.setAttribute("tList", tList);
		request.getRequestDispatcher("/view/bookedtimetablelist.jsp").forward(request, response);
		
		//dd
		
	}

}
