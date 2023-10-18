<%@page import="java.util.HashMap"%>
<%@page import="kr.or.ddit.seat.vo.SeatVO"%>
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
  	      <h1>좌석예매</h1>
	        <div class="reservationBox" style="margin: 0 auto; width: 970px; height: 555px;">




        <div class="seatRow" 
            style="padding: 0 100px; text-align : center; width: 400px; height: 600px; background-color: rgb(80, 80, 80); float: left;">

            <h3 style="margin : 30px auto 0px; color: white; font-size : 1.3rem;">SCREEN</h3>
            <hr color="white">
<%
List<SeatVO> list2 = (List<SeatVO>) request.getAttribute("seatList");
HashMap<String,String> map = (HashMap<String,String>) request.getAttribute("data");
%>

<div id="seats" >
<%
String tid = map.get("tid");
String cid = map.get("cid");
String mid = map.get("mid");
String date = map.get("date");
String mname = map.get("mname");
String mpost = map.get("mpost");
String cname = map.get("cname");
String tname = map.get("tname");
String time = map.get("time");
for(int i =0; i<list2.size(); i++){
	SeatVO svo = list2.get(i);	
	String row = svo.getS_nm().substring(0,1);
	String col = svo.getS_nm().substring(1);
	String isOk = svo.getS_ok();
	String sname = svo.getS_nm();
	int sid = svo.getS_id();

	if((i+14)%14==0){
%>
		<button type='button' class='row-<%=row %> represent' style='border: 2px solid black; left: 20px;'><%=row %></button>
		<button type='button' sname='<%=sname %>' rid='<%=row %>' isok='<%=isOk %>' btid='<%=tid %>' id='<%=sid %>' class='row-<%=row %> col-<%=col %> sbtn' style=' border: 2px solid black;'><%=col %></button>
<%		 
	} else{
%>
		<button type='button' sname='<%=sname %>' rid='<%=row %>' isok='<%=isOk %>' btid='<%=tid %>' id='<%=sid %>' class='row-<%=row %> col-<%=col %> sbtn' style=' border: 2px solid black;'><%=col %></button>
<%	
	}
	}
%>            	
		<h4 style="color : lightgray; font-size : 130%"> <span id="s1">X</span> : 예매불가 &nbsp;  &nbsp;&nbsp; &nbsp;<span id="s2">■</span> : 예매가능 &nbsp;  &nbsp; &nbsp;&nbsp;<span id="s3">■</span> : 선택한좌석</h4>
  </div>

        </div>

        <div class="infoBox"
            style="background-color: rgb(51, 51, 51); width: 328px; height: 555px; float: left; margin-left: 10px; padding-top:30px;">
            <div class="movieInfo" >

                <div style="margin: 5px; padding: 0 30px; margin-bottom: 10px;">
                    <div style="width: 250px;">
                    <h3 id="moviename" style="font-size : 1.3rem;">영화제목 : <%=mname %><span hidden><%= mid %></span></h3>
                    <hr color="darkgrey">
                </div>
                </div>

                <div style="float: left; width: 328px; padding: 0 30px; margin-top: 10px;">
                    <div style="width: 250px; height: 140px;  margin-left: 6px;">
                    <ul
                        style="list-style: none; width : 100%; float: left; margin-right: 15px; margin-left: 10px; padding: 10px 20px;">
                        <li class="theaterInfo">영화관 : <%=cname %><span hidden><%=cid %></span></li>
                        <li class="theaterInfo">상영관 : <%=tname %><span hidden><%=mpost %></span></li>
                        <li class="theaterInfo">날짜 : <%=date %><span hidden><%=date %></span></li>
                        <li class="theaterInfo">시작시간 : <%=time %><span hidden><%=time %></span></li>
                    </ul>
                    
                    
                    </div>
                </div>

                <div>
                    
                        <h3 style="margin-left: 35px; font-size : 1.3rem;">선택좌석<span style="font-size : 1.0rem; color : #D51619">(최대 8매)</span></h3>
                        
                    <div style="width: 250px; height: 120px; margin: 0 auto; border-bottom: 1.2px solid darkgrey; padding: 0 10px;">
                    <hr color="darkgrey">
                    <ul style="list-style: none; padding: 0px 15px;" id="showSelectedSeat">
                        
                    </ul>
                   
                    </div>
                    
                </div>
                <div>
                    <div style="float: left; margin-top: 25px; padding: 0 30px;"></div>
                    <div style="clear: both; padding: 0 30px; margin-top: 20px; font-size: 1.3rem;">최종 결제금액 <span
                            style="float: right;">원</span>
                        <span id="sprice" style="float: right; color: cadetblue; font-size: 120%;"></span>
                    </div>
                </div>
                <div class="buttonBox" style="text-align: center; clear: both; margin-top: 25px;">
                	<input type="hidden" value="">
                    <button type="button" class="decisionBtn"
                        style="width: 164px; height: 51px; float: left; z-index: 999; background-color: #d51619; outline: none; border: none; color: white; font-size: 150%;">결제</button>
                    <button type="button" id="cancelbtn"
                        style="width: 164px; height: 51px; float: left; z-index: 999; background-color: rgb(120, 120, 120); outline: none; border: none; color: white; font-size: 150%;">취소</button>
                </div>
            </div>

        </div>

    </div>
    <!-- reservationBox end -->
        	
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
	var clickedBtns = [];
		$('#cancelbtn').on('click',function(){
			var result = confirm("예매를 취소하고 첫 화면으로 이동하시겠습니까?");
			if (result) {
				location.href = '<%= request.getContextPath() %>/movieList.do';
			} else {
			    // 삭제 취소
			}
		})
		//뒤로가기 클릭 시 뒤로 가는 함수
		function backToMain(){
			location.href = '<%= request.getContextPath() %>/movieList.do';
		}
		//예약된 자리는 X으로 나타남
		$(document).ready(function() {
			$('.sbtn').each(function() {
				var vbtn = $(this);
		    if (vbtn.attr('isok') == 'Y') {
		        vbtn.css({'backgroundColor' : '#5a5a5a', 'color' : 'yellow'});
		        vbtn.html("X");
		        vbtn.prop('disabled', true);
		    }
		    })
		});
		
		
		$(document).on('click','.sbtn',function(){
			vbtn = $(this).attr("sname");
			vsid = $(this).attr("id");
			vtid = $(this).attr("btid");
			var length = clickedBtns.length;
			code = "";
			if(clickedBtns.length <=7){
			    if ($(this).css('color') !== 'rgb(255, 255, 255)') {
			      $(this).css({'backgroundColor': '#D51619', 'color': 'rgb(255, 255, 255)'});
			      code = "<li style='margin: 0 auto;'><button tid='"+vtid +"'sid='"+vsid+"'class='selectedSeat' style='width: 40px; height: 40px; border: none;'>"+vbtn+"</button></li>";
			      $('#showSelectedSeat').append(code);
			      clickedBtns.push(vsid);
			      
			    } else {
			      $(this).css({'backgroundColor': 'lightgray', 'color': 'rgb(34, 34, 34)'});
			      $('#showSelectedSeat li button:contains("' + vbtn + '")').remove();
			      var index = clickedBtns.indexOf(vsid);    
			      if (index !== -1){
			    	  clickedBtns.splice(index,1);
			      }
			  }	
			}else{
				if($(this).css('color') === 'rgb(255, 255, 255)'){
					$(this).css({'backgroundColor': 'lightgray', 'color': 'rgb(34, 34, 34)'});
				    $('#showSelectedSeat li button:contains("' + vbtn + '")').remove();
				    var index = clickedBtns.indexOf(vsid);    
				    if (index !== -1){
				    	clickedBtns.splice(index,1);
				    }
				}
			}
			code2 = (15000*(clickedBtns.length)).toLocaleString();
			$('.buttonBox input').val(clickedBtns);
			$('#sprice').text(code2);
			
			
		})
			
		
	$(function(){

		//영화 클릭 시 영화관 출력되는 이벤트
		$(document).on('click','.location',function(){
			vidx = $(this).attr('idx');
			vreply = $(this);
			movieId = vreply.next().val();
			
			getCinemaList();
		})
		
		//결제버튼 클릭시
		$('.decisionBtn').on('click',function(){
			var hasButton = $("#showSelectedSeat li").find("button").length > 0;
			
			if (hasButton) {
			  insertReservation();
			} else {
			  alert("좌석을 선택해주세요");
			}
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