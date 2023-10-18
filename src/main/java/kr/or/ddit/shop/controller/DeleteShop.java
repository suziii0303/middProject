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


@WebServlet("/deleteShop.do")
public class DeleteShop extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		   response.setCharacterEncoding("utf-8");

		
		String shId = request.getParameter("sh_id");
		
		ShopVO shopVo = new ShopVO();
		shopVo.setSh_id(shId);
		
		// 정보를 DB에 insert한다.
		IShopService service = ShopServiceImpl.getInstance();
		service.deleteShop(shId);
		
		// 작업이 완료되면 List페이지로 이동
		response.sendRedirect(request.getContextPath()+"/shopperList.do");
			
	}

}
