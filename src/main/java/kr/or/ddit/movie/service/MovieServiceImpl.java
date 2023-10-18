package kr.or.ddit.movie.service;

import java.util.List;

import kr.or.ddit.movie.dao.IMovieDao;
import kr.or.ddit.movie.dao.MovieDaoImpl;
import kr.or.ddit.movie.vo.MovieVO;

public class MovieServiceImpl implements IMovieService{
	private IMovieDao dao;
	private static IMovieService service;
	private MovieServiceImpl() {
		dao = MovieDaoImpl.getInstance();
	}
	public static IMovieService getInstance() {
		if(service==null)service = new MovieServiceImpl();
		return service;
	}
	
	
	@Override
	public List<MovieVO> getAllMovies() {
		
		return dao.getAllMovies();
	}
	@Override
	public MovieVO getMovie(String m_id) {
		
		return dao.getMovie(m_id);
	}

	
	
	// 전체 영화 목록 보기
		@Override
		public List<MovieVO> getAllMngMovie() {
			return dao.getAllMngMovie();
		}
		
		// 영화정보 추가 하기
		@Override
		public int insertMovie(MovieVO movieVo) {
			return dao.insertMovie(movieVo);
		}
		
		// 영화 정보 수정 하기
		@Override
		public int updateMovie(MovieVO movieVo) {
			return dao.updateMovie(movieVo);
		}
		
		// 영화 정보 삭제 하기	
		@Override
		public int deleteMovie(String mId) {
			return dao.deleteMovie(mId);
		}
		
		// 점주 상세 정보 조회  (아이디로)
		@Override
		public MovieVO getMovieById(String mId) {
			return dao.getMovieById(mId);
		}
		
		
		@Override
		public List<MovieVO> getMovieByShId(String shId) {
			return dao.getMovieByShId(shId);
		}
		
}
