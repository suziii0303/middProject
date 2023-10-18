package kr.or.ddit.cinema.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cinema.dao.ICinemaDao;
import kr.or.ddit.cinema.service.CinemaServiceImpl;
import kr.or.ddit.cinema.service.ICinemaService;
import kr.or.ddit.cinema.vo.CinemaVO;
import kr.or.ddit.movie.service.IMovieService;
import kr.or.ddit.movie.service.MovieServiceImpl;
import kr.or.ddit.movie.vo.MovieVO;

/**
 * Servlet implementation class CinemaList
 */
@WebServlet("/cinemaList.do")
public class CinemaList extends HttpServlet {
	private static final long serialVersionUID = 1L;
  


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String post = request.getParameter("post");
		ICinemaService service = CinemaServiceImpl.getInstance();
		List<CinemaVO> cList = service.getAllLoc();
		request.setAttribute("id", id);
		request.setAttribute("post", post);
		request.setAttribute("list", cList);
		IMovieService service2 = MovieServiceImpl.getInstance();
		MovieVO mVo = service2.getMovie(id);
		request.setAttribute("movieVo", mVo);
		request.getRequestDispatcher("/view/reservation/selectCinema.jsp").forward(request, response);
		
		
		
	}

	
}
