package kr.or.ddit.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.vo.NoticeVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

public class NoticeDaoImpl implements INoticeDao {

	// dao 싱글톤
	private static INoticeDao dao;
	public static INoticeDao getDao() {
		if(dao == null) dao = new NoticeDaoImpl();
		return dao;
	}
	
	@Override
	public List<NoticeVO> noticePerPage(Map<String, Object> map) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		
		List<NoticeVO> list = null;
		
		try {
			list = sqlSession.selectList("notice.noticePerPage", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return list;
	}

	@Override
	public int totalNotice(Map<String, Object> map) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		
		int res = 0;
		
		try {
			res = sqlSession.selectOne("notice.totalNotice", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
				
		return res;
	}

	@Override
	public int updateNoHit(int num) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		
		try {
			res = sqlSession.update("notice.updateNoHit", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
		return res;
	}

	@Override
	public int insertNotice(NoticeVO vo) { 
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		
		try {
			res = sqlSession.insert("notice.insertNotice", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
		return res;
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		
		try {
			res = sqlSession.update("notice.updateNotice", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
		return res;
	}

	@Override
	public int deleteNotice(int num) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		
		try {
			res = sqlSession.delete("notice.deleteNotice", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
		return res;
	}

	@Override
	public NoticeVO getNotice(int num) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		
		NoticeVO vo = null;
		
		try {
			vo = sqlSession.selectOne("notice.getNotice", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
		return vo;
	}

}
