package kr.or.ddit.cinema.service;

import java.util.List;

import kr.or.ddit.cinema.dao.CinemaDaoImpl;
import kr.or.ddit.cinema.dao.ICinemaDao;
import kr.or.ddit.cinema.vo.CinemaVO;


public class CinemaServiceImpl implements ICinemaService{
	private ICinemaDao dao;
	private static ICinemaService service;
	private CinemaServiceImpl() {
		dao = CinemaDaoImpl.getInstance();
	}
	public static ICinemaService getInstance() {
		if(service==null)service = new CinemaServiceImpl();
		return service;
	}
	
	@Override
	public List<CinemaVO> getAllLoc() {
		return dao.getAllLoc();
	}
	
    @Override
    public CinemaVO getCinemaByShId(String shId) {
      return dao.getCinemaByShId(shId);
	}
    
	@Override
	public List<CinemaVO> getCinemaByLoc(String cn_loc) {
		return dao.getCinemaByLoc(cn_loc);
	}
	
	@Override
	public int insertCinema(CinemaVO vo) {
		return dao.insertCinema(vo);
	}
	
	@Override
	public String getMaxid() {
		return dao.getMaxid();
	}
	
	@Override
	public String getCinemaId(String shId) {
		return dao.getCinemaId(shId);
	}
	@Override
	public CinemaVO getCinemaByCnId(String cnId) {
		return dao.getCinemaByCnId(cnId);
	}
	@Override
	public CinemaVO selectMap(String map) {
		
		return dao.selectMap(map);
	}
}
