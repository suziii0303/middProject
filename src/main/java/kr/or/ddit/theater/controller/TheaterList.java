package kr.or.ddit.theater.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.theater.service.ITheaterService;
import kr.or.ddit.theater.service.TheaterServiceImpl;
import kr.or.ddit.theater.vo.TheaterVO;

/**
 * 
 * 상영관관리 페이지 출력
 * @author MJ
 *
 */
@WebServlet("/theaterList.do")
public class TheaterList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String vid = (String) session.getAttribute("id");
		
		ITheaterService service = TheaterServiceImpl.getInstance();
		List<TheaterVO> theaterList = service.getTheaterById(vid);
		
		request.setAttribute("theaterList", theaterList);
		
		request.getRequestDispatcher("/view/shop/theaterList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
