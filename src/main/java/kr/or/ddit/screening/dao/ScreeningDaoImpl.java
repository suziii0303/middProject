package kr.or.ddit.screening.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.screening.vo.ScreeningVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

public class ScreeningDaoImpl implements IScreeningDao {
	
	private static ScreeningDaoImpl dao;
	private ScreeningDaoImpl() {	}
	public static ScreeningDaoImpl getInstance() {
		if(dao==null) dao = new ScreeningDaoImpl();
		return dao;
	}
	

	@Override
	public List<ScreeningVO> getScreening(String shId) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();  
		
		List<ScreeningVO> screeningList = null;  
		
		try {
			screeningList = session.selectList("screening.getScreening", shId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return screeningList;
	}

	@Override
	public int deleteScreening(String thId) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();  
		
		int cnt = 0;
		try {
			cnt = session.delete("screening.deleteScreening", thId);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		} 
		
		return cnt;
	}

	@Override
	public int deleteTimeTable(String thId) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();  
		
		int cnt = 0;
		
		try {
			cnt = session.delete("screening.deleteTimeTable", thId);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}	
		
		return cnt;
	}

	@Override
	public int insertScreening(ScreeningVO vo) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();  
		
		int cnt = 0;
		
		try {
			cnt = session.insert("screening.insertScreening", vo);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}	
		
		return cnt;
	}

	@Override
	public int getMaxSciNum() {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();  
		
		int sciNum = 0;  
		
		try {
			sciNum = session.selectOne("screening.getMaxSciNum");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		
		return sciNum;
	}

	@Override
	public int deleteScreeningMovie(String tNum) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();  
		
		int cnt = 0;
		try {
			cnt = session.delete("screening.deleteScreeningMovie", tNum);
			if(cnt > 0) session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		} 
		
		return cnt;
	}


	


}
