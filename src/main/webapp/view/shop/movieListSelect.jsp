<%@page import="kr.or.ddit.movie.vo.MovieVO"%>
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
.header .nav .clearfix1{width: 900px;}
.header .nav .clearfix1 li {float: left; width: 110px;}
.header .nav .clearfix2{width: 300px;}
.clearfix1 li:last-child { margin-left: 0px; !important} 

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

h2 {
    font-weight: bold; 
    font-size: 22px;
}




table{
  width:100%;
  table-layout: fixed;
   
}
.tbl-content{
	text-align: center;
  height:500px;
  overflow-x:auto;
  margin-top: 0px; 
  padding-bottom: 350px;
}
th{
	text-align: center;
background-color: #1C1C1C;
  padding: 10px;/* 20px 15px; */
  font-weight: 500;
  font-size: 15px;
  color:  white;
}
td{
  padding: 15px;
  vertical-align:middle;
  font-size: 15px;
  color:  white;
   border-bottom: 5px solid #1C1C1C;
   font-family: 'Cairo', sans-serif;
}

.tableBox{
	width : 1000px;
	margin-left: 100px;
	margin-top: 100px;
}

.clearfix1 li:last-child {
	 margin-left: 0px !important; 
     margin-right: 0; /* 마지막 요소 오른쪽 여백 제거 */
}

::-webkit-scrollbar {
    width: 10px;
} 
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(255,255,255,0.3); 
} 
::-webkit-scrollbar-thumb {
    -webkit-box-shadow: inset 0 0 6px rgba(255,255,255,0.3); 
}
</style>

</head>

<body>
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
                          	<li style="margin-right: 24px;"><a href="<%=request.getContextPath() %>/cinemaView.do">영화관 정보</a></li>
					      	<li style="margin-right: 24px;"><a href="<%=request.getContextPath() %>/screeningList.do">상영일정 관리</a></li>
							<li><a href="<%=request.getContextPath() %>/theaterList.do">상영관 관리</a></li>
							<li><a href="<%=request.getContextPath() %>/reservationList.do">예매 현황</a></li>
							<li style="margin-left: -18px;"><a href="<%=request.getContextPath() %>/board/notice.jsp">게시판</a></li>
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
	<!-- //header -->
	
<%
	List<MovieVO> movieList = (List<MovieVO>)request.getAttribute("movieList");
%>

	<section id="schedule">
		<div class="container">
			<div class="row">
				<div class="tableWrap">
					<div class="tableBox">
					<div class="tbl-header">
						<table class="listtable">
							<thead>
								<tr>
									<td colspan="10" style="text-align:left; border:none;">
										<h2>영화 목록</h2>	
									</td>
								</tr>
								<tr>
									<th class='fixedHeader'>NO.</th>
									<th class='fixedHeader'>제  목</th>
									<th class='fixedHeader'  colspan="5">줄거리</th>
									<th class='fixedHeader'>감  독</th>
									<th class='fixedHeader'>개봉일</th>
									<th class='fixedHeader'>관  리</th>
								</tr>
							</thead>
					    </table>
  					</div>	
  					<div class="tbl-content">
					    <table>
							<tbody class="schedule">
								<%
									if(movieList==null || movieList.size()==0){
								%>
										<tr><td colspan="10">영화가 하나도 없습니다.</td></tr>
								<%		
									}else{
										int count = 1;
										for(MovieVO movievo : movieList){
								%> 
									<tr>
										<td><%=count++ %></td>
										<td><%=movievo.getM_subject() %></td>
										<td colspan="5" style="text-align: left;"><%=movievo.getM_plot() %></td>
										<td><%=movievo.getM_director() %></td>
										<td><%=movievo.getM_date() %></td> 
										<td>
											<input type="button" class="btn" id="addBtn<%=movievo.getM_id()%>" value="선택" style="cursor: pointer;">
										</td>
									</tr>
								<%
										}
									 } 
								%> 
							</tbody>	
						</table>
					  </div>	
					</div>
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
		$(document).on('click', '.btn', function(){
			var mId = $(this).attr('id').substring(6);
			var tNum = '<%= request.getAttribute("t_num") %>';
			
			window.location.href = `<%= request.getContextPath() %>/movieAdd.do?t_num=` + tNum + `&m_id=` + mId;
			
		});
		
	});
	
		
	
	</script>
</body>
</html>


