package kr.or.ddit.cinema.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.cinema.vo.CinemaVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

public class CinemaDaoImpl implements ICinemaDao{
	private static ICinemaDao dao;
	private CinemaDaoImpl() {};
	public static ICinemaDao getInstance() {
		if(dao==null) dao = new CinemaDaoImpl();
		return dao;
	}
	
	@Override
	public List<CinemaVO> getAllLoc() {
		List<CinemaVO> cList = null;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			cList = sqlSession.selectList("cinema.getAllLoc");
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return cList;
	}
	
	@Override
	   public CinemaVO getCinemaByShId(String shId) {
	      
	      SqlSession session = null; // SqlSession객체 변수 선언
	      CinemaVO vo = null; // 반환값이 저장될 변수

	      // mapper 실행
	      try {
	         session = MyBatisSqlSessionFactory.getSqlSession(); // 수동으로 commit이 필요하다.

	         // sqlSession으로 mapper 실행
	         vo = session.selectOne("cinema.getCinemaByShId",shId); // "namespace.id"

	      } finally {
	         if (session != null)
	            session.close();
	      }

	      return vo;
	   }
	
	@Override
	public List<CinemaVO> getCinemaByLoc(String cn_loc) {
		List<CinemaVO> cList = null;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			cList = sqlSession.selectList("cinema.getCinemaByLoc",cn_loc);
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return cList;
	}
	
	@Override
	public int insertCinema(CinemaVO vo) {
		int res = 0;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			res = sqlSession.insert("cinema.insertCinema", vo);
			if(res > 0) sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			if(sqlSession !=null) sqlSession.close();
		}
		return res;
	}
	
	@Override
	public String getMaxid() {
		String maxid = null;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			maxid = sqlSession.selectOne("cinema.getMaxid");
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			if(sqlSession !=null) sqlSession.close();
		}
		return maxid;
	}
	
	@Override
	public String getCinemaId(String shId) {
		String cnId = null;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			cnId = sqlSession.selectOne("cinema.getCinemaId", shId);
		} catch (Exception e) {
			e.printStackTrace();
		}  finally {
			if(sqlSession !=null) sqlSession.close();
		}
		return cnId;
	}
	@Override
	public CinemaVO getCinemaByCnId(String cnId) {
		CinemaVO cVo = null;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			cVo = sqlSession.selectOne("cinema.getCinemaByCnId",cnId);
		} finally {
			if(sqlSession !=null) sqlSession.close();
		}
		return cVo;
	}
	@Override
	public CinemaVO selectMap(String map) {
		
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		CinemaVO cinemaMap = null;
		
		try {
			cinemaMap = sqlSession.selectOne("cinema.selectMap",map);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return cinemaMap;
	}
	
}
