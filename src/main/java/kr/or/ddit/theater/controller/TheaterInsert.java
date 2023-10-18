package kr.or.ddit.theater.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.cinema.service.CinemaServiceImpl;
import kr.or.ddit.cinema.service.ICinemaService;
import kr.or.ddit.seat.service.ISeatService;
import kr.or.ddit.seat.service.SeatServiceImpl;
import kr.or.ddit.seat.vo.SeatVO;
import kr.or.ddit.theater.service.ITheaterService;
import kr.or.ddit.theater.service.TheaterServiceImpl;
import kr.or.ddit.theater.vo.TheaterVO;
import kr.or.ddit.timetable.service.ITimetableService;
import kr.or.ddit.timetable.service.TimetableServiceImpl;
import kr.or.ddit.timetable.vo.TimeTableVO;

/**
 * 
 * 상영관관리 페이지에서 상영관 추가 버튼 눌렀을 때
 * - GET 방식 요청 시 추가될 상영관 정보 폼을 나타냄
 * - POST 방식 요청 시 상영관 정보를 DB에 추가하고 좌석 정보를 생성하여 DB에 추가함
 * @author MJ
 *
 */
@WebServlet("/theaterInsert.do")
public class TheaterInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		TheaterVO tVo = new TheaterVO();
		
		HttpSession session = request.getSession();
		String vid = (String) session.getAttribute("id");
		
		ITheaterService service = TheaterServiceImpl.getInstance();
		ICinemaService cService = CinemaServiceImpl.getInstance();
	
		String cnId = cService.getCinemaId(vid);
		
		int maxThNm = service.getMaxThNm(cnId); 
		int maxThNmInt = maxThNm + 1;
		String incrementedMaxThNm = String.valueOf(maxThNmInt) + "관";
		
		tVo.setTh_nm(incrementedMaxThNm);
		
		request.setAttribute("tVo", tVo);
		
		request.getRequestDispatcher("/view/shop/theaterForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		TheaterVO tVo = new TheaterVO();
		
		HttpSession session = request.getSession();
		String vid = (String) session.getAttribute("id");
		
		ITheaterService service = TheaterServiceImpl.getInstance();
		ICinemaService cService = CinemaServiceImpl.getInstance();
		
		String cnId = cService.getCinemaId(vid);
		
		int maxThNm = service.getMaxThNm(cnId); 
		int maxThNmInt = maxThNm + 1;
		String incrementedMaxThNm = String.valueOf(maxThNmInt) + "관";
		
		
		String maxThId = String.valueOf(Integer.parseInt(service.getMaxThId()) + 1);
		
		tVo.setTh_id(maxThId);
		tVo.setCn_id(cnId);
		tVo.setTh_nm(incrementedMaxThNm);
		
		service.insertTheater(tVo);
		
		ISeatService seatService = SeatServiceImpl.getInstance();
		SeatVO sVo = new SeatVO();
		sVo.setTh_id(maxThId);
		String seatNm = null;
		for(int j=65; j<75; j++) {
			char a = (char) j;
			for(int i =1; i<15; i++) {
				seatNm = a+(i+"");
				sVo.setS_nm(seatNm);
				seatService.insertSeat(sVo);
			}
		}
			
			
			ITimetableService timetableService = TimetableServiceImpl.getInstance();
			TimeTableVO vo = new TimeTableVO();
			vo.setTh_id(maxThId);
			
			String date = null;
			String time = null;
			
			for(int d=20; d<23; d++) {  // date 넣기 06/20~06/22
				date = "2023/06/"+d;  // date 넣기 06/20~06/22
				vo.setT_date(date);
				for(int t =10; t<20; t=t+3) { // time넣기   10:00~19:00
					time = t+":00";  // time넣기   10:00~19:00
					vo.setT_time(time);
					timetableService.insertTimeTable(vo);
				}	
			
		}

		
		
		request.getRequestDispatcher("/theaterList.do").forward(request, response);
	}

}
