package kr.or.ddit.client.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.client.vo.ClientVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

public class ClientDaoImpl implements IClientDao{
	
	private static IClientDao dao;
	
	private ClientDaoImpl() {}
	
	public static IClientDao getInstance() {
		if(dao==null)dao = new ClientDaoImpl();
		return dao;
	}
	
	// 수지
	@Override
	public String checkId(String checkId) {
		
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		String checkIkd = null;
		
		try {
			checkIkd = sqlSession.selectOne("client.checkId", checkId);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return checkIkd;
	}

	@Override
	public int loginClient(ClientVO login) {
		int loginVo = 0;	//반환값이 저장될 변수
		
		
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		
		
		
		try {
			loginVo = sqlSession.selectOne("client.loginClient",login);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
		return loginVo;
	}

	@Override
	public int insertClient(ClientVO inClient) {
		int invo = 0;	//반환값이 저장될 변수
		
		
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		
		
		
		try {
			invo = sqlSession.insert("client.insertClient",inClient);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
		return invo;
	}

	@Override
	public ClientVO clientInfo(String id) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		ClientVO cVo = null;
		
		try {
			cVo = sqlSession.selectOne("client.clientInfo",id);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return cVo;
	}
	@Override
	public int findPass(ClientVO find) {
		int findIdEmail = 0;	//반환값이 저장될 변수
		
		
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		
		
		
		try {
			findIdEmail = sqlSession.selectOne("client.findPass",find);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
		return findIdEmail;
	}

	@Override
	public int updatePw(ClientVO upPass) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		int update = 0;
		try {
			update = sqlSession.update("client.updatePw",upPass);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return update;
	}

	@Override
	public int findId(ClientVO find) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		int cnt = 0;
		try {
			cnt = sqlSession.selectOne("client.findId",find);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return cnt;
	}

	@Override
	public String getIdBymail(ClientVO find) {
		SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
		String userId = null;
		try {
			userId = sqlSession.selectOne("client.getIdBymail",find);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return userId;
	}
	
	/*은비*/	
	// 회원 목록 조회
	@Override
	public List<ClientVO> getAllClient() {
		
		SqlSession session = null; // SqlSession객체 변수 선언
		List<ClientVO> list = null; // 반환값이 저장될 변수

		// mapper 실행
		try {
			session = MyBatisSqlSessionFactory.getSqlSession(); // 수동으로 commit이 필요하다.

			// sqlSession으로 mapper 실행
			list = session.selectList("client.getAllClient"); // "namespace.id"

		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}

	
	// 회원 정보 수정 // 공통사용
	@Override
	public int updateClient(ClientVO clientVo) {
		SqlSession session = null; // SqlSession객체 변수 선언

		// 리턴 타입 변수 선언
		int cnt = 0;

		// mapper 실행
		try {

			session = MyBatisSqlSessionFactory.getSqlSession(); // 수동으로 commit이 필요하다.
			// sqlSession 으로 mapper 수행
			cnt = session.update("client.updateClient", clientVo); // (namespase이름.id이름, 파라미터타입 변수명)

			if (cnt > 0) {
				session.commit();
			}

		} finally {
			if (session != null)
				session.close();
		}

		return cnt;
	}

	// 회원 상세 정보 조회 (아이디로)
	@Override
	public ClientVO getClientById(String cId) {
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();  // MyBatis 처리용 객체 생성
		
		ClientVO loginClientVo = null;
		
		try {
			loginClientVo = session.selectOne("client.getClientById", cId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		} 
		return loginClientVo;
	}
	
	
	// 회원 정보 삭제하기 // 공통 사용
	@Override
	public int deleteClient(String cId) {
		SqlSession session = null; // SqlSession객체 변수 선언

		// 리턴 타입 변수 선언
		int cnt = 0;

		// mapper 실행
		try {

			session = MyBatisSqlSessionFactory.getSqlSession(); // 수동으로 commit이 필요하다.
			// sqlSession 으로 mapper 수행
			cnt = session.update("client.deleteClient", cId); // (namespase이름.id이름, 파라미터타입 변수명)

			if (cnt > 0) {
				session.commit();
			}

		} finally {
			if (session != null)
				session.close();
		}

		return cnt;
	}
	
	
	
}
