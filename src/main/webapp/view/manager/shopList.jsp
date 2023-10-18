<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.List"%>
<%@page import="kr.or.ddit.shop.vo.ShopVO"%>
<%@page import="kr.or.ddit.shop.vo.ShCiVO"%>
<%@page import="kr.or.ddit.cinema.vo.CinemaVO"%>


<%
String vid = (String) session.getAttribute("id");
String result ="";
if(vid != null){
   result = vid+"님";
}else{
   result = "로그인";
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/swiper.css">

<!-- 파비콘 -->
<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/megafox_favicon.ico">

<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../js/jquery.serializejson.min.js"></script>

<title>MEGAFOX</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js">
</script>

<script type="text/javascript">
$(function(){
	$(".addshopbtn").on("click",function(){
		
		location.href = "<%=request.getContextPath()%>/view/manager/shopAdd.jsp"

	});
	
	$(".modifybutton").on("click",function(){
				
		var form = this.form;
		form.method = "GET";
		form.action = "<%=request.getContextPath()%>/updateShop.do";
		form.submit();
	});
	
	$(".deletebutton").on("click", function(){
		var form = this.form;
		form.action = "<%=request.getContextPath()%>/deleteShop.do";
		form.submit();
		
		alert("점주 정보가 삭제됩니다.");
	});
});
</script>

<style type="text/css">


.addshopbtn {
  background-color:  #d51619;
  border-radius: 15px;
  border: 0;
  box-sizing: border-box;
  color: #eee;
  cursor: pointer;
  height: 35px;
  margin-top: 5px;
  outline: 0;
  text-align: center;
  width: 20%;
  float: right;
   font-size: 20px;
   margin-right: -10px;
}

.addshopbtn:active {
  background-color: #06b;
}


.modifybutton,.deletebutton{
  background-color:  #d51619;
  border-radius: 15px;
  border: 0;
  box-sizing: border-box;
  color: #eee;
  cursor: pointer;
  height: 30px;
  margin-top: 20px;
  outline: 0;
  text-align: center;
  width: 50px;
   float: right;
   display: block;
  margin: 0 auto;
}

td{
width : auto;
height : auto;
}

.rwd-table {
    margin: auto;
    border-collapse: collapse;
    font-size :18px;
    height : auto;
    color: #333;
    border-radius: .4em;
    overflow: hidden;
    width: 55%;
}


.rwd-table tr:first-child {
    background: #1C1C1C;
    color: #fff;
}

.rwd-table tr {
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    background-color: white;
}

/*.rwd-table tr:nth-child(odd):not(:first-child) {*/
/*    background-color: #ebf3f9;*/
/*}*/

.rwd-table th {
    display: none;
}

.rwd-table td {
    display: block;
      text-align: center;
  vertical-align: middle;
}

.rwd-table td:first-child {
    margin-top: .5em;
}

.rwd-table td:last-child {
    margin-bottom: .5em;
}

.rwd-table td:before {
    /*content: attr(data-th) ": ";*/
    font-weight: bold;
    width: 120px;
    display: inline-block;
    color: #000;
}

.rwd-table th,
.rwd-table td {
    text-align: left;
        padding: .5em 1em;
        width: auto;
        height : auto;
}



.rwd-table tr {
    border-color: #303245;
}


@media screen and (max-width: 601px) {
    .rwd-table tr:nth-child(2) {
        border-top: none;
    }
    .rwd-table th:first-child,
    .rwd-table td:first-child {
        font-weight : bold;
        color: black;
    }
    .rwd-table td a {
        text-decoration: none;
        color: black;
    }
}

@media screen and (min-width: 600px) {
/*
    .rwd-table tr:hover:not(:first-child) {
        background-color: rgba(131, 244, 180, 0.3);
        /*background-color: #83F4B4;과 동일 opacity*/
    }*/

    .rwd-table td:before {
        display: none;
    }
    .rwd-table td a {
        text-decoration: none;
        color: black;
    }
    .rwd-table th,
    .rwd-table td {
        display: table-cell;
        padding: .25em .5em;
    }
    .rwd-table th:first-child,
    .rwd-table td:first-child {
        font-weight : bold;
        padding-left: 0;
    }
    .rwd-table th:last-child,
    .rwd-table td:last-child {
        padding-right: 0;
    }
    .rwd-table th,
    .rwd-table td {
        padding: 1em !important;
    }
}


td #title {
  color: #eee;
  font-family: sans-serif;
  font-size: 24px;
  font-weight: 600;
  margin-top: 24px;
  text-align:center;
  margin-bottom: 24px;
  margin : 0 auto;
}

#div1{
height : 80px;
}

#tr1{
background-color : lightgray;
font-size: 18px;
  text-align:center;
font-weight: 600;
}

#p{
    width: 550px;
    margin-left: 371px;
    font-size : 30px; 
}

/*은비 - 푸터 하단고정*/
footer {background:black;
  position: absolute;
  left: 0;
  bottom: 0;
  width: 100%;
}
</style>
</head>


<%
// 서블릿이 보낸 데이터 받기
List<ShCiVO> shopList = (List<ShCiVO>)request.getAttribute("shopList");
%>

<header id="header">
		<div class="container">
			<div class="row">
				<div class="header clearfix">
					<h1>
							<a href="<%=request.getContextPath() %>/clientList.do"> 
						<em>
						<img src="<%=request.getContextPath() %>/images/megafox로고.png" alt="MEGAFOX">
						</em> 
						</a>
					</h1>
					
					<nav class="nav">
					<div id="div1">
						</div>
						<ul class="clearfix1">
						     <li><a href="<%=request.getContextPath() %>/clientList.do">고객관리</a></li>
							<li><a href="<%=request.getContextPath() %>/shopperList.do">점주관리</a></li>
							<li><a href="<%=request.getContextPath() %>/mngMovieList.do">영화관리</a></li>
							<li><a href="<%=request.getContextPath() %>/board/notice.jsp">게시판관리</a></li>
						</ul>
						<div id="div2">
						</div>
						<ul class="clearfix2">
							<li class="log"><a href="<%=request.getContextPath() %>/view/login/Login.jsp"><%=result %></a></li>
							<li class="log"><a href="<%=request.getContextPath()%>/logOut.do">로그아웃</a></li>
						</ul>
					</nav>
					
				</div>
			</div>
		</div>
	</header>	


<body>

<div id="div1"></div>
<section id="movie">
<div style="overflow: auto; height: 550px;">
<table class="rwd-table">
<tbody>
<tr>
 <td colspan="7"><div id="title"><p id="p">👩🏻‍💼점주 목록 조회👩🏻‍💼<input type="button" class="addshopbtn" value="점주추가"></div> </td>
</tr>

<tr id="tr1">
	<td>ID</td>
	<td>비밀번호</td>
	<td>대표자명</td>
	<td>사업자번호</td>
	<td>전화번호</td>
	<td>영화관명</td>
	<td>점주관리</td>
</tr>
<%
if(shopList==null || shopList.size()==0){
%>

<%
} else{
	for(ShCiVO vo : shopList){

%>
	<tr class="KOTRA-fontsize-80">
		<td><%= vo.getSh_id()%></td>
		<td><%= vo.getSh_pw()%></td>
		<td><%= vo.getSh_nm()%></td>
		<td><%= vo.getSh_bnum()%></td>
		<td><%=vo.getSh_tel() %></td>
		<td><%=vo.getCn_nm() %></td>
		<td>
		<form name="shopForm" id="shopForm" >
		<input type="button" id="modify" class="modifybutton" value="수정">			
		<input type="button" id="delete" class="deletebutton" value="삭제">
		<input type="hidden" id="sh_id" name="sh_id" value="<%= vo.getSh_id()%>">	
		</form>
		</td>
	</tr>
<%
	}

}
%>	

 </tbody>
</table>
</div>
</section>

<footer id="footer">
		<div id="footer_infor">
			<div class="container">
				<div class="row">
					<div class="footer_infor">
						<h2>
							<img src="<%=request.getContextPath() %>/images/megafox로고.png" alt="megafox">
						</h2>
						<ul>
							<li><a href="#">회사소개</a></li>
							<li><a href="#">채용정보</a></li>
							<li><a href="#">제휴/광고/부대사업 문의</a></li>
							<li><a href="#">이용약관</a></li>
							<li><a href="#">개인정보처리방침</a></li>
							<li><a href="#">고객센터</a></li>
							<li><a href="#">윤리경영</a></li>
						</ul>
						<address>
							<p>
								대전 중구 계룡로 846 메가폭스<br>
								<span class="bar2">대표자명 윤강혁</span> 개인정보보호 책임자 경영지원실 실장 이철희<br>
								<span class="bar2">사업자등록번호 211-86-59478</span> 통신판매업신고번호 제 833호
							</p>
							<p>Copyright 2023 by Megafox Inc. All right reserved</p>
						</address>
					</div>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>