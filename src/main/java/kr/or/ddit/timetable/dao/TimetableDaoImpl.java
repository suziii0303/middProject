package kr.or.ddit.timetable.dao;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.timetable.vo.TimeTableVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

public class TimetableDaoImpl implements ITimetableDao {

	private static ITimetableDao dao;
	private TimetableDaoImpl() {};
	public static ITimetableDao getInstance() {
		if(dao==null) dao = new TimetableDaoImpl();
		return dao;
	}
	
	@Override
	public int insertTimeTable(TimeTableVO vo) {
		int cnt = 0;
		SqlSession session = null;
		try {
			session = MyBatisSqlSessionFactory.getSqlSession();
			cnt = session.insert("timeTable.insertTimeTable",vo);
		} finally {
			session.commit();
			if(session!=null)session.close();
		}
		return cnt;
	}

}
