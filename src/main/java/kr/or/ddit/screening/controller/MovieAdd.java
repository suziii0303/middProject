package kr.or.ddit.screening.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.screening.service.IScreeningService;
import kr.or.ddit.screening.service.ScreeningServiceImpl;
import kr.or.ddit.screening.vo.ScreeningVO;

/**
 * 
 * 상영일정관리 > 영화추가 > 선택 버튼을 눌렀을 때 
 * @author MJ
 *
 */
@WebServlet("/movieAdd.do")
public class MovieAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String vid = (String) session.getAttribute("id");

		IScreeningService service = ScreeningServiceImpl.getInstance();
		
		int tNum = Integer.parseInt(request.getParameter("t_num"));
		String mId = request.getParameter("m_id");
		int sciNum = service.getMaxSciNum();
		sciNum++;
		
		ScreeningVO sVo = new ScreeningVO();
		sVo.setT_num(tNum);
		sVo.setM_id(mId);
		sVo.setSci_num(sciNum);
		
		service.insertScreening(sVo);
		
		request.getRequestDispatcher("/screeningList.do").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
