package kr.or.ddit.cinema.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.movie.service.IMovieService;
import kr.or.ddit.movie.service.MovieServiceImpl;
import kr.or.ddit.movie.vo.MovieVO;
import kr.or.ddit.screening.service.IScreeningService;
import kr.or.ddit.screening.service.ScreeningServiceImpl;
import kr.or.ddit.screening.vo.ScreeningVO;
import kr.or.ddit.timetable.vo.TimeTableVO;

/**
 * 
 * 예매현황 페이지 출력
 * @author MJ
 *
 */
@WebServlet("/reservationList.do")
public class ReservationList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String vid = (String) session.getAttribute("id");
		
		IMovieService service = MovieServiceImpl.getInstance();
		List<MovieVO> movieList = service.getMovieByShId(vid);
		
		
		
		
		request.setAttribute("movieList", movieList);
		
		request.getRequestDispatcher("/view/shop/reservationList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
