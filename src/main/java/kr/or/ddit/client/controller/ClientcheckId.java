package kr.or.ddit.client.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.client.service.ClientServiceImpl;
import kr.or.ddit.client.service.IClientService;

/**
 * Servlet implementation class ClientcheckId
 */
@WebServlet("/clientcheckId.do")
public class ClientcheckId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inId = request.getParameter("id");
		
		IClientService service = ClientServiceImpl.getInstance();
		
		String id = service.checkId(inId);
		
		request.setAttribute("Cid", id);
		
		request.getRequestDispatcher("/view/login/CheckId.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
