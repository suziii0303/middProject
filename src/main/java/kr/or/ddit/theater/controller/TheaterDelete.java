package kr.or.ddit.theater.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.screening.service.IScreeningService;
import kr.or.ddit.screening.service.ScreeningServiceImpl;
import kr.or.ddit.seat.service.ISeatService;
import kr.or.ddit.seat.service.SeatServiceImpl;
import kr.or.ddit.theater.service.ITheaterService;
import kr.or.ddit.theater.service.TheaterServiceImpl;

/**
 * 
 * 상영관관리 페이지에서 삭제 버튼 눌렀을 때
 * @author MJ
 *
 */
@WebServlet("/theaterDelete.do")
public class TheaterDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String thId = request.getParameter("th_id");
		
		ITheaterService service = TheaterServiceImpl.getInstance();
		IScreeningService sService = ScreeningServiceImpl.getInstance();
		ISeatService seatService = SeatServiceImpl.getInstance();
		seatService.deleteSeat(thId);
		sService.deleteScreening(thId);
		sService.deleteTimeTable(thId);
		int res = service.deleteTheater(thId);
		
		request.setAttribute("result", res);
		
		request.getRequestDispatcher("/view/shop/result.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
