package kr.or.ddit.movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.movie.vo.MovieVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

public class MovieDaoImpl implements IMovieDao{
	private static IMovieDao dao;
	private MovieDaoImpl() {};
	public static IMovieDao getInstance() {
		if(dao==null) dao = new MovieDaoImpl();
		return dao;
	}
	@Override
	public List<MovieVO> getAllMovies() {
		List<MovieVO> mList = null;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			mList = sqlSession.selectList("movie.getAllMovies");
		} finally {
			if(sqlSession !=null) sqlSession.close();
		}
		return mList;
	}
	@Override
	public MovieVO getMovie(String m_id) {
		MovieVO mVo = null;
		SqlSession sqlSession = null;
		try {
			sqlSession = MyBatisSqlSessionFactory.getSqlSession();
			mVo = sqlSession.selectOne("movie.getMovie",m_id);
		} finally {
			if(sqlSession !=null) sqlSession.close();
		}
		return mVo;
	}

	
	
	// 전체 영화 목록 조회
	@Override
	public List<MovieVO> getAllMngMovie() {
		SqlSession session = null; // SqlSession객체 변수 선언
		List<MovieVO> list = null; // 반환값이 저장될 변수

		// mapper 실행
		try {
			session = MyBatisSqlSessionFactory.getSqlSession(); // 수동으로 commit이 필요하다.

			// sqlSession으로 mapper 실행
			list = session.selectList("movie.getAllMngMovie"); // "namespace.id"

		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}
	
	
	// 영화 정보 추가 하기
	@Override
	public int insertMovie(MovieVO movieVo) {
		SqlSession session = null; // SqlSession객체 변수 선언

		// 리턴 타입 변수 선언
		int cnt = 0;

		// mapper 실행
		try {

			session = MyBatisSqlSessionFactory.getSqlSession(); // 수동으로 commit이 필요하다.
			// sqlSession 으로 mapper 수행
			cnt = session.insert("movie.insertMovie", movieVo); // (namespase이름.id이름, 파라미터타입 변수명)

			if (cnt > 0) {
				session.commit();
			}

		} finally {
			if (session != null)
				session.close();
		}

		return cnt;
	}
	
	
	
	// 영화 정보 수정 하기
	@Override
	public int updateMovie(MovieVO movieVo) {
		SqlSession session = null; // SqlSession객체 변수 선언

		// 리턴 타입 변수 선언
		int cnt = 0;

		// mapper 실행
		try {

			session = MyBatisSqlSessionFactory.getSqlSession(); // 수동으로 commit이 필요하다.
			// sqlSession 으로 mapper 수행
			cnt = session.update("movie.updateMovie", movieVo); // (namespase이름.id이름, 파라미터타입 변수명)

			if (cnt > 0) {
				session.commit();
			}

		} finally {
			if (session != null)
				session.close();
		}

		return cnt;
	}
	
	
	// 영화 정보 삭제 하기
	@Override
	public int deleteMovie(String mId) {
		SqlSession session = null; // SqlSession객체 변수 선언

		// 리턴 타입 변수 선언
		int cnt = 0;

		// mapper 실행
		try {

			session = MyBatisSqlSessionFactory.getSqlSession(); // 수동으로 commit이 필요하다.
			// sqlSession 으로 mapper 수행
			cnt = session.update("movie.deleteMovie", mId); // (namespase이름.id이름, 파라미터타입 변수명)

			if (cnt > 0) {
				session.commit();
			}

		} finally {
			if (session != null)
				session.close();
		}

		return cnt;
	}
	
	
	// 영화 정보 조회하기(아이디로)
	@Override
	public MovieVO getMovieById(String mId) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();  // MyBatis 처리용 객체 생성
		
		MovieVO vo = null;
		
		try {
			vo = session.selectOne("movie.getMovieById", mId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		} 
		return vo;
	}
	@Override
	public List<MovieVO> getMovieByShId(String shId) {
		SqlSession session = null; 
		List<MovieVO> list = null; 

		try {
			session = MyBatisSqlSessionFactory.getSqlSession(); 

			list = session.selectList("movie.getMovieByShId", shId); 

		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}

	
	
}
