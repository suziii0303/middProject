package kr.or.ddit.board.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.NoticeVO;

public interface INoticeDao {
	
	// 페이지별 리스트
	public List<NoticeVO> noticePerPage(Map<String, Object> map);
	
	// 전체 게시물 개수
	public int totalNotice(Map<String, Object> map);
	
	// 조회수 증가
	public int updateNoHit(int num);
	
	// 게시물 상세조회
	public NoticeVO getNotice(int num);
	
	// 게시물 등록
	public int insertNotice(NoticeVO vo);
	
	// 게시물 수정
	public int updateNotice(NoticeVO vo);
	
	// 게시물 삭제
	public int deleteNotice(int num);
	
}
