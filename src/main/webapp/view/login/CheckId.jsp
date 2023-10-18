<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String res =(String)request.getAttribute("Cid");

if(res == null){
%>

{
"flag": "사용가능 id"
}

<%}else{
%>

{
"flag": "사용불가능 id"
}

<%
}
%>