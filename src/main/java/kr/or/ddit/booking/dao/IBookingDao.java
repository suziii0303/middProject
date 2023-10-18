package kr.or.ddit.booking.dao;

import java.util.List;

import kr.or.ddit.booking.vo.BookingVO;
import kr.or.ddit.booking.vo.ShowReservationVO;
import kr.or.ddit.movie_pay.vo.MoviePayVO;
import kr.or.ddit.reservation.vo.ReservationVO;
import kr.or.ddit.screening.vo.ScreeningVO;
import kr.or.ddit.seat_rsv.vo.SeatRsvVO;
import kr.or.ddit.theater.vo.TheaterVO;
import kr.or.ddit.timetable.vo.TimeTableVO;

public interface IBookingDao {

	/**
	 * 영화 id값(m_id)과 영화관 id값(cn_id)을 받아서 해당하는 상영 정보가 있는지 조회하는 매서드
	 * @param bVo 영화 id와 영화관 id값을 BookingVO 객체에 담아 메서드 실행
	 * @return 상영정보가 담긴 TimeTableVO객체를 list에 담아 반환
	 */
	 public List<TimeTableVO> getTimeTableList(BookingVO bVo);
	 
	 /**
	  * 영화 id값(m_id)과 영화관 id값(cn_id)을 받아서 해당하는 상영 날짜를 조회하는 메서드
	  * @param bVo
	  * @return
	  */
	 public List<TimeTableVO> getTimeTableDate(BookingVO bVo);
	 
	 /**
	  * 영화 id값(m_id)과 영화관 id값(cn_id), 상영날짜(t_date)를 받아서 해당하는 상영관을 조회하는 메서드
	  * @param bVo
	  * @return
	  */
	 public List<TheaterVO> getTimeTableTheater(BookingVO bVo);
	 
	 /**
	  * 상영관 클릭 시, 해당 영화를 상영하는 조회한 영화관에 해당하는 상영 시간들이 출력되는 메서드
	  * @param bVo
	  * @return
	  */
	 public List<TimeTableVO> getTimeTableTime(BookingVO bVo);
	 
	 public int getTnum(TimeTableVO tVo);
	 
	 public int getSciNum(ScreeningVO sVo);
	 
	 public int insertReservation(ReservationVO rVo);
	 
	 public String getReId(ReservationVO rVo);
	 
	 public int insertSeatRsv(SeatRsvVO sVo);
	 
	 public int insertMoviePay(MoviePayVO mVo);
	 
	 public String getCinemaNameByThId(String th_id);
	 
	 public int getMpNumByReId(String re_id);
	 
	 public int updateSeatOk(int s_id);
	 
	 public List<ShowReservationVO> showReservationByCId(String c_id);
}
