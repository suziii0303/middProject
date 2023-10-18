package kr.or.ddit.client.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.mbeans.MBeanUtils;
import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;

import kr.or.ddit.client.service.ClientServiceImpl;
import kr.or.ddit.client.service.IClientService;
import kr.or.ddit.client.vo.ClientVO;

/**
 * Servlet implementation class InsertClient
 */
@WebServlet("/insertClient.do")
public class InsertClient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClientVO vo = new ClientVO();
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		IClientService service = ClientServiceImpl.getInstance();
		
		int cnt = service.insertClient(vo);
		String client = "OK";
		if(cnt==0) client = "Fail";
		
		Gson gson = new Gson();
		String jsonData = gson.toJson(client);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().write(jsonData);
		response.flushBuffer();
		
//		request.setAttribute("client", client);
//		
//		request.getRequestDispatcher("/view/login/join.jsp").forward(request, response);
		
		
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
