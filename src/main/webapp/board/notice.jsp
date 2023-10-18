<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String vid = (String) session.getAttribute("id");
String auNum = (String) session.getAttribute("auNum");
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- table, button -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/swiper.css">
<!-- 파비콘 -->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/megafox_favicon.ico">
<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">

<script src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.serializejson.min.js"></script>
<script src="<%=request.getContextPath()%>/js/notice_js.jsp"></script>
<title>notice</title>
<style>

header {
  position: static;
  left: 0;
  bottom: 0;
  width: 100%;
}

#wrapper{
  height: auto;
  min-height: 100%;
  padding-bottom: 500px;
}

footer{
  position : relative;
  transform : translateY(-100%);
}

body {
	background-color : #FAFAFA;
}

#blank {
	background : black;
	width : 100%;
	height : 80px;
}

#subnav {
	position: static;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color : black;
	width : 100%;
	height : 150px;
}

.noticeh2 {
	color : white;
	font-size : 30px;
	font-weight : bold;
	text-align : center;
	padding : 15px;
	margin : auto;
	margin-bottom : 10px;
}

.searchbar {
	background : white;
	border : 1px solid #8B8A88;
	border-radius : 5px;
	width : 50%;
	height : 40px;
	display : flex;
	margin : auto;
}

#searchicon {
	width : 20px;
	height : 20px;
	margin : 8px;
	margin-left : 15px;
	margin-right : 15px;
	float : left;
}

#searchNotice {
	border : none;
	width : 100%;
	height : 35px;
	float : right;
}

input:focus {
	outline: none;
}

#bodydiv {
	display : flex;
	margin-left : 200px;
	width : 60%;
	height : 100%;
}

.leftdiv {
	width : 20%;
	margin-top : 30px;
	margin-right : 10px;
}

.leftdiv td {
	width : 150px;
	height : 35px;
	color : #black;
	font-size : 14px;
	font-weight : bold;
	padding-top : 7px;
	float : left;
}

.leftdiv td:active {
	border : 2px solid #8B8A88;
}

.leftdiv td:hover {
	background : #d51619;
	color : white;
}

#centerdiv {
	padding-top : 20px;
}

.table {
	float : right;
}

.table th {
    color: white;
    background: #1C1C1C;
    text-align: center;
}

.table td {
	text-align : center;
	font-size : 13px;
}

.banner {
	width : 150px;
	margin-top : 12px;
}

a {
	color : black;
	text-decoration : none;
}

a:hover {
	color : black;
	font-weight : bold;
	text-decoration : underline;
}

#writediv {
	width : 100%;
}

#writebtn {
	font-size : 13px;
	float : right;
}

.pagination {
	margin-left: 600px;
    margin-top: 480px;
}

.pagination li a {
	font-size : 13px;
	color : black;
}

.pagination li a:hover, .pagination li a:active {
	background-color : none;
	color : #d51619;
	text-decoration : underline;
}

.page-link {
	background-color : none;
	border : none;
}

.page-link:hover {
	background-color : none;
}

.page-item active {
	background : none;
	color : #d51619;
	text-decoration : underline;
}

#rightdiv{
	margin-bottom : 350px;
}

</style>
<script>
mypath = '<%= request.getContextPath() %>';
console.log(mypath);

currentPage = 1;

$(function() {

	noticeListPageServer(1);
	
	// 검색
	$('#searchNotice').on('keypress', function(key) {
		if(key.keyCode == '13') {
			noticeListPageServer(1);
		}
	})
	
	// 다음페이지(>) 버튼 - delegate
	$(document).on('click', '#next', function() {
		currentPage = parseInt($('.pageno').last().text()) + 1;
		noticeListPageServer(currentPage);
	})

	// 이전페이지(<) 버튼 - delegate
	$(document).on('click', '#prev', function() {
		currentPage = parseInt($('.pageno').first().text()) -1;
		noticeListPageServer(currentPage);
	})
	
	// 페이지번호(숫자) 버튼 - delegate
	$(document).on('click', '.pageno', function() {
		currentPage = parseInt($(this).text().trim()); // this = 클릭한 페이지번호
		noticeListPageServer(currentPage);
	})

	// 글쓰기 버튼 - delegate
	$(document).on('click', '#writebtn', function() {
		location.href = "<%=request.getContextPath()%>/NoticeWrite.do";
	})
	
})

</script>
</head>

<body>

	<header id="header">
		<div class="container">
			<div class="row">
				<div class="header clearfix">
					<h1>
					<%
						switch(auNum){
						case "1":
					%>
					<a href="<%=request.getContextPath() %>/clientList.do"> 
					<em>
						<img src="<%=request.getContextPath()%>/images/megafox로고.png" alt="MEGAFOX">
						</em> 
						</a>
					<%
						break;
						case "2":
					%>
					<a href="<%=request.getContextPath() %>/cinemaView.do"> 
					<em>
						<img src="<%=request.getContextPath()%>/images/megafox로고.png" alt="MEGAFOX">
						</em> 
						</a>
					<%
						break;
						case "3":
					%>
					<a href="<%=request.getContextPath() %>/movieList.do">
					<em>
						<img src="<%=request.getContextPath()%>/images/megafox로고.png" alt="MEGAFOX">
						</em> 
						</a>
					<%
						break;
						}
					%>
						
						
					</h1>
					
					<nav class="nav">
					<div id="div1">
						</div>
						<ul class="clearfix1">
						<%
							switch(auNum) {
							case "1":
						%>
						
                    		<li><a href="<%=request.getContextPath() %>/clientList.do">고객관리</a></li>
		                    <li><a href="<%=request.getContextPath() %>/shopperList.do">점주관리</a></li>
		                    <li><a href="<%=request.getContextPath() %>/mngMovieList.do">영화관리</a></li>
		                    <li><a href="<%=request.getContextPath() %>/board/notice.jsp">게시판관리</a></li>
						<%
							break;
							case "2":
						%>
							<li style="margin-right: 24px;"><a href="<%=request.getContextPath() %>/cinemaView.do">영화관 정보</a></li>
                        	<li style="margin-right: 24px; width: 99px;"><a href="<%=request.getContextPath() %>/screeningList.do">상영일정 관리</a></li>
                    		<li style="margin-right: 16px;"><a href="<%=request.getContextPath() %>/theaterList.do">상영관 관리</a></li>
		                    <li style="margin-right: 7px;"><a href="<%=request.getContextPath() %>/reservationList.do">예매 현황</a></li>
		                    <li style="margin-left: -11px;"><a href="<%=request.getContextPath() %>/board/notice.jsp">게시판</a></li>
						<%
							break;
							case "3":
						%>
					      	<li><a href="<%=request.getContextPath() %>/movieList.do">영화</a></li>
							<li><a href="<%=request.getContextPath() %>/cinemaMapLoc.do">극장</a></li>
							<li><a href="<%=request.getContextPath() %>/board/notice.jsp">게시판</a></li>
							<li><a id="mypage" href="<%=request.getContextPath() %>/clientInfo.do">마이페이지</a></li>
						<%
							}
						%>
						</ul>
						<div id="div2">
						</div>
						<% if(result=="로그인"){ %>
						<ul class="clearfix2">
							<li class="log"><a href="<%=request.getContextPath() %>/view/login/Login.jsp"><%=result %></a></li>
							 
						</ul>
						<%}else{ %>
							<ul class="clearfix2">
							<li class="log"><a href="#"><%=result %></a></li>
							<li class="log"><a href="<%=request.getContextPath()%>/logOut.do">로그아웃</a></li>
							</ul>
						<%} %>
					</nav>
				</div>
			</div>
		</div>
	</header> <!-- header -->
	
	
	<div id='wrapper'>
		<div id="blank">
		</div>
		
		<div id="subnav">
			<h2 class="noticeh2">공지사항</h2>
			<form class="search" onsubmit="return false">
				<div class="searchbar">
					<img id="searchicon" src="<%=request.getContextPath()%>/images/search.png">
					<input id="searchNotice" type="text" placeholder="검색어를 입력해 주세요." name="search">
				</div>
			</form>
		</div> <!-- 공지사항h2, 서치바 -->
	
		<div id="bodydiv">
		
			<div class="leftdiv">
				<table class="sidetable">
					<tr>
						<td onclick="location.href='<%=request.getContextPath() %>/board/notice.jsp'" class="noticeBoard">&nbsp;공지사항</td>
					</tr>
					<tr>
						<td onclick="location.href='<%=request.getContextPath() %>/board/qna.jsp'" class="qnaBoard">&nbsp;Q&A게시판</td>
					</tr>
				</table>
				<a href="#"><img class="banner" src="<%=request.getContextPath()%>/images/boardBanner.png"></a>
			</div> <!-- 왼쪽 사이드바(div) -->
			
			<div id="rightdiv">
				<div id="boardTable">
				</div>
					
				<div id="pageList">
				</div>
			</div>
	
		</div>
	</div>


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
							<img src="<%=request.getContextPath()%>/images/megafox로고.png" alt="MEGAFOX">
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
	</footer> <!-- footer -->

</body>
</html>	
</body>
</html>