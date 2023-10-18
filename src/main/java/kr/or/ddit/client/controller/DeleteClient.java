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


@WebServlet("/deleteClient.do")
public class DeleteClient extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String cid = request.getParameter("c_id");
		
		ClientVO clientVo = new ClientVO();
		clientVo.setC_id(cid);
		
		// 정보를 DB에 insert한다.
		IClientService service = ClientServiceImpl.getInstance();
		service.deleteClient(cid);
		
		// 작업이 완료되면 List페이지로 이동
		response.sendRedirect(request.getContextPath()+"/clientList.do");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
