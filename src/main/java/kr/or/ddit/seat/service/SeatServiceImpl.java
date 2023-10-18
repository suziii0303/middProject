package kr.or.ddit.seat.service;


import java.util.List;

import kr.or.ddit.seat.dao.ISeatDao;
import kr.or.ddit.seat.dao.SeatDaoImpl;
import kr.or.ddit.seat.vo.SeatVO;

public class SeatServiceImpl implements ISeatService{
	private ISeatDao dao;
	private static ISeatService service;
	private SeatServiceImpl() {
		dao = SeatDaoImpl.getInstance();
	}
	public static ISeatService getInstance() {
		if(service==null)service = new SeatServiceImpl();
		return service;
	}
	@Override
	public int insertSeat(SeatVO sVo) {
		
		return dao.insertSeat(sVo);
	}
	@Override
	public int deleteSeat(String th_id) {
		
		return dao.deleteSeat(th_id);
	}
	@Override
	public int updateSeat(int s_id) {
		
		return dao.updateSeat(s_id);
	}
	@Override
	public List<SeatVO> getSeatById(String th_id) {
		
		return dao.getSeatById(th_id);
	}
	@Override
	public List<SeatVO> getSeatNmById(String re_id) {

		return dao.getSeatNmById(re_id);
	}
	
	
}
