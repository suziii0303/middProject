package kr.or.ddit.movie.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.movie.service.IMovieService;
import kr.or.ddit.movie.service.MovieServiceImpl;
import kr.or.ddit.movie.vo.MovieVO;

/**
 * 영화 조회하기 버튼 클릭 시 해당 영화 상세정보 조회하는 Servlet
 */
@WebServlet("/movieDetail.do")
public class MovieDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		IMovieService service = MovieServiceImpl.getInstance();
		MovieVO mVo = service.getMovie(id);
		request.setAttribute("movieVo", mVo);
		request.getRequestDispatcher("/view/reservation/moviedetail.jsp").forward(request, response);
		
	}

}
