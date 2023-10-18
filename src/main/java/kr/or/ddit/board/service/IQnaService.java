package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.NoticePageVO;
import kr.or.ddit.board.vo.QnAVO;
import kr.or.ddit.board.vo.QnaPageVO;
import kr.or.ddit.board.vo.ReplyVO;

public interface IQnaService {
	
	// 페이지 정보 얻기 (시작번호, 끝번호, 시작페이지번호, 마지막페이지번호, 총페이지개수)
	public QnaPageVO qnaPageInfo(int page, String searchQna);
	
	// 페이지별 리스트
	public List<QnAVO> qnaPerPage(Map<String, Object> map);
	
	// 전체 게시물 개수
	public int totalQna(Map<String, Object> map);
	
	// 게시글 상세조회
	public QnAVO getQna(int num);
	
	// 게시글 등록
	public int insertQna(QnAVO vo);
	
	// 게시글 수정
	public int updateQna(QnAVO vo);
	
	// 게시글 삭제
	public int deleteQna(int num);
	
	// 댓글 등록
	public int insertReply(ReplyVO rvo);
	
	// 댓글 수정
	public int updateReply(ReplyVO rvo);
	
	// 댓글 삭제
	public int deleteReply(int r_num);
	
	// 댓글 리스트
	public List<ReplyVO> getAllReply(int q_num);
	
	// 댓글 개수
	public int totalReply(int q_num);
	
	// 게시글 삭제시 해당 댓글 삭제
	public int deleteReplyByQnum(int q_num);
}
