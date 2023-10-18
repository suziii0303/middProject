package kr.or.ddit.cinema.service;

import java.util.List;

import kr.or.ddit.cinema.vo.CinemaVO;

public interface ICinemaService {
	
	public List<CinemaVO> getAllLoc();

    public CinemaVO getCinemaByShId(String shId);
	
	public List<CinemaVO> getCinemaByLoc(String cn_loc);
	
	public int insertCinema(CinemaVO vo);
	
	public String getMaxid();
	
	public String getCinemaId(String shId);
	
	public CinemaVO getCinemaByCnId(String cnId);
	
	// 수지 : map 조회
	public CinemaVO selectMap (String map);
	   
}
