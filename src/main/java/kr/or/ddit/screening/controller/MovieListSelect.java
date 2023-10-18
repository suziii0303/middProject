package kr.or.ddit.screening.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.movie.service.IMovieService;
import kr.or.ddit.movie.service.MovieServiceImpl;
import kr.or.ddit.movie.vo.MovieVO;

/**
 * 
 * 상영일정관리 페이지에서 영화추가 버튼을 눌렀을 때 영화목록 출력
 * @author MJ
 *
 */
@WebServlet("/movieListSelect.do")
public class MovieListSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String tNum = request.getParameter("t_num");
		
		IMovieService service = MovieServiceImpl.getInstance();
		List<MovieVO> movieList = service.getAllMovies();
		
		request.setAttribute("movieList", movieList);
		request.setAttribute("t_num", tNum);
		
		request.getRequestDispatcher("/view/shop/movieListSelect.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
