<%@page import="kr.or.ddit.cinema.vo.CinemaVO"%>
<%@page import="kr.or.ddit.timetable.vo.TimeTableVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<meta charset="UTF-8"/>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

<title>MEGAFOX</title>

<!-- css -->
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/swiper.css">

<!-- 파비콘 -->
<link rel="shortcut icon" href="./images/megafox_favicon.ico">

<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">



<style type="text/css">

.header .nav .clearfix1{width: 1000px;}
.header .nav .clearfix1 li {float: left; width: 110px;}
.header .nav .clearfix2{width: 300px;}
.clearfix1 li:last-child { margin-left: 0px; !important} 


table {
	position: relative; 
	top : 50px;
    width: 700px;
    text-align: center;
    border-spacing: 1px;
    font-family: 'Cairo', sans-serif;
  	margin: 100px auto;
  	font-size: 15px;
  	color: white;
}

h2 {
    font-weight: bold;
    font-size: 22px;
}

table td {
    padding: 10px;
}

table th {
    background-color: #1C1C1C;
    color: #fff;
    padding: 10px;
}


.btn {
    border: none;
    padding: 5px 10px;
    color: #fff;
    font-weight: bold;
    background-color: #d51619;
}

#footer {
        position: fixed;
        left: 0;
        bottom: 0;
        width: 100%;
    }
    
    
    
input[type="button"]:hover {
  box-shadow: 1px 1px 2px white; 
}       
</style>

</head>

<body>
<%
	CinemaVO cVo = (CinemaVO)request.getAttribute("cVo");
%>
	<header id="header">
		<div class="container">
			<div class="row">
				<div class="header clearfix">
					<h1>
						<a href="<%=request.getContextPath() %>/cinemaView.do"> 
						<em>
						<img src="./images/megafox로고.png" alt="MEGAFOX">
						</em> 
						</a>
					</h1>
					
					<nav class="nav">
						<div id="div1">
						</div>
						<ul class="clearfix1">
				      		<%
								if(cVo!=null){
							%> 
					      	<li style="margin-right: 24px;"><a href="<%=request.getContextPath() %>/cinemaView.do">영화관 정보</a></li>
					      	<li style="margin-right: 24px;"><a href="<%=request.getContextPath() %>/screeningList.do">상영일정 관리</a></li>
							<li><a href="<%=request.getContextPath() %>/theaterList.do">상영관 관리</a></li>
							<li><a href="<%=request.getContextPath() %>/reservationList.do">예매 현황</a></li>
							<li style="margin-left: -18px;"><a href="<%=request.getContextPath() %>/board/notice.jsp">게시판</a></li>
							 <%
								 } 
							%>	
						</ul>
						<ul class="clearfix2">
							<li class="log"><a href="<%=request.getContextPath() %>/view/login/Login.jsp"><%=result %></a></li>
							<li class="log"><a href="<%=request.getContextPath()%>/logOut.do">로그아웃</a></li>
						</ul>
					</nav>
					
				</div>
			</div>
		</div>
	</header>
	<!-- //header -->


	<section id="cinema">
		<div class="container">
			<div class="row">
				<div class="schedule">
					<table>
						<thead>
							<tr>
								<td colspan="3" style="text-align:left; border:none;">
									<h2>영화관 정보</h2>	
								</td>
								<td style="text-align:right; border:none;">
								<%
									if(cVo==null){
								%>
									<input type="button" class="btn" id="addBtn" value="등록" style="cursor: pointer;">
								<%		
									}
								%> 
								</td>
							</tr>
							<tr>
								<th>지역</th>
								<th>영화관명</th>
								<th>상세주소</th>
								<th>전화번호</th>
							</tr>
						</thead>
						<tbody>
						<%
							if(cVo==null){
						%>
								<tr><td colspan="4">영화관 정보를 등록해주세요.</td></tr>
						<%		
							}else{
						%> 
							<tr>
								<td><%=cVo.getCn_loc() %></td>
								<td><%=cVo.getCn_nm() %></td>
								<td><%=cVo.getCn_addr() %></td>
								<td><%=cVo.getCn_tel() %></td>
							</tr>
						 <%
							 } 
						%>	
						</tbody>	
					</table>
				</div>
			</div>
		</div>
	</section>
	
	<footer id="footer">
		<div id="footer_sns">
			<div class="container">
			</div>
		</div>
		<div id="footer_infor">
			<div class="container">
				<div class="row">
					<div class="footer_infor">
						<h2>
							<img src="./images/megafox로고.png" alt="megafox">
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
	<!-- //footer -->
	
	<!-- 자바스크립트 라이브러리 -->
	<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
	<script type="text/javascript">

	$(function(){
		$("#addBtn").on("click", function(){
			location.href = "<%=request.getContextPath()%>/cinemaInsert.do"; 
		
		
		
		});
	});
		
	
	
	</script>
	
	
</body>
</html>