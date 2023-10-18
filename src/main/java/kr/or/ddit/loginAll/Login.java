package kr.or.ddit.loginAll;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.client.service.ClientServiceImpl;
import kr.or.ddit.client.service.IClientService;
import kr.or.ddit.client.vo.ClientVO;
import kr.or.ddit.manager.service.IManagerService;
import kr.or.ddit.manager.service.ManagerServiceImpl;
import kr.or.ddit.manager.vo.ManagerVO;
import kr.or.ddit.shop.service.IShopService;
import kr.or.ddit.shop.service.ShopServiceImpl;
import kr.or.ddit.shop.vo.ShopVO;

/**
 * Servlet implementation class LoginClient
 */
@WebServlet("/loginAll.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
//		String MgId = request.getParameter("id");
//		String mgPw = request.getParameter("pw");
		
		String inputId = request.getParameter("id");
		String inputPw=request.getParameter("pass");
		int auNum = Integer.parseInt(request.getParameter("auth")); // auNUM 권한번호 세션에 담아서 넘기기
		
		String cookieId = request.getParameter("savaId");
		
		Cookie cookie = new Cookie("cookieId",inputId);
		cookie.setMaxAge(7*24*60*60);
//		if(cookieId!= null) {
//			response.addCookie(cookie);
//		}else {
//			cookie.setMaxAge(0);
//			response.addCookie(cookie);
//		}
		
		int check = 0;
		
		ManagerVO voM = new ManagerVO();
		ClientVO voC = new ClientVO();
		ShopVO voS = new ShopVO();
		// 점주 만들기 
		
		// aunum 1,2,3 마다 저장
		switch (auNum) {
		case 1:
			voM.setMg_id(inputId);
			voM.setMg_pw(inputPw);
			IManagerService serviceM = ManagerServiceImpl.getInstance();
			check = serviceM.loginManager(voM);
			if (check != 0 && cookieId!=null) {
			    session.setAttribute("id", inputId);
			    session.setAttribute("auNum", String.valueOf(auNum));
			    System.out.println(session.getAttribute("id"));
				request.setAttribute("check", check+"");
				
				response.addCookie(cookie);
				/*은비 관리자 첫화면 수정*/
				request.getRequestDispatcher("/clientList.do").forward(request, response);
			}else{
				request.setAttribute("check", check+"");
				request.getRequestDispatcher("/view/login/Login.jsp").forward(request, response);
			}
			break;
			
		case 2:
			voS.setSh_id(inputId);
			voS.setSh_pw(inputPw);
			IShopService serviceS = ShopServiceImpl.getInstance();
			check = serviceS.loginShop(voS);
			if (check != 0) {
			    session.setAttribute("id", inputId);
			    session.setAttribute("auNum", String.valueOf(auNum));
			    System.out.println(session.getAttribute("id"));
				request.setAttribute("check", check+"");
				response.addCookie(cookie);
				request.getRequestDispatcher("/cinemaView.do").forward(request, response);
			}else {
				request.setAttribute("check", check+"");
				request.getRequestDispatcher("/view/login/Login.jsp").forward(request, response);
			}
			break;

		case 3:
			voC.setC_id(inputId);
			voC.setC_pass(inputPw);
			IClientService service = ClientServiceImpl.getInstance();
			 check = service.loginClient(voC);//고객
			 if (check != 0) {
				    session.setAttribute("id", inputId);
				    session.setAttribute("auNum", String.valueOf(auNum));
				    System.out.println(session.getAttribute("id"));
					request.setAttribute("check", check+"");
					response.addCookie(cookie);
			 request.getRequestDispatcher("/index.jsp").forward(request, response);
			 }else {
				 request.setAttribute("check", check+"");
				 request.getRequestDispatcher("/view/login/Login.jsp").forward(request, response);
			 }
			break;

		default:
			request.getRequestDispatcher("/view/login/Login.jsp").forward(request, response);
			break;
		}
		
		
		
	}
			


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
