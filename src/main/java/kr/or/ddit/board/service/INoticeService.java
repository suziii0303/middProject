package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.NoticePageVO;
import kr.or.ddit.board.vo.NoticeVO;

public interface INoticeService {
	
	// 페이지 정보 얻기 (시작번호, 끝번호, 시작페이지번호, 마지막페이지번호, 총페이지개수)
	public NoticePageVO noPageInfo(int page, String searchNotice);
	
	// 페이지별 리스트
	public List<NoticeVO> NoticePerPage(Map<String, Object> map);
	
	// 전체 게시물 개수
	public int totalNotice(Map<String, Object> map);
	
	// 게시물 상세조회
	public NoticeVO getNotice(int num);
	
	// 게시물 등록
	public int insertNotice(NoticeVO vo);
	
	// 게시물 수정
	public int updateNotice(NoticeVO vo);
	
	// 게시물 삭제
	public int deleteNotice(int num);

	// 조회수 증가
	int updateNoHit(int num);

}
