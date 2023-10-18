package kr.or.ddit.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.shop.service.IShopService;
import kr.or.ddit.shop.service.ShopServiceImpl;
import kr.or.ddit.shop.vo.ShCiVO;


@WebServlet("/shopperList.do")
public class ShopperList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");
	      response.setCharacterEncoding("utf-8");

			
		IShopService Service = ShopServiceImpl.getInstance();

		// 전체 점주 목록을 가져옴
	    List<ShCiVO> shopList = Service.getAllShop();
		
		// 가져온 파일 목록 데이터를 view페이지로 보낸다.
		request.setAttribute("shopList", shopList); //("임의데이터명", 저장할-)
		 
		request.getRequestDispatcher("/view/manager/shopList.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
 