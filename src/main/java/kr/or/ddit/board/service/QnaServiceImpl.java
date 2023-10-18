package kr.or.ddit.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.IQnaDao;
import kr.or.ddit.board.dao.QnaDaoImpl;
import kr.or.ddit.board.vo.QnAVO;
import kr.or.ddit.board.vo.QnaPageVO;
import kr.or.ddit.board.vo.ReplyVO;

public class QnaServiceImpl implements IQnaService {

	// dao객체, service객체 선언
	private IQnaDao dao;
	private static IQnaService service;
	
	// dao객체 얻기
	private QnaServiceImpl() {
		dao = QnaDaoImpl.getDao();
	}
	
	// service 싱글톤
	public static IQnaService getService() {
		if(service == null) service = new QnaServiceImpl();
		return service;
	}

	
	@Override
	public QnaPageVO qnaPageInfo(int page, String searchQna) {
		
		// 전체 글 개수
		Map<String, Object> map = new HashMap<>();
		map.put("sword", searchQna);
			      
		int count = this.totalQna(map);
	
		// 전체페이지 수 구하기
		int totalPage = (int)(Math.ceil((double)count / QnaPageVO.getqPerList()));  // 3으로 나누기 
		
		// start, end
		int start = (page-1) * QnaPageVO.getqPerList() + 1;
		int end = start + QnaPageVO.getqPerList() - 1;
		
		// ex) 20페이지까지 있으므로, 21페이지는 생성불가
		if(end > count) {
		   end = count;
		}
		
		// startPage, endPage
		int perPage = QnaPageVO.getqPerPage(); // PerPage = 2
		int startPage = ((page-1) / perPage * perPage) + 1;
		int endPage = startPage + perPage - 1;
		
		// ex) 7페이지까지 있으므로, 8페이지는 생성불가
		if(endPage > totalPage) {
		   endPage = totalPage;
		}
		
		System.out.println("start=" + start);
		System.out.println("end=" + end);
		System.out.println("startPage=" + startPage);
		System.out.println("endPage=" + endPage);
		System.out.println("totalPage=" + totalPage);
		 
		QnaPageVO qvo = new QnaPageVO();
		 
		qvo.setqStart(start); //startPage 넣지 않는다.
		qvo.setqEnd(end);
		qvo.setqStartPage(startPage);
		qvo.setqEndPage(endPage);
		qvo.setqTotalPage(totalPage);
		qvo.setqCount(count);
		  
		return qvo;
	}

	@Override
	public List<QnAVO> qnaPerPage(Map<String, Object> map) {
		return dao.qnaPerPage(map);
	}

	@Override
	public int totalQna(Map<String, Object> map) {
		return dao.totalQna(map);
	}
	
	@Override
	public QnAVO getQna(int num) {
		return dao.getQna(num);
	}

	@Override
	public int insertQna(QnAVO vo) {
		return dao.insertQna(vo);
	}

	@Override
	public int updateQna(QnAVO vo) {
		return dao.updateQna(vo);
	}

	@Override
	public int deleteQna(int num) {
		return dao.deleteQna(num);
	}

	@Override
	public int insertReply(ReplyVO rvo) {
		return dao.insertReply(rvo);
	}

	@Override
	public int updateReply(ReplyVO rvo) {
		return dao.updateReply(rvo);
	}

	@Override
	public int deleteReply(int r_num) {
		return dao.deleteReply(r_num);
	}


	@Override
	public int totalReply(int q_num) {
		return dao.totalReply(q_num);
	}

	@Override
	public List<ReplyVO> getAllReply(int q_num) {
		return dao.getAllReply(q_num);
	}

	@Override
	public int deleteReplyByQnum(int q_num) {
		
		return dao.deleteReplyByQnum(q_num);
	}


}
