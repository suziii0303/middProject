<%@page import="kr.or.ddit.movie.service.MovieServiceImpl"%>
<%@page import="kr.or.ddit.movie.service.IMovieService"%>
<%@page import="kr.or.ddit.cinema.vo.CinemaVO"%>
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
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="format-detection" content="telephone=no">
<title>MEGAFOX</title>

<!-- css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/swiper.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/seat.css">

<!-- 파비콘 -->
<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/megafox_favicon.ico">

<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">

<!-- 아코디언 -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/accordion.css">
</head>
<style>
#movie-detail{
	z-index: 500;
}
</style>
<body>
	<header id="header">
		<div class="container">
			<div class="row">
				<div class="header clearfix">
					<h1>
						<a href="<%=request.getContextPath() %>/movieList.do"> 
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
							<li><a href="<%=request.getContextPath() %>/board/notice.jsp">게시판</a></li>
							<li><a id="mypage" href="<%=request.getContextPath() %>/clientInfo.do">마이페이지</a></li>
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


	<section id="banner">
		<div class="slider">
			<div class="swiper-container">
				<div class="swiper-wrapper">
				
					<div class="swiper-slide ss1">
						<div class="container">	
							<div class="row">
								<h3>엘리멘탈</h3>
								<h2>6월 극장 대개봉, 웰컴 투 ‘엘리멘트 시티’!</h2>
							</div>
						</div>
					</div>
					
					<div class="swiper-slide ss2">
						<div class="container">
							<div class="row">
								<h3>스파이더맨: 어크로스 더 유니버스</h3>
								<h2>상상 그 이상을 넘어서는 멀티버스의 세계가 열린다!</h2>
							</div>
						</div>
					</div>
					
					<div class="swiper-slide ss3">
						<div class="container">
							<div class="row">
								<h3>범죄도시3</h3>
								<h2>대한민국 대표 범죄 액션 프랜차이즈 범죄도시 전격 컴백!</h2>
							</div>
						</div>
					</div>
					
				</div>
				<div class="swiper-pagination"></div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
			</div>
		</div>
	</section>
	<!-- //banner -->
<%
	String id = (String) request.getAttribute("id");
	String post = (String) request.getAttribute("post");
	List<CinemaVO> list = (List<CinemaVO>) request.getAttribute("list");
	MovieVO mVo = (MovieVO) request.getAttribute("movieVo");
%>

  <section id="movie">
  	<div class="container">
  	  <div class="row">
  	    <div class="movie">
  	      <h1>Reservation</h1>
	        <table id="select-cinema" border="1">
	            <tr>
	                <th>영화</th>
	                <th>지역</th>
	                <th>극장</th>
	                <th>날짜</th>
	                <th>상영관</th>
	                <th>시간</th>
	            </tr>
	            <tr>
	           	    <td><img src="<%=request.getContextPath() %>/images/<%=post %>" class="selected-image" alt="<%=post %>"></td>
	           	    <td>
	            <%
	            for(CinemaVO cvo : list){
	            %>    
	            	<p class="location" idx="<%=cvo.getCn_loc() %>"><%=cvo.getCn_loc() %></p>
	            	<input type='hidden' value='<%=mVo.getM_id()%>'>
	            <%	            	
	            }
	            %>
	                </td>
	                
	                <td id="cinemabyloc"></td>
	                <td id="screeningdate"></td>
	                <td id="screeningtheater"></td>
	                <td id="screeningtime"></td>
	           </tr>
       		</table>
        	<div class="button-container">
        	  <input class="main-btn left-btn" type="button" value="뒤로가기" onclick="backToMain()">
        	  <table border="1" id="selected-movie">
        	  	<tr>
        	  		<td><img src="<%=request.getContextPath() %>/images/<%=post %>" class="selected-image" alt="<%=post %>"></td>
        	  		<td><h3 class="showselected"><%=mVo.getM_subject()%></h3></td>
        	  		<td>
        	  			<h3 class="showselected" id="showCinema"></h3>
        	  			<h3 class="showselected" id="showDate"></h3>
        	  			<h3 class="showselected" id="showTheater"></h3>
        	  			<h3 class="showselected" id="showTime"></h3>
        	  		</td>
        	  	</tr>
        	  </table>
       		 <input class="main-btn right-btn" id="selectSeats" type="button" value="좌석 선택" onclick="selectSeat()">
       		 
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
							<img src="<%=request.getContextPath() %>/images/megafox로고.png" alt="megafox">
						</h2>
						<ul>
							<li><a href="<%= request.getContextPath()%>/movieDetail.do">회사소개</a></li>
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
	<script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/reservation.js"></script>
	<script>
	mypath= '<%= request.getContextPath()%>';
	
	
	
	
	//뒤로가기 클릭 시 뒤로 가는 함수
	function backToMain(){
		location.href = '<%= request.getContextPath() %>/movieList.do';
	}
	
	

	$(function(){
		//
		
		
		//영화 클릭 시 영화관 출력되는 이벤트
		$(document).on('click','.location',function(){
			vidx = $(this).attr('idx');
			vreply = $(this);
			movieId = vreply.next().val();
			
			getCinemaList();
		})
		
	})
	$(document).on('click','.swiper-slide a',function() { window.location.href = $(this).attr("href"); })
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