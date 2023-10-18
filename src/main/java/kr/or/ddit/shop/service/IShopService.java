package kr.or.ddit.shop.service;

import java.util.List;

import kr.or.ddit.shop.vo.ShCiVO;
import kr.or.ddit.shop.vo.ShopVO;

public interface IShopService {

	// public 리턴결과 메소드이름(파라미터타입 변수명);
	
	// 전체 점주 목록 보기
	public List<ShCiVO> getAllShop();
	
	// 점주아이디 중복검사
	public String checkByShopId (String id);
	
	// 점주정보 추가 하기
	 public int insertShop (ShopVO shopVo);
	
	// 점주 정보 수정 하기
	public int updateShop(ShopVO vo);
	 
	// 점주 정보 삭제 하기
	public int deleteShop(String shId);
	
	// 점주 아이디로 조회 (수정할때)
	public ShopVO getShopById(String shId);
	
	// 점주 로그인 
	public int loginShop(ShopVO login);
		
}
