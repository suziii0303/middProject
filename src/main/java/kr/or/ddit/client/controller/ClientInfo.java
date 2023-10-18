package kr.or.ddit.client.controller;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class ClientList
 */
@WebServlet("/clientInfo.do")
public class ClientInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IClientService service = ClientServiceImpl.getInstance();
		HttpSession session = request.getSession();
		
//		String inputId = request.getParameter("id");
		String inputId = (String)session.getAttribute("id");
		if(inputId != null) {
			ClientVO Clist = service.clientInfo(inputId);
			if(Clist != null) {
				request.setAttribute("Clist", Clist);
			}
		}
		
		request.getRequestDispatcher("/view/login/mypage.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
