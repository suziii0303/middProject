package kr.or.ddit.movie.service;

import java.util.List;

import kr.or.ddit.movie.vo.MovieVO;

public interface IMovieService {
	/**
	 * 고객 로그인 후 영화 선택 시 존재하는 모든 영화 테이블 데이터를 출력하는 메서드
	 * @return 출력할 데이터를 MovieVO 객체에 담아 List로 출력
	 */
	public List<MovieVO> getAllMovies();
	
	/**
	 * 영화 상세보기 버튼 클릭 시 해당 영화의 정보를 출력하는 메서드
	 * @param m_id 출력할 영화정보에 해당하는 m_id값
	 * @return 출력할 데이터를 MovieVO 객체에 담아 출력
	 */
	public MovieVO getMovie(String m_id);
	
	
	
	// 전체 영화 목록 보기
	public List<MovieVO> getAllMngMovie();
	
	// 영화정보 추가 하기
	 public int insertMovie (MovieVO movieVo);
	
	// 영화 정보 수정 하기
	public int updateMovie(MovieVO movieVo);
	 
	// 영화 정보 삭제 하기	
	public int deleteMovie(String mId);
	
	// 점주 상세 정보 조회  (아이디로)
	public MovieVO getMovieById(String mId);
	
	
	public List<MovieVO> getMovieByShId(String shId);

}
