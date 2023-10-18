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


@WebServlet("/mngMovieList.do")
public class MngMovieList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IMovieService Service = MovieServiceImpl.getInstance();

		// 전체 영화 목록을 가져옴
	    List<MovieVO> movieList = Service.getAllMngMovie();
		
		// 가져온 파일 목록 데이터를 view페이지로 보낸다.
		request.setAttribute("movieList", movieList); //("임의데이터명", 저장할-)
		 
		request.getRequestDispatcher("/view/manager/movieList.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
