<%@page import="kr.or.ddit.timetable.vo.TimeTableVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	List<TimeTableVO> list = (List<TimeTableVO>) request.getAttribute("tList");
%>
[
<%
	for(int i=0; i<list.size(); i++){
		TimeTableVO vo = list.get(i);
		if(i>0) out.print(",");
%>
	{
		"id" : "<%=vo.getTh_id() %>",
		"time" : "<%=vo.getT_time() %>"
	}
<%
	}
%>
]

