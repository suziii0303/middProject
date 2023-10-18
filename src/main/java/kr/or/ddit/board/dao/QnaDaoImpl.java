package kr.or.ddit.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.vo.QnAVO;
import kr.or.ddit.board.vo.ReplyVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

public class QnaDaoImpl implements IQnaDao {

	// 싱글톤
	private static IQnaDao dao;
	public static IQnaDao getDao() {
		if(dao == null) dao = new QnaDaoImpl();
		return dao;
	}
	
	@Override
	public List<QnAVO> qnaPerPage(Map<String, Object> map) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		List<QnAVO> list = null;
		
		try {
			list = sqlSession.selectList("qna.qnaPerPage", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
		return list;
	}

	@Override
	public int totalQna(Map<String, Object> map) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		
		try {
			res = sqlSession.selectOne("qna.totalQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;
	}
	
	@Override
	public QnAVO getQna(int num) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		QnAVO vo = null;
		
		try {
			vo = sqlSession.selectOne("qna.getQna", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return vo;
	}

	@Override
	public int insertQna(QnAVO vo) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		
		try {
			res = sqlSession.insert("qna.insertQna", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;
	}

	@Override
	public int updateQna(QnAVO vo) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		
		try {
			res = sqlSession.update("qna.updateQna", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;
	}

	@Override
	public int deleteQna(int num) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		
		try {
			res = sqlSession.delete("qna.deleteQna", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;
	}

	@Override
	public int insertReply(ReplyVO rvo) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		
		try {
			res = sqlSession.insert("reply.insertReply", rvo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;
	}

	@Override
	public int updateReply(ReplyVO rvo) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		
		try {
			res = sqlSession.update("reply.updateReply", rvo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;
	}

	@Override
	public int deleteReply(int r_num) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		
		try {
			res = sqlSession.delete("reply.deleteReply", r_num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;
	}

	@Override
	public int totalReply(int q_num) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		
		try {
			res = sqlSession.selectOne("reply.totalReply", q_num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
		return res;
	}

	@Override
	public List<ReplyVO> getAllReply(int q_num) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		List<ReplyVO> list = null;
		
		try {
			list = sqlSession.selectList("reply.getAllReply", q_num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
		return list;
	}

	@Override
	public int deleteReplyByQnum(int q_num) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		int res = 0;
		
		try {
			res = sqlSession.delete("reply.deleteReplyByQnum", q_num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;
	}

}
