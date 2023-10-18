package kr.or.ddit.booking.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.booking.service.BookingServiceImpl;
import kr.or.ddit.booking.service.IBookingService;
import kr.or.ddit.booking.vo.ShowReservationVO;

/**
 * 마이페이지 예매내역 확인 시 List 출력 하는 서블릿
 */
@WebServlet("/showReservationList.do")
public class ShowReservationList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String c_id = request.getParameter("id");
		System.out.println(c_id);
		
		IBookingService service = BookingServiceImpl.getInstance();
		List<ShowReservationVO> list = service.showReservationByCId(c_id);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/view/myReservationList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
