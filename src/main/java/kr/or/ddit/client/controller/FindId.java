package kr.or.ddit.client.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.EmailException;

import com.google.gson.Gson;

import kr.or.ddit.client.service.ClientServiceImpl;
import kr.or.ddit.client.service.IClientService;
import kr.or.ddit.client.vo.ClientVO;

/**
 * Servlet implementation class FindId
 */
@WebServlet("/findId.do")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String email = request.getParameter("Email");
		
		IClientService service = ClientServiceImpl.getInstance();
		
		ClientVO vo  =new ClientVO();
		vo.setC_nm(name);
		vo.setC_email(email);
		
		int cnt = service.findId(vo);
		 
		if(cnt == 1) {
			String userId = service.getIdBymail(vo);
			
		try {
			service.mailToId(email, userId, name);
		} catch (EmailException e) {
			// TODO: handle exception
		}
		Gson gson = new Gson();
		String jsonData = gson.toJson(cnt);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().write(jsonData);
		response.flushBuffer();
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
