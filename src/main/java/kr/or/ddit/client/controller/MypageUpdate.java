package kr.or.ddit.client.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.client.service.ClientServiceImpl;
import kr.or.ddit.client.service.IClientService;
import kr.or.ddit.client.vo.ClientVO;

/**
 * Servlet implementation class MypageUpdate
 */
@WebServlet("/mypageUpdate.do")
public class MypageUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		
		String id = request.getParameter("id");
		String name = request.getParameter("nm");
		String userPass = request.getParameter("pw");
		String userTel = request.getParameter("tel");
		String userAddr = request.getParameter("add");
		String userBir = request.getParameter("bir");
		String userEmail = request.getParameter("email");
		String userGend = request.getParameter("c_gend");

		ClientVO vo = new ClientVO();
		
		vo.setC_id(id);
		vo.setC_nm(name);
		vo.setC_pass(userPass);
		vo.setC_email(userEmail);
		vo.setC_tel(userTel);
		vo.setC_add(userAddr);
		vo.setC_gend(userGend);
		vo.setC_bir(userBir);
		
		IClientService service = ClientServiceImpl.getInstance();
		
		service.updateClient(vo);
		
		response.sendRedirect(request.getContextPath()+"/clientInfo.do");
		
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
