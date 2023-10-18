package kr.or.ddit.cinema.controller;

import java.io.IOException;
import java.util.List;

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
 * 영화관 정보 페이지에서 등록버튼을 눌렀을 때
 * - GET 방식 요청 시 영화관 정보 입력 폼을 나타냄
 * - POST 방식 요청 시 영화관 정보를 받아서 DB에 등록함
 * @author MJ
 *
 */
@WebServlet("/cinemaInsert.do")
public class CinemaInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ICinemaService service = CinemaServiceImpl.getInstance();
		List<CinemaVO> cList = service.getAllLoc();
		request.setAttribute("list", cList);
		
		request.getRequestDispatcher("/view/shop/cinemaForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String vid = (String) session.getAttribute("id");
		
		ICinemaService service = CinemaServiceImpl.getInstance();
		String maxid = service.getMaxid();
		maxid =String.valueOf(String.format("%03d",Integer.parseInt(maxid)+1));
		
		String cn_loc = request.getParameter("cn_loc");
		String cn_nm = request.getParameter("cn_nm");
		String cn_addr = request.getParameter("cn_addr");
		String cn_map = request.getParameter("cn_map");
		String cn_tel = request.getParameter("cn_tel");
		
		CinemaVO cVo = new CinemaVO();
		cVo.setCn_id(maxid);
		cVo.setSh_id(vid);
		cVo.setCn_loc(cn_loc);
		cVo.setCn_nm(cn_nm);
		cVo.setCn_addr(cn_addr);
		cVo.setCn_tel(cn_tel);
		cVo.setCn_map(cn_map);
		
		service.insertCinema(cVo);
		
		request.getRequestDispatcher("/cinemaView.do").forward(request, response);
			
		
	}

}











