<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	// 서블릿에서 저장한 데이터 꺼내기
	int res = (Integer)request.getAttribute("count");
	
	if (res == 0) {
	    res = 0;
	} else {
	    res = 1;
	}
	
	out.print(res);
	out.flush();
	
%>