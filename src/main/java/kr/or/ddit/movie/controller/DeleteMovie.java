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


@WebServlet("/deleteMovie.do")
public class DeleteMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String mId = request.getParameter("m_id");
		System.out.println("이것은 삭제 m_id이다 " + mId);
		
		MovieVO movieVo = new MovieVO();
		movieVo.setM_id(mId);
		
		// 정보를 DB에 insert한다.
		IMovieService service = MovieServiceImpl.getInstance();
		service.deleteMovie(mId);
		
		// 작업이 완료되면 List페이지로 이동
		response.sendRedirect(request.getContextPath()+"/mngMovieList.do");
	}

}
