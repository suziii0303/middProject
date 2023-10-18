package kr.or.ddit.screening.service;

import java.util.List;

import kr.or.ddit.screening.dao.IScreeningDao;
import kr.or.ddit.screening.dao.ScreeningDaoImpl;
import kr.or.ddit.screening.vo.ScreeningVO;


public class ScreeningServiceImpl implements IScreeningService {

	private static ScreeningServiceImpl service;
	private IScreeningDao dao;		
	private ScreeningServiceImpl() {
		dao = ScreeningDaoImpl.getInstance(); 
	}
	
	public static ScreeningServiceImpl getInstance() {
		if(service==null) service = new ScreeningServiceImpl();
		return service;
	}

	@Override
	public List<ScreeningVO> getScreening(String shId) {
		return dao.getScreening(shId);
	}
	
	@Override
	public int deleteScreening(String thId) {
		return dao.deleteScreening(thId);
	}
	
	@Override
	public int deleteTimeTable(String thId) {
		return dao.deleteTimeTable(thId);
	}

	@Override
	public int insertScreening(ScreeningVO vo) {
		return dao.insertScreening(vo);
	}

	@Override
	public int getMaxSciNum() {
		return dao.getMaxSciNum();
	}

	@Override
	public int deleteScreeningMovie(String tNum) {
		return dao.deleteScreeningMovie(tNum);
	}
	
	

	


}
