<%@page import="kr.or.ddit.board.service.QnaServiceImpl"%>
<%@page import="kr.or.ddit.board.vo.QnAVO"%>
<%@page import="kr.or.ddit.board.service.IQnaService"%>
<%@page import="kr.or.ddit.board.service.NoticeServiceImpl"%>
<%@page import="kr.or.ddit.board.service.INoticeService"%>
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
<script src="<%=request.getContextPath()%>/js/qna_js.jsp"></script>
<title>notice</title>
<style>
body {
	background-color : #FAFAFA;
}

#blank {
	background : black;
	width : 100%;
	height : 80px;
}

#subnav {
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
	color : black;
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

.banner {
	width : 150px;
	margin-top : 12px;
}

input:focus ~ label, textarea:focus ~ label, input:valid ~ label, textarea:valid ~ label {
    font-size: 0.75em;
    color: #999;
    top: -5px;
    -webkit-transition: all 0.225s ease;
    transition: all 0.225s ease;
}

.styled-input {
    float: left;
    width: 293px;
    margin: 1rem 0;
    position: relative;
    border-radius: 4px;
}

@media only screen and (max-width: 768px){
    .styled-input {
        width:100%;
    }
}

.styled-input label {
    color: #999;
    padding: 1.3rem 30px 1rem 30px;
    position: absolute;
    top: 10px;
    left: 0;
    -webkit-transition: all 0.25s ease;
    transition: all 0.25s ease;
    pointer-events: none;
}

.styled-input.wide { 
    width: 650px;
    max-width: 100%;
}

input,
textarea {
    padding: 30px;
    border: 0;
    width: 100%;
    font-size: 0.85rem;
    background-color: #2d2d2d;
    color: white;
    border-radius: 4px;
}

input:focus,
textarea:focus { outline: 0; }

input:focus ~ span,
textarea:focus ~ span {
    width: 100%;
    -webkit-transition: all 0.075s ease;
    transition: all 0.075s ease;
}

textarea {
    width: 100%;
    min-height: 15em;
}

.input-container {
    width: 650px;
    max-width: 100%;
    margin: 20px auto 25px auto;
}

#buttons {
	margin-left : 371px;
	margin-top : 40px;
}

#usend, #uback {
	width : 100px;
	height : 40px;
	background : #D51619;
	border-radius : 60px;
	text-align : center;
	font-size : 15px;
	font-weight : 600;
	margin-left : 10px;
	cursor: pointer;
	padding : 0px;
	-webkit-transition: background-color 0.2s;
	transition: background-color 0.2s;
}

#usend:hover, #uback:hover {
	background-color : #E5151F;
}

#usend:active, #uback:active {
	background-color : #C10E17;
}

.filebox label {
	width : 595px;
	height : 40px;
	display: inline-block;
	padding: .5em .75em;
	color: #fff;
	text-align : center;
	font-size : 16px;
	font-weight : 400;
	line-height: normal;
	vertical-align: middle;
	background-color: #2D2D2D;
	cursor: pointer;
	border-radius: 0.25em;
	-webkit-transition: background-color 0.2s;
	transition: background-color 0.2s;
	margin-top : 10px;
}

.filebox label:hover {
	background-color: #444444;
}

.filebox label:active {
	background-color: #1E1E1E;
}

.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}

</style>
<script>
mypath = `<%=request.getContextPath()%>`;

$(function() {
	
// 	$('#usend').on('click', function() {
		
// 		// 입력한 값 저장
// 		udata = $('#uform').serializeJSON();
// 		//console.log(udata);
		
// 		// 폼에 입력한 내용 삭제
// 		$('#uform .txt').val("");
		
// 		// js 메소드 호출
// 		noticeUpdateServer();
		
// 		// 게시글 목록 페이지로 이동
// 		NoticeListPageServer(1);
// 	})
	
	$('#uback').on('click', function() {
		location.href = "<%=request.getContextPath()%>/board/qna.jsp";
	})
})

</script>
</head>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	IQnaService service = QnaServiceImpl.getService();
	QnAVO vo = service.getQna(num);
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
					      	<li><a href="<%=request.getContextPath() %>/movieList.do">영화</a></li>
							<li><a href="<%=request.getContextPath() %>/cinemaMapLoc.do">극장</a></li>
							<li><a href="<%=request.getContextPath() %>/board/notice.jsp">게시판</a></li>
							<li><a id="mypage" href="<%=request.getContextPath() %>/clientInfo.do">마이페이지</a></li>
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

	<!-- 공백 -->
	<div id="blank">
	</div>
	
	<!-- 공지사항 작성h2, 서치바 -->
	<div id="subnav">
		<h2 class="noticeh2">공지 수정</h2>
	</div>

	<div id="bodydiv">
	
		<!-- 왼쪽 사이드바(div) -->
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
		</div>
		
		<!-- 글수정 폼 -->
		<div class="container">
			<div class="row input-container">
				<form id="uform" action="<%=request.getContextPath() %>/QnaUpdate.do" method="post">
					<input type="hidden" name="q_num" value="<%=vo.getQ_num() %>">
					<input type="hidden" name="r_count" value="<%=request.getParameter("currentPage")%>"> <!-- 현재페이지를 VO에 담기위해 VO변수 사용 -->
					<div class="col-xs-12">
						<div class="styled-input wide">
							<input type="text" class="txt" id="title" name="q_subject" value="<%=vo.getQ_subject() %>" required />
							<label>💡 공지 타이틀을 입력해주세요!</label> 
						</div>
					</div>
					<div class="col-xs-12">
						<div class="styled-input wide">
							<textarea class="txt" id="content" name="q_content" required><%=vo.getQ_content() %></textarea>
							<label>📝 내용을 입력해주세요!</label>
						</div>
					</div>
					<div id="buttons">
						<input type="button" value="뒤로가기" id="uback">
						<input type="submit" value="수정" id="usend">
					</div>
				</form>
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
							<img src="<%=request.getContextPath()%>/images/megafox로고.png" alt="megafox">
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