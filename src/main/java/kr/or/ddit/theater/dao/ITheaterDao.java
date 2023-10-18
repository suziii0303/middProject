package kr.or.ddit.theater.dao;

import java.util.List;

import kr.or.ddit.movie.vo.MovieVO;
import kr.or.ddit.theater.vo.TheaterVO;

public interface ITheaterDao {

	public List<TheaterVO> getAllTheater();
	
	public List<TheaterVO> getTheaterById(String shId);
	
	public int insertTheater(TheaterVO vo);
	
	public String getMaxThId();
	
	public int getMaxThNm(String cnId);
	
	public int deleteTheater(String thId);
	
	public TheaterVO getTheaterByThId(String thId);
	
}
