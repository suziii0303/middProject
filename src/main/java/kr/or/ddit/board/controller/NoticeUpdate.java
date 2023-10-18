package kr.or.ddit.board.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.board.service.INoticeService;
import kr.or.ddit.board.service.NoticeServiceImpl;
import kr.or.ddit.board.vo.NoticeVO;

@WebServlet("/NoticeUpdate.do")
@MultipartConfig
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 선택한 게시글 번호를 게시글 수정폼으로 전송 
		int num = Integer.parseInt(request.getParameter("num"));
		
		INoticeService service = NoticeServiceImpl.getService();
		NoticeVO vo = service.getNotice(num);
		
		request.setAttribute("getNotice", vo);
		request.getRequestDispatcher("/board/updatenotice.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uploadPath = "d:/d_other/board/uploadFiles";
		
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		request.setCharacterEncoding("utf-8");
		
		NoticeVO vo = new NoticeVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//String oldFile = request.getParameter("oldFile");
		//vo.setNo_writer(oldFile);
		
		System.out.println("vo는 " + vo);
		
		// form입력요소의 name값을 이용해서 Part객체를 구함
		Part part = request.getPart("poster");
		
		if(part!=null) {
			String fileName = extractFilename(part);
			//System.out.println("filename =" + fileName);
			
			if(!"".equals(fileName)) {
				try {
					part.write(uploadPath + File.separator + fileName);
					vo.setNo_writer(fileName);
				} catch (Exception e) {
					//vo.setNo_writer(null); // 사진에 오류가 생긴 경우
				}
			}
		}
		
		// 회원정보를 db에 update
		INoticeService service = NoticeServiceImpl.getService();
		int res = service.updateNotice(vo);
		
		System.out.println("이것은...." + res);
		
		response.sendRedirect(request.getContextPath() + "/board/notice.jsp");
		}
		
		// Part구조 안에서 파일명을 찾는 메서드
		private String extractFilename(Part part) {
			String fileName = "";
			
			String contentDisposition = part.getHeader("content-disposition");
			//System.out.println("contentDisposition==>" +contentDisposition );
			String[] items = contentDisposition.split(";");
			for(String item : items) {
				if(item.trim().startsWith("filename")) {  
					// filename="test1.txt"
					fileName = item.substring(item.indexOf("=")+2, item.length()-1);
				}
			}
			
			return fileName;
		}
		
		

}
