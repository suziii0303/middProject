package kr.or.ddit.cinema.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.cinema.service.CinemaServiceImpl;
import kr.or.ddit.cinema.service.ICinemaService;
import kr.or.ddit.cinema.vo.CinemaVO;

/**
 * 
 * 영화관 정보 페이지 출력
 * - 해당 점주의 영화관 정보를 가져와서 영화관 정보 페이지를 출력함
 * @author MJ
 *
 */
@WebServlet("/cinemaView.do")
public class CinemaView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String vid = (String) session.getAttribute("id");
		
		ICinemaService service = CinemaServiceImpl.getInstance();
		CinemaVO cVo = service.getCinemaByShId(vid);
		request.setAttribute("cVo", cVo);
		
		request.getRequestDispatcher("/view/shop/cinemaView.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
