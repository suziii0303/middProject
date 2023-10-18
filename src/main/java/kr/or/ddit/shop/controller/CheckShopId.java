package kr.or.ddit.shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.shop.service.IShopService;
import kr.or.ddit.shop.service.ShopServiceImpl;


@WebServlet("/checkShopId.do")
public class CheckShopId extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public CheckShopId() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청시 전송데이터 받기 - id (ajax에서 가져온다) - html ajax-data로 넘어간다
				String inputId = request.getParameter("id");
				
				// service 객체 얻기
				IShopService service = ShopServiceImpl.getInstance();
				
				// service 메소드 호출하기 - 결과값 받기 - string
				String res = service.checkByShopId(inputId);
				
				// 결과값을 request에 저장 하기
				request.setAttribute("resId", res);
				
				// view페이지로 이동 - json 데이터 생성
				request.getRequestDispatcher("/view/manager/shopIdCheck.jsp").forward(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
