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
 * 상영관 선택하면 해당 영화 시간들 출력되는 서블릿
 */
@WebServlet("/bookedTimeList.do")
public class BookedTimeList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String mid = request.getParameter("mid");	//영화 id값
		String cid = request.getParameter("cid");		//영화관 id값
		String did = request.getParameter("did");		//선택한 날짜 값
		String tid = request.getParameter("tid");		//선택한 상영관 id
		
		BookingVO bVo = new BookingVO();
		bVo.setCn_id(cid);
		bVo.setTh_id(tid);
		bVo.setT_date(did);
		bVo.setM_id(mid);
		
		IBookingService service = BookingServiceImpl.getInstance();
		List<TimeTableVO> tList = service.getTimeTableTime(bVo);
		
		request.setAttribute("tList", tList);
		request.getRequestDispatcher("/view/bookedtimelist.jsp").forward(request, response);
	}

}
