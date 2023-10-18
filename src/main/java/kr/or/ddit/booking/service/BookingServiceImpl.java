package kr.or.ddit.booking.service;

import java.util.List;

import kr.or.ddit.booking.dao.BookingDaoImpl;
import kr.or.ddit.booking.dao.IBookingDao;
import kr.or.ddit.booking.vo.BookingVO;
import kr.or.ddit.booking.vo.ShowReservationVO;
import kr.or.ddit.movie_pay.vo.MoviePayVO;
import kr.or.ddit.reservation.vo.ReservationVO;
import kr.or.ddit.screening.vo.ScreeningVO;
import kr.or.ddit.seat_rsv.vo.SeatRsvVO;
import kr.or.ddit.theater.vo.TheaterVO;
import kr.or.ddit.timetable.vo.TimeTableVO;

public class BookingServiceImpl implements IBookingService{
	private IBookingDao dao;
	private static IBookingService service;
	private BookingServiceImpl() {
		dao = BookingDaoImpl.getInstance();
	}
	public static IBookingService getInstance() {
		if(service==null)service = new BookingServiceImpl();
		return service;
	}
	@Override
	public List<TimeTableVO> getTimeTableList(BookingVO bVo) {
		
		return dao.getTimeTableList(bVo);
	}
	@Override
	public List<TimeTableVO> getTimeTableDate(BookingVO bVo) {
		
		return dao.getTimeTableDate(bVo);
	}
	@Override
	public List<TheaterVO> getTimeTableTheater(BookingVO bVo) {
		
		return dao.getTimeTableTheater(bVo);
	}
	@Override
	public List<TimeTableVO> getTimeTableTime(BookingVO bVo) {
		return dao.getTimeTableTime(bVo);
	}
	@Override
	public int getTnum(TimeTableVO tVo) {
		
		return dao.getTnum(tVo);
	}
	@Override
	public int getSciNum(ScreeningVO sVo) {
		
		return dao.getSciNum(sVo);
	}
	@Override
	public int insertReservation(ReservationVO rVo) {
		
		return dao.insertReservation(rVo);
	}
	@Override
	public String getReId(ReservationVO rVo) {
		
		return dao.getReId(rVo);
	}
	@Override
	public int insertSeatRsv(SeatRsvVO sVo) {
		
		return dao.insertSeatRsv(sVo);
	}
	@Override
	public int insertMoviePay(MoviePayVO mVo) {
		
		return dao.insertMoviePay(mVo);
	}
	@Override
	public String getCinemaNameByThId(String th_id) {
		
		return dao.getCinemaNameByThId(th_id);
	}
	@Override
	public int getMpNumByReId(String re_id) {
		
		return dao.getMpNumByReId(re_id);
	}
	@Override
	public int updateSeatOk(int s_id) {
		
		return dao.updateSeatOk(s_id);
	}
	@Override
	public List<ShowReservationVO> showReservationByCId(String c_id) {
		
		return dao.showReservationByCId(c_id);
	}
}
