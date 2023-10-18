package kr.or.ddit.timetable.service;

import kr.or.ddit.timetable.vo.TimeTableVO;

public interface ITimetableService {

	//상영관 만들어 질 때 자동으로 상영일정 만들기
	public int insertTimeTable(TimeTableVO vo);
	
}
