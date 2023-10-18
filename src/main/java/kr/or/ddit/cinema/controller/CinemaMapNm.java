package kr.or.ddit.cinema.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cinema.service.CinemaServiceImpl;
import kr.or.ddit.cinema.service.ICinemaService;
import kr.or.ddit.cinema.vo.CinemaVO;

/**
 * Servlet implementation class CinemaMapNm
 */
@WebServlet("/cinemaMapNm.do")
public class CinemaMapNm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ICinemaService service = CinemaServiceImpl.getInstance();
		String loc = request.getParameter("loc");
		List<CinemaVO> cList = service.getCinemaByLoc(loc);
		request.setAttribute("cinemas", cList);
		request.getRequestDispatcher("/view/list.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
