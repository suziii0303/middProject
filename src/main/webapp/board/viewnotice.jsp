<%@page import="kr.or.ddit.board.vo.NoticeVO"%>
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

.banner {
	width : 150px;
	margin-top : 12px;
}

#rightdiv{
	margin-bottom : 350px;
}

#golist {
	width : 100px;
	height : 40px;
	background : #D51619;
	border-radius : 60px;
	text-align : center;
	font-size : 15px;
	font-weight : 600;
	margin-left : 10px;
	padding : 0px;
	color : white;
}

.table {
	margin-top : 35px;
}

.btn, .action {
	width : 100px;
	height : 40px;
	background : #D51619;
	border-radius : 60px;
	text-align : center;
	font-size : 15px;
	font-weight : 600;
	margin-left : 10px;
	padding : 0px;
	color : white;
}

.btn:hover {
	background-color : #D51619;
}

#subject {
	font-size : 15px;
}

#date {
	text-align : right;
}

img {
	width : 100%;
}

</style>
<script>
mypath = '<%= request.getContextPath() %>';
console.log(mypath);

$(function() {
	
	$('#delete').on('click', function() {
		idx = $(this).attr('idx');
		noticeDeleteServer();
	});
	
	$('#list').on('click', function() {
		location.href = "<%=request.getContextPath()%>/board/notice.jsp";
	})

});

</script>
</head>
<%
	NoticeVO nvo = (NoticeVO)request.getAttribute("getNotice");
%>
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
							break;
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
			
				<!-- 글 상세정보 출력 -->
				<div class="container mt-3">

					<form name="detailForm" id="detailForm" action="<%=request.getContextPath()%>/NoticeUpdate.do">
					
						<input type="hidden" name="num" value="<%=nvo.getNo_num()%>">

						<table class="table">
							<thead class="table-dark">
								<tr>
									<td colspan="2"><%=nvo.getNo_subject() %></td>
								</tr>
							 </thead>
							 <tbody>
								<tr>
									<td>작성일자: <%=nvo.getNo_date() %></td>
									<td style="text-align:right">조회수: <%=nvo.getNo_hit() %></td>
								</tr>
							 	<tr>
							 		<%
							 			if(nvo.getNo_writer() != null) {
							 		%>
							 	
										<td colspan="2">
										<img src="<%=request.getContextPath()%>/imageView.do?poster=<%=nvo.getNo_writer() %>">
										</td>
										
									<%
							 			}
									%>
								</tr>
								<tr>	
										<td>
										<%=nvo.getNo_content().replaceAll("\\\n", "<br>") %>
										</td>
								</tr>
							</tbody>
						</table>
					
						<br>

							<input type="button" value="목록" class="btn" name="list" id="list">
							<%
								if(auNum.equals("1")) {
							%>
							<input type="submit" idx="<%=nvo.getNo_num() %>" value="수정" id="update" name="update" class="btn">
							<input type="button" idx="<%=nvo.getNo_num() %>" value="삭제" id="delete" name="delete" class="btn">
							<%
								}
							%>
					</form>
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