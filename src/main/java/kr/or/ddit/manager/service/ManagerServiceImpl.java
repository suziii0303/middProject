package kr.or.ddit.manager.service;

import kr.or.ddit.manager.dao.IManagerDao;
import kr.or.ddit.manager.dao.ManagerDaoImpl;
import kr.or.ddit.manager.vo.ManagerVO;

public class ManagerServiceImpl implements IManagerService {
	
	private IManagerDao dao;
	private static ManagerServiceImpl service;
	
	private ManagerServiceImpl() {
		dao = ManagerDaoImpl.getIntance();
	}
	public static IManagerService getInstance() {
		if(service == null)service = new ManagerServiceImpl();
		return service;
		
	}
	
	
	
	@Override
	public int loginManager(ManagerVO login) {
	
		return dao.loginManager(login);
	}
	
}
