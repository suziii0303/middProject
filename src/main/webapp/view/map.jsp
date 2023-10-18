<%@page import="kr.or.ddit.cinema.vo.CinemaVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<% CinemaVO vo = (CinemaVO)request.getAttribute("Cmapvo");%>
{
	"name" : "<%= vo.getCn_nm() %>",
 	"map" : "<%=vo.getCn_map() %>"
}


