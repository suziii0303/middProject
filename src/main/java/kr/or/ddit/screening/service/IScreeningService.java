package kr.or.ddit.screening.service;

import java.util.List;

import kr.or.ddit.screening.vo.ScreeningVO;

public interface IScreeningService {
	
	public List<ScreeningVO> getScreening(String shId);
	
	public int deleteScreening(String thId);
	
	public int deleteTimeTable(String thId);
	
	public int insertScreening(ScreeningVO vo);
	
	public int getMaxSciNum();
	
	public int deleteScreeningMovie(String tNum);
}
