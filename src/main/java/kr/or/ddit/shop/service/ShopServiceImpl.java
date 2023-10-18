package kr.or.ddit.shop.service;

import java.util.List;

import kr.or.ddit.shop.dao.IShopDao;
import kr.or.ddit.shop.dao.ShopDaoImpl;
import kr.or.ddit.shop.vo.ShCiVO;
import kr.or.ddit.shop.vo.ShopVO;

public class ShopServiceImpl implements IShopService {

	
	private IShopDao dao;
	
	private static ShopServiceImpl service;
	
	private ShopServiceImpl() {
		dao = ShopDaoImpl.getDao(); 
	}
	
	public static ShopServiceImpl getInstance() { 
		if(service == null) service = new ShopServiceImpl();
		return service;
	}
	

	@Override
	public int insertShop(ShopVO shopVo) {
		return dao.insertShop(shopVo);
	}

	@Override
	public int updateShop(ShopVO shopVo) {
		return dao.updateShop(shopVo);
	}


	@Override
	public List<ShCiVO> getAllShop() {
		return dao.getAllShop();
	}

	@Override
	public String checkByShopId(String id) {
		return dao.checkByShopId(id);
	}

	@Override
	public ShopVO getShopById(String shId) {
		return dao.getShopById(shId);
	}

	@Override
	public int deleteShop(String shId) {
		return dao.deleteShop(shId);
	}

	@Override
	public int loginShop(ShopVO login) {
		return dao.loginShop(login);
	}

}
