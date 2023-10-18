package kr.or.ddit.seat.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.seat.vo.SeatVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

public class SeatDaoImpl implements ISeatDao{
	private static ISeatDao dao;
	private SeatDaoImpl() {};
	public static ISeatDao getInstance() {
		if(dao==null) dao = new SeatDaoImpl();
		return dao;
	}
	@Override
	public int insertSeat(SeatVO sVo) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("seat.insertSeat",sVo);
		} finally {
			session.commit();
			if(session!=null)session.close();
		}
		return cnt;
	}
	@Override
	public int deleteSeat(String th_id) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			cnt = session.delete("seat.deleteSeat",th_id);
		} finally {
			session.commit();
			if(session!=null)session.close();
		}
		return cnt;
	}
	@Override
	public int updateSeat(int s_id) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			cnt = session.update("seat.updateSeat",s_id);
		} finally {
			session.commit();
			if(session!=null)session.close();
		}
		return cnt;
	}
	@Override
	public List<SeatVO> getSeatById(String th_id) {
		List<SeatVO> sList = null;
		SqlSession session = null;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			sList = session.selectList("seat.getSeatById",th_id);
		} finally {
			if(session!=null)session.close();
		}
		return sList;
	}
	@Override
	public List<SeatVO> getSeatNmById(String re_id) {
		List<SeatVO> sList = null;
		SqlSession session = null;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			sList = session.selectList("seat.getSeatNmById",re_id);
		} finally {
			if(session!=null)session.close();
		}
		return sList;
	}
	
}
