<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.or.ddit.board.vo.QnaPageVO"%>
<%@page import="kr.or.ddit.board.vo.QnAVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	List<QnAVO> list = (List<QnAVO>)request.getAttribute("pageList");
	QnaPageVO qvo = (QnaPageVO)request.getAttribute("pageVo");
	
	JsonObject obj = new JsonObject();
	
	obj.addProperty("sp", qvo.getqStartPage());
	obj.addProperty("ep", qvo.getqEndPage());
	obj.addProperty("tp", qvo.getqTotalPage());
	obj.addProperty("count", qvo.getqCount());
	
	Gson gson = new Gson();
	
	JsonElement ele = gson.toJsonTree(list);
	
	obj.add("datas", ele);
	
	out.print(obj);
	out.flush();

%>