<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String res =(String)request.getAttribute("Cid");

if(res == null){
%>

{
"flag": "��밡�� id"
}

<%}else{
%>

{
"flag": "���Ұ��� id"
}

<%
}
%>