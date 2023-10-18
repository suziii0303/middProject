package kr.or.ddit.client.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.client.service.ClientServiceImpl;
import kr.or.ddit.client.service.IClientService;
import kr.or.ddit.client.vo.ClientVO;


@WebServlet("/updateClient.do")
public class UpdateClient extends HttpServlet {
	private static final long serialVersionUID = 1L;     


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원ID에 맞는 회원 정보를 검색해서 회원 정보 수정폼에 보낸다.
		request.setCharacterEncoding("utf-8");
		
		String cId = request.getParameter("c_id");
		
		IClientService service = ClientServiceImpl.getInstance();
		ClientVO clientVo = service.getClientById(cId);
		
		request.setAttribute("clientVo", clientVo);
		request.getRequestDispatcher("/view/manager/clientModify.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");
	
	
	    //  정보를 받는다.
		String cid = request.getParameter("c_id");
		String name = request.getParameter("c_nm");
		String pass = request.getParameter("c_pass");
		String tel = request.getParameter("c_tel");
		String email = request.getParameter("c_email");
		String bir = request.getParameter("c_bir");
		String add = request.getParameter("c_add");
		String gend = request.getParameter("c_gend");
		
		
		// 받아온 정보를 VO에 저장한다.
		ClientVO clientVo = new ClientVO();
		clientVo.setC_id(cid);
		clientVo.setC_nm(name);
		clientVo.setC_pass(pass);
		clientVo.setC_tel(tel);
		clientVo.setC_email(email);
		clientVo.setC_bir(bir);
		clientVo.setC_add(add);
		clientVo.setC_gend(gend);
		
		// 회원 정보를 DB에 insert한다.
		IClientService service = ClientServiceImpl.getInstance();
		service.updateClient(clientVo);
		
		// 작업이 완료되면 List페이지로 이동
		response.sendRedirect(request.getContextPath()+"/clientList.do");
	}

}
