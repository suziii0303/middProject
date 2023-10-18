package kr.or.ddit.client.dao;


import java.util.List;

import kr.or.ddit.client.vo.ClientVO;

public interface IClientDao {
	//수지
	/* 아이디 중복체크를 위한 메소드*/
	public String checkId (String chenkId);
	
	public int loginClient (ClientVO login);
	
	/*회원가입 insert메서드*/
	public int insertClient(ClientVO inClient);
	
	/*회원정보를 출력하는 메소드*/
	public ClientVO clientInfo (String id);
	
	/* 비밀번호 찾기 아이디 이메일 검사 메소드*/
	public int findPass(ClientVO find);
	
	/*임시 비밀번호 발급 메소드*/
	public int updatePw (ClientVO upPass);
	
	/* 아이디찾기 이름 이메일 검사 메소드*/
	public int findId(ClientVO find);
	
	/*아이디를 찾는 메소드*/
	public String getIdBymail(ClientVO find);
	
	/*은비*/
	// 전체 회원 목록 보기
	public List<ClientVO> getAllClient();
	
	// 회원 정보 수정 하기 *공통*
	public int updateClient(ClientVO clientVo);
	
	// 회원 상세 정보 조회  (아이디로)
	public ClientVO getClientById(String cId);
	
	// 회원 정보 삭제 하기 *공통*
	public int deleteClient(String cId);
}
