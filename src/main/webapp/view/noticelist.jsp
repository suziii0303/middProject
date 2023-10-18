<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.or.ddit.board.vo.NoticePageVO"%>
<%@page import="kr.or.ddit.board.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%

	List<NoticeVO> list = (List<NoticeVO>)request.getAttribute("pageList");
	NoticePageVO pvo = (NoticePageVO)request.getAttribute("pageVo");
	
	JsonObject obj = new JsonObject();
	
	obj.addProperty("sp", pvo.getnStartPage());
	obj.addProperty("ep", pvo.getnEndPage());
	obj.addProperty("tp", pvo.getnTotalPage());
	obj.addProperty("count", pvo.getnCount());
	
	Gson gson = new Gson();
	
	JsonElement ele = gson.toJsonTree(list);
	
	obj.add("datas", ele);
	
	out.print(obj);
	out.flush();

%>