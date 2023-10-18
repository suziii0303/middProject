package kr.or.ddit.client.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.client.service.ClientServiceImpl;
import kr.or.ddit.client.service.IClientService;
import kr.or.ddit.client.vo.ClientVO;



@WebServlet("/clientList.do")
public class ClientList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IClientService Service = ClientServiceImpl.getInstance();

		// 전체 파일 목록을 가져와 List에 저장한다.
		// 전체 영화관 목록을 가져옴
	    List<ClientVO> clientList = Service.getAllClient();
		
		// 가져온 파일 목록 데이터를 view페이지로 보낸다.
		request.setAttribute("clientList", clientList); //("임의데이터명", 저장할-)
		 
		request.getRequestDispatcher("/view/manager/clientList.jsp").forward(request, response);
	}

}
