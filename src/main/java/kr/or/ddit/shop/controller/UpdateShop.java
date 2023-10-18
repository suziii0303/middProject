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



@WebServlet("/updateShop.do")
public class UpdateShop extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 점주ID에 맞는 점주 정보를 검색해서 점주 정보 수정폼에 보낸다.
		  request.setCharacterEncoding("utf-8");
	      response.setCharacterEncoding("utf-8");

		
		String shId = request.getParameter("sh_id");
		
		IShopService service = ShopServiceImpl.getInstance();
		ShopVO shopVo = service.getShopById(shId);
		
		request.setAttribute("shopVo", shopVo);
		request.getRequestDispatcher("/view/manager/shopModify.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
	    //  정보를 받는다.
		String shopid = request.getParameter("sh_id");
		String pass = request.getParameter("sh_pw");
		String name = request.getParameter("sh_nm");
		String bnum = request.getParameter("sh_bnum");
		String tel = request.getParameter("sh_tel");
		
		
		// 받아온 정보를 VO에 저장한다.
		ShopVO shopVo = new ShopVO();
		shopVo.setSh_id(shopid);
		shopVo.setSh_pw(pass);
		shopVo.setSh_nm(name);
		shopVo.setSh_bnum(bnum);
		shopVo.setSh_tel(tel);
		
		// 회원 정보를 DB에 insert한다.
		IShopService service = ShopServiceImpl.getInstance();
		service.updateShop(shopVo);
		
		// 작업이 완료되면 List페이지로 이동
		response.sendRedirect(request.getContextPath()+"/shopperList.do");
		
	}

}
