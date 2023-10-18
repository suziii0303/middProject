package kr.or.ddit.movie.controller;

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
 * 영화 목록들을 보여주는 서블릿
 */
@WebServlet("/movieList.do")
public class MovieList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		IMovieService service = MovieServiceImpl.getInstance();
		List<MovieVO> mList = service.getAllMovies();
		request.setAttribute("movieList", mList);
		request.getRequestDispatcher("/view/main/main.jsp").forward(request, response);
	}

}
