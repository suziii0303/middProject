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


@WebServlet("/insertMovie.do")
public class InsertMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	request.setCharacterEncoding("utf-8");
		
	
    //  정보를 받는다.
	String movieid = request.getParameter("m_id");
	int mrid = Integer.parseInt(request.getParameter("mr_id"));
	String subject = request.getParameter("m_subject");
	String post = request.getParameter("m_post");
	String plot  = request.getParameter("m_plot");
	String director  = request.getParameter("m_director");
	String date  = request.getParameter("m_date");
	String actor  = request.getParameter("m_actor");
	String runtime  = request.getParameter("m_runtime");
	String genre  = request.getParameter("m_genre");
			
	
	// 받아온 정보를 VO에 저장한다.
	MovieVO movieVo = new MovieVO();
	movieVo.setM_id(movieid);
	movieVo.setMr_id(mrid); 
	movieVo.setM_subject(subject);
	movieVo.setM_post(post);
	movieVo.setM_plot(plot.replace("\n", "<br>"));
	movieVo.setM_director(director);
	movieVo.setM_date(date);
	movieVo.setM_actor(actor);
	movieVo.setM_runtime(runtime);
	movieVo.setM_genre(genre);
	
	// 회원 정보를 DB에 insert한다.
	IMovieService service = MovieServiceImpl.getInstance();
	
	// service 메소드 호출하기 - 결과값 받기
	int res = service.insertMovie(movieVo);
	
	// 결과값을 request에 저장 하기
	request.setAttribute("resMovie", res);
	
	// view페이지로 이동 - json 데이터 생성
	request.getRequestDispatcher("/mngMovieList.do").forward(request,response);	
	}

}
