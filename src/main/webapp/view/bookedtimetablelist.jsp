<%@page import="kr.or.ddit.timetable.vo.TimeTableVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
List<TimeTableVO> list = (List<TimeTableVO>) request.getAttribute("tList");
if(list !=null && list.size()!=0){
%>
[
 <%
	 for(int i=0; i<list.size(); i++){
		TimeTableVO vo = list.get(i);
		if(i>0) out.print(",");
 %>
 {
 	"date" : "<%=vo.getT_date() %>",
	"flag" : "1"
 }
 <%
 } 
 %>
]
<% 
} else {
%>
[
	{
		"date" : "상영 일정이 없습니다.",
		"flag" : "0"
	}
]
<%
}
%>



