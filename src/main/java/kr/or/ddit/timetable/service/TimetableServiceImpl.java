package kr.or.ddit.timetable.service;


import kr.or.ddit.timetable.dao.ITimetableDao;
import kr.or.ddit.timetable.dao.TimetableDaoImpl;
import kr.or.ddit.timetable.vo.TimeTableVO;

public class TimetableServiceImpl implements ITimetableService {
	
	private ITimetableDao dao;
	private static ITimetableService service;
	private TimetableServiceImpl() {
		dao = TimetableDaoImpl.getInstance();
	}
	public static ITimetableService getInstance() {
		if(service==null)service = new TimetableServiceImpl();
		return service;
	}
	
	@Override
	public int insertTimeTable(TimeTableVO vo) {
		return dao.insertTimeTable(vo);
	}

}
