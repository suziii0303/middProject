package kr.or.ddit.screening.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.screening.service.IScreeningService;
import kr.or.ddit.screening.service.ScreeningServiceImpl;

/**
 * 
 * 상영일정관리 페이지에서 영화삭제 버튼을 눌렀을 때
 * @author MJ
 *
 */
@WebServlet("/movieDelete.do")
public class MovieDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		IScreeningService service = ScreeningServiceImpl.getInstance();
		
		String tNum = request.getParameter("t_num");
		
		service.deleteScreeningMovie(tNum);
		
		request.getRequestDispatcher("/screeningList.do").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
