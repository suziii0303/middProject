package kr.or.ddit.cinema.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cinema.service.CinemaServiceImpl;
import kr.or.ddit.cinema.service.ICinemaService;
import kr.or.ddit.cinema.vo.CinemaVO;

/**
 * Servlet implementation class CinemaMap
 */
@WebServlet("/cinemaMap.do")
public class CinemaMap extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ICinemaService service = CinemaServiceImpl.getInstance();
		
		String Nm =request.getParameter("cNm");
		CinemaVO vo = new CinemaVO();
		vo = service.selectMap(Nm);
		request.setAttribute("Cmapvo", vo);
		request.getRequestDispatcher("/view/map.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
