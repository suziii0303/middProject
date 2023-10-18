package kr.or.ddit.manager.dao;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.manager.vo.ManagerVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

public class ManagerDaoImpl implements IManagerDao{
	private static IManagerDao dao;
	
	private ManagerDaoImpl() {}
	
	public static IManagerDao getIntance() {
		if(dao ==null)dao = new ManagerDaoImpl();
		return dao;
	}
	
	@Override
	public int loginManager(ManagerVO login) {
		int loginVo = 0;	//반환값이 저장될 변수
		
		
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		
		
		
		try {
			loginVo = sqlSession.selectOne("manager.loginManager",login);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
		return loginVo;
	}


}
