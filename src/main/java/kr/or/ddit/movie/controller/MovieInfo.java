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


@WebServlet("/movieInfo.do")
public class MovieInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("utf-8");
		
		String mId = request.getParameter("m_id");
		System.out.println("이것은 m_id이다 " + mId);
		
		IMovieService service = MovieServiceImpl.getInstance();		
		System.out.println("이것은 service이다 " + service);
		
		MovieVO movieVo = service.getMovieById(mId);		
		System.out.println("이것은 담긴 브이오" + movieVo);
		
		request.setAttribute("movieVo", movieVo);
		
		request.getRequestDispatcher("/view/manager/movieInfo.jsp").forward(request, response);


}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
