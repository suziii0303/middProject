package kr.or.ddit.seat.service;

import java.util.List;

import kr.or.ddit.seat.vo.SeatVO;

public interface ISeatService {
	public int insertSeat(SeatVO sVo);

	public int deleteSeat(String th_id);

	public int updateSeat(int s_id);

	public List<SeatVO> getSeatById(String th_id);
	
	public List<SeatVO> getSeatNmById(String re_id);
	
}
