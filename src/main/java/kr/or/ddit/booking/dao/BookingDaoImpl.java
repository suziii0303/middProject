package kr.or.ddit.booking.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.booking.vo.BookingVO;
import kr.or.ddit.booking.vo.ShowReservationVO;
import kr.or.ddit.movie_pay.vo.MoviePayVO;
import kr.or.ddit.reservation.vo.ReservationVO;
import kr.or.ddit.screening.vo.ScreeningVO;
import kr.or.ddit.seat_rsv.vo.SeatRsvVO;
import kr.or.ddit.theater.vo.TheaterVO;
import kr.or.ddit.timetable.vo.TimeTableVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

public class BookingDaoImpl implements IBookingDao{
	private static IBookingDao dao;
	private BookingDaoImpl() {};
	public static IBookingDao getInstance() {
		if(dao==null) dao = new BookingDaoImpl();
		return dao;
	}
	@Override
	public List<TimeTableVO> getTimeTableList(BookingVO bVo) {
		List<TimeTableVO> tList = null;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			tList = sqlSession.selectList("booking.getTimeTableList",bVo);
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return tList;
	}
	@Override
	public List<TimeTableVO> getTimeTableDate(BookingVO bVo) {
		List<TimeTableVO> tList = null;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			tList = sqlSession.selectList("booking.getTimeTableDate",bVo);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return tList;
	}
	@Override
	public List<TheaterVO> getTimeTableTheater(BookingVO bVo) {
		List<TheaterVO> tList = null;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			tList = sqlSession.selectList("booking.getTimeTableTheater",bVo);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return tList;
	}
	@Override
	public List<TimeTableVO> getTimeTableTime(BookingVO bVo) {
		List<TimeTableVO> tList = null;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			tList = sqlSession.selectList("booking.getTimeTableTime",bVo);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return tList;
	}
	@Override
	public int getTnum(TimeTableVO tVo) {
		int result = 0;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			result = sqlSession.selectOne("booking.getTnum",tVo);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return result;
	}
	@Override
	public int getSciNum(ScreeningVO sVo) {
		int result = 0;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			result = sqlSession.selectOne("booking.getSciNum",sVo);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return result;
	}
	@Override
	public int insertReservation(ReservationVO rVo) {
		int cnt = 0;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			cnt = sqlSession.insert("booking.insertReservation",rVo);
		} finally {
			if(cnt>0) sqlSession.commit();
			if(sqlSession != null) sqlSession.close();
		}
		return cnt;
	}
	@Override
	public String getReId(ReservationVO rVo) {
		String re_id = null;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			re_id = sqlSession.selectOne("booking.getReId",rVo);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return re_id;
	}
	@Override
	public int insertSeatRsv(SeatRsvVO sVo) {
		int cnt = 0;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			cnt = sqlSession.insert("booking.insertSeatRsv",sVo);
		} finally {
			if(cnt>0) sqlSession.commit();
			if(sqlSession != null) sqlSession.close();
		}
		return cnt;
	}
	@Override
	public int insertMoviePay(MoviePayVO mVo) {
		int cnt = 0;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			cnt = sqlSession.insert("booking.insertMoviePay",mVo);
		} finally {
			if(cnt>0) sqlSession.commit();
			if(sqlSession != null) sqlSession.close();
		}
		return cnt;
	}
	@Override
	public String getCinemaNameByThId(String th_id) {
		String name = null;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			name = sqlSession.selectOne("booking.getCinemaNameByThId",th_id);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return name;
	}
	@Override
	public int getMpNumByReId(String re_id) {
		int mpNum = 0;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			mpNum = sqlSession.selectOne("booking.getMpNumByReId",re_id);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return mpNum;
	}
	@Override
	public int updateSeatOk(int s_id) {
		int cnt = 0;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			cnt = sqlSession.update("booking.updateSeatOk",s_id);
		} finally {
			if(cnt>0) sqlSession.commit();
			if(sqlSession != null) sqlSession.close();
		}
		return cnt;
	}
	@Override
	public List<ShowReservationVO> showReservationByCId(String c_id) {
		List<ShowReservationVO> rList = null;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			rList = sqlSession.selectList("booking.showReservationByCId",c_id);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		
		return rList;
	}
}
