package kr.or.ddit.theater.service;

import java.util.List;

import kr.or.ddit.theater.dao.ITheaterDao;
import kr.or.ddit.theater.dao.TheaterDaoImpl;
import kr.or.ddit.theater.vo.TheaterVO;

public class TheaterServiceImpl implements ITheaterService{
	
	private ITheaterDao dao;
	private static ITheaterService service;
	private TheaterServiceImpl() {
		dao = TheaterDaoImpl.getInstance();
	}
	public static ITheaterService getInstance() {
		if(service==null)service = new TheaterServiceImpl();
		return service;
	}
	
	@Override
	public List<TheaterVO> getAllTheater() {
		return dao.getAllTheater();
	}
	
	@Override
	public List<TheaterVO> getTheaterById(String shId) {
		return dao.getTheaterById(shId);
	}
	
	@Override
	public int insertTheater(TheaterVO vo) {
		return dao.insertTheater(vo);
	}
	
	@Override
	public String getMaxThId() {
		return dao.getMaxThId();
	}
	
	@Override
	public int getMaxThNm(String cnId) {
		return dao.getMaxThNm(cnId);
	}
	
	@Override
	public int deleteTheater(String thId) {
		return dao.deleteTheater(thId);
	}
	@Override
	public TheaterVO getTheaterByThId(String thId) {
		return dao.getTheaterByThId(thId);
	}
}
