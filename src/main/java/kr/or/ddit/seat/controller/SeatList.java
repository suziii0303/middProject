package kr.or.ddit.seat.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cinema.service.CinemaServiceImpl;
import kr.or.ddit.cinema.service.ICinemaService;
import kr.or.ddit.cinema.vo.CinemaVO;
import kr.or.ddit.manager.service.IManagerService;
import kr.or.ddit.movie.service.IMovieService;
import kr.or.ddit.movie.service.MovieServiceImpl;
import kr.or.ddit.movie.vo.MovieVO;
import kr.or.ddit.seat.service.ISeatService;
import kr.or.ddit.seat.service.SeatServiceImpl;
import kr.or.ddit.seat.vo.SeatVO;
import kr.or.ddit.theater.service.ITheaterService;
import kr.or.ddit.theater.service.TheaterServiceImpl;
import kr.or.ddit.theater.vo.TheaterVO;

/**
 * 좌석들 화면 보여주는 메서드
 */
@WebServlet("/seatList.do")
public class SeatList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		String tid = request.getParameter("tid");
		String cid = request.getParameter("cid");
		String mid = request.getParameter("mid");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		
		ITheaterService ts = TheaterServiceImpl.getInstance();
		TheaterVO tVo = ts.getTheaterByThId(tid);
		String tname = tVo.getTh_nm();
		IMovieService ms = MovieServiceImpl.getInstance();
		MovieVO mVo = ms.getMovie(mid);
		String mname = mVo.getM_subject();
		String mpost = mVo.getM_post();
		ICinemaService cs = CinemaServiceImpl.getInstance();
		CinemaVO cVo = cs.getCinemaByCnId(cid);
		String cname = cVo.getCn_nm();
		ISeatService service = SeatServiceImpl.getInstance();
		List<SeatVO> sList = service.getSeatById(tid);
		HashMap<String,String> map = new HashMap<>();
		map.put("cid", cid);
		map.put("tid", tid);
		map.put("date", date);
		map.put("mid", mid);
		map.put("mname", mname);
		map.put("mpost", mpost);
		map.put("cname", cname);
		map.put("tname", tname);
		map.put("time", time);
		System.out.println(map);
		request.setAttribute("seatList", sList);
		request.setAttribute("data",map);
		request.getRequestDispatcher("/view/reservation/selectseat.jsp").forward(request, response);
	}

}
