package kr.or.ddit.theater.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.theater.vo.TheaterVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

public class TheaterDaoImpl implements ITheaterDao{
	private static ITheaterDao dao;
	private TheaterDaoImpl() {};
	public static ITheaterDao getInstance() {
		if(dao==null) dao = new TheaterDaoImpl();
		return dao;
	}
	
	@Override
	public List<TheaterVO> getAllTheater() {
		List<TheaterVO> theaterList = null;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			theaterList = sqlSession.selectList("theater.getAllTheater");
		} finally {
			if(sqlSession !=null) sqlSession.close();
		}
		return theaterList;
	}
	
	@Override
	public List<TheaterVO> getTheaterById(String shId) {
		List<TheaterVO> theaterList = null;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			theaterList = sqlSession.selectList("theater.getTheaterById", shId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(sqlSession !=null) sqlSession.close();
		}
		return theaterList;
	}
	
	@Override
	public int insertTheater(TheaterVO vo) {
		int res = 0;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			res = sqlSession.insert("theater.insertTheater", vo);
			if(res > 0) sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(sqlSession !=null) sqlSession.close();
		}
		return res;
	}
	
	@Override
	public String getMaxThId() {
		String maxThId = null;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			maxThId = sqlSession.selectOne("theater.getMaxThId");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(sqlSession !=null) sqlSession.close();
		}
		return maxThId;
	}
	
	@Override
	public int getMaxThNm(String cnId) {
		int maxThNm = 0;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			maxThNm = sqlSession.selectOne("theater.getMaxThNm", cnId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(sqlSession !=null) sqlSession.close();
		}
		return maxThNm;
	}
	
	@Override
	public int deleteTheater(String thId) {
		int res = 0;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			res = sqlSession.delete("theater.deleteTheater", thId);
			if(res > 0) sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(sqlSession !=null) sqlSession.close();
		}
		return res;
	}
	@Override
	public TheaterVO getTheaterByThId(String thId) {
		TheaterVO tVo = null;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			tVo = sqlSession.selectOne("theater.getTheaterByThId",thId);
		} finally {
			if(sqlSession !=null) sqlSession.close();
		}
		return tVo;
	}
}
