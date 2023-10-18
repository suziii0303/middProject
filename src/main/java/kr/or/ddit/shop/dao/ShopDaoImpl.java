package kr.or.ddit.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.shop.vo.ShCiVO;
import kr.or.ddit.shop.vo.ShopVO;
import kr.or.ddit.util.MyBatisSqlSessionFactory;

public class ShopDaoImpl implements IShopDao {

	private static IShopDao dao;

	private ShopDaoImpl() {}
	
	public static IShopDao getDao() {

		if (dao == null)
			dao = new ShopDaoImpl();

		return dao;
	}
	
	
	// 점주 아이디 중복검사
	@Override
	public String checkByShopId(String id) {
		
		SqlSession session = null; // SqlSession객체 변수 선언

		// 리턴 타입 변수 선언
		String res = null;

		// mapper 실행
		try {
			session = MyBatisSqlSessionFactory.getSqlSession(); // 수동으로 commit이 필요하다.

			// sqlSession 으로 mapper 수행
			res = session.selectOne("shop.checkByShopId", id); // (namespase이름.id이름, 파라미터타입 변수명)

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit(); // select는 필요없다. 없어도 됨.
			session.close(); // 반드시
		}

		return res;

	}

	
	// 점주 정보 추가
	@Override
	public int insertShop(ShopVO shopVo) {
		SqlSession session = null; // SqlSession객체 변수 선언

		// 리턴 타입 변수 선언
		int cnt = 0;

		// mapper 실행
		try {

			session = MyBatisSqlSessionFactory.getSqlSession(); // 수동으로 commit이 필요하다.
			// sqlSession 으로 mapper 수행
			cnt = session.insert("shop.insertShop", shopVo); // (namespase이름.id이름, 파라미터타입 변수명)

			if (cnt > 0) {
				session.commit();
			}

		} finally {
			if (session != null)
				session.close();
		}

		return cnt;

	}

	
	// 점주 정보 수정
	@Override
	public int updateShop(ShopVO shopVo) {
		SqlSession session = null; // SqlSession객체 변수 선언

		// 리턴 타입 변수 선언
		int cnt = 0;

		// mapper 실행
		try {

			session = MyBatisSqlSessionFactory.getSqlSession(); // 수동으로 commit이 필요하다.
			// sqlSession 으로 mapper 수행
			cnt = session.update("shop.updateShop", shopVo); // (namespase이름.id이름, 파라미터타입 변수명)

			if (cnt > 0) {
				session.commit();
			}

		} finally {
			if (session != null)
				session.close();
		}

		return cnt;
	}


	
    // 전체 점주 목록 보기
	@Override
	public List<ShCiVO> getAllShop() {
		
		SqlSession session = null; // SqlSession객체 변수 선언
		List<ShCiVO> list = null; // 반환값이 저장될 변수

		// mapper 실행
		try {
			session = MyBatisSqlSessionFactory.getSqlSession(); // 수동으로 commit이 필요하다.

			// sqlSession으로 mapper 실행
			list = session.selectList("shop.getAllShop"); // "namespace.id"

		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}

	@Override
	public ShopVO getShopById(String shId) {
		
		SqlSession session = MyBatisSqlSessionFactory.getSqlSession();  // MyBatis 처리용 객체 생성
		
		ShopVO loginShopVo = null;
		
		try {
			loginShopVo = session.selectOne("shop.getShopById", shId);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		} 
		return loginShopVo;
	
	}

	// 점주 정보 삭제 하기
	@Override
	public int deleteShop(String shId) {
		SqlSession session = null; // SqlSession객체 변수 선언

		// 리턴 타입 변수 선언
		int cnt = 0;

		// mapper 실행
		try {

			session = MyBatisSqlSessionFactory.getSqlSession(); // 수동으로 commit이 필요하다.
			// sqlSession 으로 mapper 수행
			cnt = session.update("shop.deleteShop", shId); // (namespase이름.id이름, 파라미터타입 변수명)

			if (cnt > 0) {
				session.commit();
			}

		} finally {
			if (session != null)
				session.close();
		}

		return cnt;
	}
	
	//점주 로그인
	@Override
	   public int loginShop(ShopVO login) {
	      int loginCnt = 0;
	      
	      SqlSession sqlSession = MyBatisSqlSessionFactory.getSqlSession();
	      
	      try {
	         loginCnt = sqlSession.selectOne("shop.loginShop",login);
	      } finally {
	         // : handle finally clause
	      }
	      return loginCnt;
	   }

}
