package kr.or.ddit.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.INoticeDao;
import kr.or.ddit.board.dao.NoticeDaoImpl;
import kr.or.ddit.board.vo.NoticePageVO;
import kr.or.ddit.board.vo.NoticeVO;

public class NoticeServiceImpl implements INoticeService {

	// dao객체, service객체 선언
	private INoticeDao dao;
	private static INoticeService service;
	
	// dao객체 얻기
	private NoticeServiceImpl() {
		dao = NoticeDaoImpl.getDao();
	}
	
	// service 싱글톤
	public static INoticeService getService() {
		if(service == null) service = new NoticeServiceImpl();
		return service;
	}
	
	
	@Override
	public NoticePageVO noPageInfo(int page, String searchNotice) {
		
	      // 전체 글 개수
	      Map<String, Object> map = new HashMap<>();
	      map.put("sword", searchNotice);
	      
	      int count = this.totalNotice(map);
	      
	      // 전체페이지 수 구하기
	      int totalPage = (int)(Math.ceil((double)count / NoticePageVO.getnPerList()));  // 3으로 나누기 
	      
	      // start, end
	      int start = (page-1) * NoticePageVO.getnPerList() + 1;
	      int end = start + NoticePageVO.getnPerList() - 1;
	      
	      // ex) 20페이지까지 있으므로, 21페이지는 생성불가
	      if(end > count) {
	         end = count;
	      }
	      
	      // startPage, endPage
	      int perPage = NoticePageVO.getnPerPage(); // PerPage = 2
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
	      
	      NoticePageVO nvo = new NoticePageVO();
	      
	      nvo.setnStart(start); //startPage 넣지 않는다.
	      nvo.setnEnd(end);
	      nvo.setnStartPage(startPage);
	      nvo.setnEndPage(endPage);
	      nvo.setnTotalPage(totalPage);
	      nvo.setnCount(count);
	      
	      return nvo;
	}

	@Override
	public List<NoticeVO> NoticePerPage(Map<String, Object> map) {
		return dao.noticePerPage(map);
	}

	@Override
	public int totalNotice(Map<String, Object> map) {
		return dao.totalNotice(map);
	}

	@Override
	public int updateNoHit(int num) {
		return dao.updateNoHit(num);
	}

	@Override
	public int insertNotice(NoticeVO vo) {
		return dao.insertNotice(vo);
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		return dao.updateNotice(vo);
	}

	@Override
	public int deleteNotice(int num) {
		return dao.deleteNotice(num);
	}

	@Override
	public NoticeVO getNotice(int num) {
		return dao.getNotice(num);
	}

}
