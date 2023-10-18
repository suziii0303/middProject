<%@page import="kr.or.ddit.cinema.vo.CinemaVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<CinemaVO> list = (List<CinemaVO>) request.getAttribute("cinemas");
%>

[

<%
for(int i=0; i<list.size(); i++){
	CinemaVO vo = list.get(i);
	if(i>0) out.print(",");
%>

{
	"id" : "<%=vo.getCn_id() %>",
	"loc" : "<%=vo.getCn_loc() %>",
	"name" : "<%=vo.getCn_nm() %>"
}

<%
}
%>
]
