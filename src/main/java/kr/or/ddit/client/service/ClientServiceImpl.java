package kr.or.ddit.client.service;

import java.util.List;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import kr.or.ddit.client.dao.ClientDaoImpl;
import kr.or.ddit.client.dao.IClientDao;
import kr.or.ddit.client.vo.ClientVO;

public class ClientServiceImpl implements IClientService {

	private IClientDao dao;
	private static ClientServiceImpl service;

	
	private ClientServiceImpl() {
		dao = ClientDaoImpl.getInstance();
	}

	public static IClientService getInstance() {
		if (service == null)
			service = new ClientServiceImpl();
		return service;
	}

	// 수지
	@Override
	public String checkId(String chenkId) {

		return dao.checkId(chenkId);
	}

	@Override
	public int loginClient(ClientVO login) {

		return dao.loginClient(login);
	}

	@Override
	public int insertClient(ClientVO inClient) {

		return dao.insertClient(inClient);
	}

	@Override
	public ClientVO clientInfo(String id) {

		return dao.clientInfo(id);
	}
	
	@Override
	public int findPass(ClientVO find) {
		// TODO Auto-generated method stub
		return dao.findPass(find);
	}
	@Override
	public int updatePw(ClientVO upPass) {
		return dao.updatePw(upPass);
		
	}
	@Override
	public void mailToPass(String mail, String temPass)throws EmailException {
		String senderId = "hyokee5115@naver.com";
		String senderPw = "ddit402!";
		String receiverId = mail;
		// Ex1> SimpleEmail

		SimpleEmail email = new SimpleEmail();
		email.setHostName("smtp.naver.com"); // ex) nate.com 일 경우!! ->> mail.nate.com
		email.setSmtpPort(587); // TLS를 사용하는 경우 587 포트를 사용합니다.
		email.setStartTLSEnabled(true); // STARTTLS 사용을 지정합니다.
		
		email.setAuthenticator(new DefaultAuthenticator(senderId, senderPw)); // 사용자 인증 정보를 설정합니다.
		email.setFrom(senderId,"MEGAFOX");
		email.addTo(receiverId, "Receiver"); // ex) onamt@nate.com// 보내는 사람
		email.setSubject("[MEGAFOX]임시 비밀번호 입니다."); // 제목
		email.setMsg("임시 비밀번호 : " + temPass+ "\n 로그인후 마이페이지에서 변경해주세요!"); // 내용
		email.send();
	
		
	}
	@Override
	public int findId(ClientVO find) {
		
		return dao.findId(find);
	}
	@Override 
	public void mailToId(String mail, String userId, String name)throws EmailException {
		String senderId = "hyokee5115@naver.com";
		String senderPw = "ddit402!";
		String receiverId = mail;
		// Ex1> SimpleEmail

		SimpleEmail email = new SimpleEmail();
		email.setHostName("smtp.naver.com"); // ex) nate.com 일 경우!! ->> mail.nate.com
		email.setSmtpPort(587); // TLS를 사용하는 경우 587 포트를 사용합니다.
		email.setStartTLSEnabled(true); // STARTTLS 사용을 지정합니다.
		
		email.setAuthenticator(new DefaultAuthenticator(senderId, senderPw)); // 사용자 인증 정보를 설정합니다.
		email.setFrom(senderId,"MEGAFOX");
		email.addTo(receiverId, "Receiver"); // ex) onamt@nate.com// 보내는 사람
		email.setSubject("[MEGAFOX]"+ name+"님의 아이디 입니다"); // 제목
		email.setMsg("ID  : "+userId +"입니다\n감사합니다."); // 내용
		
		email.send();
	}
	@Override
	public String getIdBymail(ClientVO find) {
		
		return dao.getIdBymail(find);
	}
	
	/*은비*/
	
	// 회원 목록 조회
	@Override
	public List<ClientVO> getAllClient() {
		return dao.getAllClient();
	}

	// 회원 정보 수정 공통
	@Override
	public int updateClient(ClientVO clientVo) {
		return dao.updateClient(clientVo);
	}

	// 회원 상세 정보 조회 (아이디로)
	@Override
	public ClientVO getClientById(String cId) {
		return dao.getClientById(cId);
	}

	// 회원 정보 삭제 공통
	@Override
	public int deleteClient(String cId) {
		return dao.deleteClient(cId);
	}
}
