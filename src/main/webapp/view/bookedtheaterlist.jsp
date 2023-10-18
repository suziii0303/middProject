<%@page import="kr.or.ddit.theater.vo.TheaterVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	List<TheaterVO> list = (List<TheaterVO>) request.getAttribute("tList");
%>
[
<%
	for(int i=0; i<list.size(); i++){
		TheaterVO vo = list.get(i);
		if(i>0) out.print(",");
%>
	{
		"id" : "<%=vo.getTh_id() %>",
		"name" : "<%=vo.getTh_nm() %>"
	}

<%
	}

%>

]