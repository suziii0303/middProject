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

@WebServlet("/NoticeWrite.do")
@MultipartConfig
public class NoticeWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/board/writenotice.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 업로드 한 파일이 저장될 서버쪽 폴더 경로 설정
		String uploadPath = "d:/d_other/board/uploadFiles";
		
		// 저장될 폴더가 없을 시 새폴더 생성
		File uploadDir = new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		request.setCharacterEncoding("utf-8");
		
		// 요청시 전송데이터 받기
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
		
		// file입력요소의 name값을 이용하여 Part객체 구함
		Part part = request.getPart("poster");
		
		if(part!=null) {
			String fileName = extractFilename(part);
			//System.out.println("filename =" + fileName);
			if(!"".equals(fileName)) {
				try {
					part.write(uploadPath + File.separator + fileName);
					vo.setNo_writer(fileName); // db에 저장할 파일명을 vo객체에 저장
				} catch (Exception e) {
					e.printStackTrace();
					vo.setNo_writer(null); // 사진첨부에 오류가 생긴 경우
				}
			}

		}
		
		// 회원정보를 db에 insert
		INoticeService service = NoticeServiceImpl.getService();
		int res = service.insertNotice(vo);
		
		response.sendRedirect(request.getContextPath() + "/board/notice.jsp");
		
	}
	
	// Part구조 내에서 파일명을 찾는 메소드
	private String extractFilename(Part part) {
		String fileName = "";
		String contentDisposition = part.getHeader("content-disposition");
		//System.out.println("contentDisposition==>" +contentDisposition );
		
		String[] items = contentDisposition.split(";");
		for(String item : items) {
			if(item.trim().startsWith("filename")) {
				fileName = item.substring(item.indexOf("=") + 2, item.length() - 1);
				
			}
		}
		return fileName;
	}
	
}

