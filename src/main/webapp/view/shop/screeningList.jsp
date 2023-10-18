<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.screening.vo.ScreeningVO"%>
<%@page import="kr.or.ddit.cinema.vo.CinemaVO"%>
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

h2 {
    font-weight: bold; 
    font-size: 22px;
}

.addbtn, .delbtn {
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
 
 table{
  width:1000px;
  table-layout: fixed;
  
  margin-right: 0px;
  margin-left: 100px;
   
}

.tbl-header{
margin-top: 100px;
}
.tbl-content{
	text-align: center;
  height:500px;
  overflow-x:auto;
  margin-top: 0px; 
  padding-bottom: 350px;
  margin-right: 150px;
}
th{
	text-align: center;
background-color: #1C1C1C;
  padding: 10px;
  font-weight: 500;
  font-size: 15px;
  color:  white;
}
td{
  padding: 15px;
  vertical-align:middle;
  font-size: 15px;
  color:  white;
   font-family: 'Cairo', sans-serif;
}

.tableBox{
	width : 500px;
	margin-left: 100px;
	margin-top: 100px;
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
	List<ScreeningVO> screeningList = (List<ScreeningVO>)request.getAttribute("screeningList");
	SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
%>

	<section id="time">
		<div class="container">
			<div class="row">
				<div class="schedule" >
					<form name="time" id="theaterform" >
					<div class="tbl-header">
						<table>
							<thead>
								<tr>
									<td colspan="6" style="text-align:left; border:none;">
										<h2>상영 일정 목록</h2>	
									</td>
								</tr>
								<tr>
									<th>NO.</th>
									<th>상영관</th>
									<th colspan="2">상영날짜</th>
									<th>상영시간</th>
									<th colspan="3">영화제목</th>
									<th colspan="3">관  리</th>
								</tr>
							</thead>
					</table>		
					</div>	
  					<div class="tbl-content">
					    <table>
							<tbody>
							 <%
								if(screeningList==null || screeningList.size()==0){
							%>
									<tr><td colspan="6">일정이 하나도 없습니다.</td></tr>
							<%		
								}else{
									int count = 1;
									for(ScreeningVO sVo : screeningList){
										String formattedDate = outputDateFormat.format(inputDateFormat.parse(sVo.getT_date()));
							%> 
								<tr>
									<td><%=count++ %></td>
									<td><%=sVo.getTh_nm()%></td>
									<td colspan="2"><%= formattedDate %></td>
									<td><%=sVo.getT_time() %></td>
									<td colspan="3"><%=sVo.getM_subject()==null ? "" : sVo.getM_subject() %></td> 
									<td colspan="3">
										<input type="button" class="addbtn" id="addBtn<%=sVo.getT_num()%>" value="영화추가" style="cursor: pointer;">
										<input type="button" class="delbtn" id="dleBtn<%=sVo.getT_num()%>" value="영화삭제" style="cursor: pointer;">
									</td>
								</tr>
							 <%
									}
								 } 
							%> 
							</tbody>
						</table>
						</div>
					</form>
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
		
		$(document).on('click', '.addbtn', function(){
			var subject = $(this).closest('tr').find('td:nth-child(5)').text();
				
			var tNum = $(this).attr('id').substring(6);
			
			if(subject=="") {
			// 페이지 전환을 위해 URL에 파라미터를 추가하여 이동
	        window.location.href = `<%= request.getContextPath() %>/movieListSelect.do?t_num=` + tNum;
	        
			}else {
				alert("영화가 이미 추가된 일정입니다.");
			}
			
		});
		
		$(document).on('click', '.delbtn', function(){
			var subject = $(this).closest('tr').find('td:nth-child(5)').text(); 
			
			var tNum = $(this).attr('id').substring(6);
			
			 if(subject=="") {
				alert("영화가 추가되지 않은 일정입니다.");
			}else{
				alert("영화가 삭제됩니다."); 
				
			// 페이지 전환을 위해 URL에 파라미터를 추가하여 이동
	        window.location.href = `<%= request.getContextPath() %>/movieDelete.do?t_num=` + tNum;
				}  
		});
		
		
	});	
		
	
	</script>
	
	
</body>
</html>