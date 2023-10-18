package kr.or.ddit.board.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.QnAVO;
import kr.or.ddit.board.vo.ReplyVO;

public interface IQnaDao {
	
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
