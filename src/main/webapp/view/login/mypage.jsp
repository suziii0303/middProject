<%@page import="kr.or.ddit.client.vo.ClientVO"%>
<%@page import="kr.or.ddit.movie.vo.MovieVO"%>
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

ClientVO vo = (ClientVO)request.getAttribute("Clist");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="format-detection" content="telephone=no">
<title>MEGAFOX</title>

<script>
$(function(){
	$("#iddelete").on("click", function(){
		var form = this.form;
		form.action = "<%=request.getContextPath()%>/clientDeleteClient.do"
		form.submit();
		alert("회원 정보가 삭제됩니다.");
	
	});
	$('#showRsv').on("click",function(){
		var id = "<%=vid%>";


		location.href =`<%=request.getContextPath()%>/showReservationList.do?id=${id}`
		
			
	})
	
	
})
</script>

<style>
#mypagetable{
width: 600px;
height: 400px;
margin: 5px auto 20px auto;
color: white;
background: #1C1C1C;
}


.mypagetr td{
width:500px;

}
#mypagetable tr:nth-child(5) input[type="date"], input[type="text"]{
	width : 200px;
	margin-left: 30px;
	background-color: #1C1C1C;
	color : white;
	border: 1px solid #1C1C1C;
	padding-left: 20px;
}
#mypagetable tr td:first-child{
	text-align: center;
	font-weight: bold;
	font-size: 1.0rem;
}
#mytitle{
font-size : 80px;
color : #D51619;
margin: 80px 0px 0px 40.7%;
	
}
 #myinfo{
font-size: 33px;
 color : white;
margin: 2px 0px 10px 35%;
 }
.upBtn{
    float : right;
	width: 100px;
	height: 40px;
	border-radius: 20px;
	background: #D51619;
	color :white;
 	margin-bottom: 50px; 
 	position : relative;
 	z-index : 9999;
 	margin: 0px 10px 0px 0px;
}
#btn{
margin-right: 33.5%;
margin-bottom: 100px;
}
</style>

<!-- css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/swiper.css">

<!-- 파비콘 -->
<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/megafox_favicon.ico">

<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">

</head>
<body style="background : black;">
	<header id="header">
		<div class="container">
			<div class="row">
				<div class="header clearfix">
					<h1>
						<a href="<%=request.getContextPath() %>/index.jsp"> 
						<em>
						<img src="<%=request.getContextPath() %>/images/megafox로고.png" alt="MEGAFOX">
						</em> 
						</a>
					</h1>
					
					<nav class="nav">
					<div id="div1">
						</div>
						<ul class="clearfix1">
					      	<li><a href="<%=request.getContextPath() %>/movieList.do">영화</a></li>
							<li><a href="<%=request.getContextPath() %>/cinemaMapLoc.do">극장</a></li>
							<% if(vid==null){
							%>
								<li><a href="<%=request.getContextPath() %>/view/login/Login.jsp" onclick="functionAlert()">게시판</a></li>
							
							<%
							} else{
							%>
								<li><a href="<%=request.getContextPath() %>/board/notice.jsp">게시판</a></li>
							
							<%	
							}
							%>
							
							<li><a href="<%=request.getContextPath() %>/clientInfo.do">마이페이지</a></li>
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
	</header>
	<!-- //header -->


	<section id="my">
	
		<h1 id="mytitle">MY PAGE</h1>
		
		<h4 id="myinfo">나의 정보</h4>
			
			<%if(vo==null){ %>
			<form action="<%=request.getContextPath()%>/loginAll.do" method="post">
				<table border="1" style="border: white;" id ="mypagetable">
					<tr><td colspan="5"> 로그인 해주세요.</td></tr>
				</table>
			</form>	
				
				<%
			
				%>
			<% }else {%>
			<form action="<%=request.getContextPath()%>/view/login/updateClient.jsp" method="post">
				<table border="1" style="border: black;" id ="mypagetable">
			
				<tr class="mypagetr">
					<td >아이디
					<td><input  type="text" name="id" value="<%=vo.getC_id() %>" readonly></td>
				</tr>
				
				<tr class="mypagetr">
					<td>고객명</td>
					<td><input type="text" name="name"value="<%=vo.getC_nm() %>" readonly></td>
				</tr>
				
				<tr class="mypagetr">
					<td>비밀번호</td>
					<td><input type="text" name="pass" value="<%=vo.getC_pass()%>" readonly></td>
					
				</tr>
				<tr class="mypagetr">
					<td>e-mail</td>
					<td><input type="text"name ="email"value="<%=vo.getC_email()%>" readonly></td>
				</tr>
				<tr class="mypagetr">
					<td>핸드폰번호</td>
					<td><input type="text"name ="tel"value="<%=vo.getC_tel()%>" readonly></td>
				</tr>
				
				<tr class="mypagetr">
					<td>생년월일</td>
					<td><input type="text"name ="bir" value="<%=vo.getC_bir() %>" readonly></td>
				</tr>
				
				<tr class="mypagetr">
					<td>주소</td>
					<td><input type="text" name="add" value="<%=vo.getC_add() %>" readonly></td>
			
				</tr>
				
				<tr class="mypagetr">
					<td>성별</td>
					<td><input type="text" name="gend" value="<%=vo.getC_gend() %>" readonly></td>
			
				</tr>
			</table>
			<div id = "btn">
				<input type="submit" value="수정" class="upBtn" id="idUp">
				<input type="button" value="탈퇴" class="upBtn" id="iddelete">
				<input type="button" id="showRsv" class="upBtn" value="예매조회">
				<input type="hidden" id="c_id" name="c_id" value="<%= vo.getC_id()%>">	
			</div>
	</form>
			<%}%>
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
	<!-- //footer -->


	<!-- 자바스크립트 라이브러리 -->
	<script src="<%=request.getContextPath() %>/assets/js/jquery.min_1.12.4.js"></script>
	<script src="<%=request.getContextPath() %>/assets/js/modernizr-custom.js"></script>
	<script src="<%=request.getContextPath() %>/assets/js/ie-checker.js"></script>
	<script src="<%=request.getContextPath() %>/js/swiper.min.js"></script>
	<script src="<%=request.getContextPath() %>/assets/js/iframe_api.js"></script>
	<script src="<%=request.getContextPath() %>/assets/js/movie.js"></script>
	<script>
	
	function functionAlert(){
		alert("로그인 후 이용가능합니다.");
		
	}
		//배너 이미지 슬라이드
		var swiper = new Swiper('.swiper-container', {
			pagination : {
				el : '.swiper-pagination',
			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
			autoplay : {
				delay : 1500,
			},
		});

		//영화차트 이미지 슬라이드
		var swiper = new Swiper('.swiper-container2', {
			slidesPerView : 4,
			spaceBetween : 24,
			//            mousewheel: {
			//                invert: true,
			//            },
			keyboard : {
				enabled : true,
				onlyInViewport : false,
			},
			autoplay : {
				delay : 6000,
			},
			breakpoints : {
				600 : {
					slidesPerView : 1.4,
					spaceBetween : 24
				},
				768 : {
					slidesPerView : 2,
					spaceBetween : 24
				},
				960 : {
					slidesPerView : 3,
					spaceBetween : 24
				}
			}
		});

		//영화차트 탭 메뉴
		var movBtn = $(".movie_title > ul > li");
		var movCont = $(".movie_chart > div");

		movCont.hide().eq(0).show();

		movBtn.click(function(e) {
			e.preventDefault();
			var target = $(this);
			var index = target.index();
			movBtn.removeClass("active");
			target.addClass("active");
			movCont.css("display", "none");
			movCont.eq(index).css("display", "block");
		});

		//공지사항 탭 메뉴
		var tabMenu = $(".notice");

		//컨텐츠 내용을 숨겨주세요!
		tabMenu.find("ul > li > ul").hide();
		tabMenu.find("li.active > ul").show();

		function tabList(e) {
			e.preventDefault(); //#의 기능을 차단
			var target = $(this);
			target.next().show().parent("li").addClass("active").siblings("li")
					.removeClass("active").find("ul").hide();
			//버튼을 클릭하면 ~ div를 보여주고
			//부모의 li 태그에 클래스 추가하고
			//형제의 li 태그에 클래스 제거하고
			//제거한 자식의 div 태그를 숨겨줌 
		}

		tabMenu.find("ul > li > a").click(tabList).focus(tabList);
		
	
	</script>
</body>
</html>