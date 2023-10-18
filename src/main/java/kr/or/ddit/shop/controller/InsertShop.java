package kr.or.ddit.shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.shop.service.IShopService;
import kr.or.ddit.shop.service.ShopServiceImpl;
import kr.or.ddit.shop.vo.ShopVO;


@WebServlet("/insertShop.do")
public class InsertShop extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		  response.setCharacterEncoding("utf-8");

		
		// userid, pass 정보 받아오기 (jsp의 name값)
		String shopid = request.getParameter("sh_id");
		String pass = request.getParameter("sh_pw");
		String name = request.getParameter("sh_nm");
		String bnum = request.getParameter("sh_bnum");
		String tel = request.getParameter("sh_tel");

		ShopVO shopVo = new ShopVO();
		shopVo.setSh_id(shopid);
		shopVo.setSh_pw(pass);
		shopVo.setSh_nm(name);
		shopVo.setSh_bnum(bnum);
		shopVo.setSh_tel(tel);

		// service 객체 얻기
		IShopService service = ShopServiceImpl.getInstance();
		
		// service 메소드 호출하기 - 결과값 받기
		int res = service.insertShop(shopVo);
		
		// 결과값을 request에 저장 하기
		request.setAttribute("resShop", res);
		
		// view페이지로 이동 - json 데이터 생성
		request.getRequestDispatcher("/shopperList.do").forward(request,response);	
		
		
		}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
