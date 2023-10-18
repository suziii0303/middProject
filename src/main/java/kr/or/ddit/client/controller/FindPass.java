package kr.or.ddit.client.controller;

import java.io.IOException;
import java.util.Random;

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
 * Servlet implementation class FindPass
 */
@WebServlet("/findPass.do")
public class FindPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		Random rn = new Random();
		char rn1 = (char) ((Math.random() * 26) + 97);  
		int rn2 = rn.nextInt(9)+1;
		int rn3 = rn.nextInt(9)+1;
		char rn4 = (char) ((Math.random() * 26) + 65);
		char rn5 = (char) ((Math.random() * 26) + 97);  
		int rn6 = rn.nextInt(9)+1;
		
		String rnAll = 	""+rn1+rn2+rn3+rn4+rn5+rn6;
		
		String Id = request.getParameter("id");
		String email = request.getParameter("Email");
		 
		
		IClientService service = ClientServiceImpl.getInstance();
		
		ClientVO vo = new ClientVO();
		vo.setC_id(Id);
		vo.setC_email(email);
		
		int cnt = service.findPass(vo);
		System.out.println(cnt);
		if(cnt ==1) {
			ClientVO newVo = new ClientVO();
			newVo.setC_id(Id);
			newVo.setC_pass(rnAll);
			
			cnt = service.updatePw(newVo);// 패스워드 업데이트
			
			// 메일 전송메소드			
			try {
				service.mailToPass(email, rnAll);
			} catch (EmailException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
