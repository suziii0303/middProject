package kr.or.ddit.booking.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.booking.service.BookingServiceImpl;
import kr.or.ddit.booking.service.IBookingService;
import kr.or.ddit.movie.service.IMovieService;
import kr.or.ddit.movie.service.MovieServiceImpl;
import kr.or.ddit.movie.vo.MovieVO;
import kr.or.ddit.movie_pay.vo.MoviePayVO;
import kr.or.ddit.reservation.vo.ReservationVO;
import kr.or.ddit.screening.service.IScreeningService;
import kr.or.ddit.screening.service.ScreeningServiceImpl;
import kr.or.ddit.screening.vo.ScreeningVO;
import kr.or.ddit.seat.service.ISeatService;
import kr.or.ddit.seat.service.SeatServiceImpl;
import kr.or.ddit.seat.vo.SeatVO;
import kr.or.ddit.seat_rsv.vo.SeatRsvVO;
import kr.or.ddit.theater.service.ITheaterService;
import kr.or.ddit.theater.service.TheaterServiceImpl;
import kr.or.ddit.theater.vo.TheaterVO;
import kr.or.ddit.timetable.vo.TimeTableVO;

/**
 * Servlet implementation class Reservation
 */
@WebServlet("/reservation.do")
public class Reservation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String sid = request.getParameter("sid");	
		String[] array = sid.split(",\\s*");
		System.out.println(array);
		System.out.println(array.length);
		System.out.println(array[0]);
		String tid = request.getParameter("tid");		
		String date = request.getParameter("date");	
		String time = request.getParameter("time");	
		String mid = request.getParameter("mid");	
		String vid = request.getParameter("vid");	
		
		System.out.println(sid);
		
	  TimeTableVO tVo = new TimeTableVO(); tVo.setTh_id(tid); tVo.setT_date(date);
	  tVo.setT_time(time); IBookingService s1 = BookingServiceImpl.getInstance();
	  int t_num = s1.getTnum(tVo);
	  
	  ScreeningVO sVo = new ScreeningVO(); sVo.setT_num(t_num); sVo.setM_id(mid);
	  int sci_num = s1.getSciNum(sVo);
	  
	  ReservationVO rVo = new ReservationVO(); rVo.setSci_num(sci_num);
	  rVo.setC_id(vid);
	  
	  s1.insertReservation(rVo);
	  
	  String re_id = s1.getReId(rVo);
	  
	  SeatRsvVO srVo = new SeatRsvVO();
	  srVo.setRe_id(re_id);
	  
	  for(int i = 0; i < array.length; i++) {
		  int s_id = Integer.parseInt(array[i]);
		  srVo.setS_id(s_id);
		  s1.insertSeatRsv(srVo);
		  
		  s1.updateSeatOk(s_id);
		  
	  }
	  
	  MoviePayVO mVo = new MoviePayVO();
	  mVo.setRe_id(re_id);
	  s1.insertMoviePay(mVo);
	  
	  IMovieService s2 = MovieServiceImpl.getInstance();
	  MovieVO movieVo = s2.getMovieById(mid);
	  
	  ISeatService s3 = SeatServiceImpl.getInstance();
	  List<SeatVO> seatVo = s3.getSeatNmById(re_id);
	  
	  String cName = s1.getCinemaNameByThId(tid);
	  
	  ITheaterService s4 = TheaterServiceImpl.getInstance();
	  TheaterVO tVo2 = s4.getTheaterByThId(tid);
	  String tName = tVo2.getTh_nm();
	  
	  int mp_num = s1.getMpNumByReId(re_id);
	  request.setAttribute("movieVo", movieVo);
	  request.setAttribute("seatVo", seatVo);
	  request.setAttribute("cName", cName);
	  request.setAttribute("date", date);
	  request.setAttribute("time", time);
	  request.setAttribute("qty", String.valueOf(array.length));
	  request.setAttribute("totalPrice", String.valueOf((array.length)*15000));
	  request.setAttribute("tName", tName);
	  request.setAttribute("mpNum", String.valueOf(mp_num));
	  request.getRequestDispatcher("/view/reservation/pay.jsp").forward(request, response);
		
		
		
	}

}
