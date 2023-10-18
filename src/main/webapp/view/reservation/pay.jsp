<%@page import="kr.or.ddit.seat.vo.SeatVO"%>
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
<script type= "text/javascript" src = "https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="format-detection" content="telephone=no">
<title>MEGAFOX</title>

<!-- css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/swiper.css">

<!-- 파비콘 -->
<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/megafox_favicon.ico">

<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">

</head>
<style>
#movie-detail{
	z-index: 500;
}

form {
margin : 0 auto;
width: 360px;
margin-top : 100px;
background-color : white;
height : 540px;
}

.title {
  color: #eee;
  font-family: sans-serif;
  font-size: 25px;
  font-weight: 600;
  margin-top: -50px;
  text-align:center;
  margin-bottom: 10px;
}

.subtitle {
  color: #eee;
  font-family: sans-serif;
  font-size: 16px;
  font-weight: 600;
  margin-top: 10px;
}

.input-container {
  position: relative;
  width: 100%;
}

.ic1 , .ic2, .ic3, .ic4 , .ic5 {
  margin-top: 10px;
}


.input {
  background-color: transparent;
  border-radius: 12px;
  border: 0;
  box-sizing: border-box;
  color: black;
  font-size: 18px;
  height: 100%;
  outline: 0;
  padding: 4px 20px 0;
  width: 100%;
}

.cut {
  background-color:transparent;
  border-radius: 10px;
  height: 20px;
  left: 20px;
  position: absolute;
  top: -20px;
  transform: translateY(0);
  transition: transform 200ms;
  width: 100px;
}


.placeholder {
  color: black;
  font-size: 18px;
  font-weight: 700;
  font-family: sans-serif;
  left: 20px;
  line-height: 14px;
  pointer-events: none;
  transform-origin: 0 50%;
  transition: transform 200ms, color 200ms;
  top: 20px;
  margin-left: 10px;
}



.button {
  background-color:  #d51619;
  border-radius: 15px;
  border: 0;
  box-sizing: border-box;
  color: #eee;
  cursor: pointer;
  font-size: 18px;
  height: 35px;
  margin-top: 10px;
  // outline: 0;
  text-align: center;
  width: 20%;
}

.button:active {
  background-color: #06b;
}

.image-container {
  position: relative;
}

.movie-title {
  position: absolute;
  bottom: 0;
  left: 0;
  font-size:25px;
  color: white;
  margin: 10px;
  font-weight: 600;
}

.movie-title span{
	color : white;
	font-size : 5px;
	
}

.ic1 , .ic2, .ic3, .ic4 , .ic5 {
  margin-top: 10px;
}

.image-container {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
}

.image-container img {
  background-size: cover;
  width : 100%;
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
	MovieVO mVo = (MovieVO) request.getAttribute("movieVo");
	List<SeatVO> sVo = (List<SeatVO>) request.getAttribute("seatVo");
	String cName = (String) request.getAttribute("cName");
	String date = (String) request.getAttribute("date");
	String time = (String) request.getAttribute("time");
	String qty = (String) request.getAttribute("qty");
	String tName = (String) request.getAttribute("tName");
	String totalPrice = (String) request.getAttribute("totalPrice");
	String mpNum = (String) request.getAttribute("mpNum");
		
	StringBuilder sb = new StringBuilder();
	for (SeatVO seat : sVo) {
		sb.append(", ");
	    sb.append(seat.getS_nm());
	}
	String sName = sb.toString();
	String rank = "";
	
	switch(mVo.getMr_id()){
	case 1:
		rank = "전체관람가";
		break;
	case 2:
		rank = "12세 이상 관람가";
		break;
	case 3:
		rank = "15세 이상 관람가";
		break;
	case 4:
		rank = "청소년 관람불가";
		break;
	}
%>
  <section id="movie">
  	<div class="container">
  	  <div class="row">
  	    <div class="movie">
  	      <h1>결제</h1>
        <form>

<input type="hidden" name="sh_id" value="">

<div class="image-container" style="height: 200px; overflow:hidden;">
<img src="<%=request.getContextPath() %>/images/<%=mVo.getM_post() %>" alt="MEGAFOX" >
<div class="movie-title"><%=mVo.getM_subject() %><span><%=rank %></span></div>
</div>
      <div class="input-container ic1">
         <label for="id" class="placeholder">상영일</label>
      <input id="id" class="input" type="text" value="<%=date %>" readonly >
</div><hr>

      <div class="input-container ic2">
     <label for="pass" class="placeholder">상영시간</label>
        <input id="pass" name="sh_pw" class="input" type="text" value="<%=time%>~"> 
      </div><hr>


        <div class="input-container ic3">
         <label for="name" class="placeholder">상영관</label>
         <input id="name" name="sh_nm" class="input" type="text" value="<%=cName%> "> 
      </div><hr>
      
            <div class="input-container ic4">
             <label for="bnum" class="placeholder">좌석</label>
            <input id="name" name="sh_nm" class="input" type="text" value="일반 <%=qty %>매 <%=sName %> / <%=tName%>">        
      </div><hr>


      
 <input type="button" class="button" value="결제" onclick="payment()">
 <input type = "button" class="button" value="취소" id="cancel">

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
	<script src="<%=request.getContextPath() %>/js/jquery-3.7.0.min.js"></script>
	<script>
$("#payment").on('click',function(){
		
		payment();
		
	})
	
payment = function(date){
	
	IMP.init('imp30884805');
	IMP.request_pay({		
		pg : 'kakaopay.TC0ONETIME',
		pay_method : 'card',
		merchant_uid : '<%=mpNum%> + new Date().getTime()',   //주문번호
		name : '<%=cName%> <%=mVo.getM_subject()%> <%=qty%>매 (<%=tName%>)',            
		
		amount : <%=totalPrice%>,                    //가격
		//customer_uid : buyer_name + new Date().getTime(),  //해당 파라미터값이 있어야 빌링 키 발급 시도

	},function(rsp){
		if(rsp.success){
			var a = confirm("결제 완료!, 마이페이지로 이동하시겠습니까?");
			if(a){
				var id = "<%=vid%>";
				location.href =`<%=request.getContextPath()%>/showReservationList.do?id=${id}`;
			}else{
				location.href = "<%= request.getContextPath()%>/movieList.do";
			}
        }else{
        	//alert("결제 실패!, 홈으로 이동합니다!");
        	alert("실패 : 코드("+rsp.error_msg+") / 메세지("+rsp.error_msg+")");   
        	location.href = "<%= request.getContextPath()%>/movieList.do"; 
        }
	});
}
$('#cancel').on('click',function(){
		
		var y = confirm('결제를 취소하시겠습니까?')
		if(y){
			location.href = "<%= request.getContextPath()%>/movieList.do";		
		} else{
			return;
		}

	});
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
	
		//예매 버튼 클릭 시
		$('#detail-btn').on('click',function(){
			<%
			if(vid!=null){
			%>
			location.href = "<%=request.getContextPath()%>/cinemaList.do?id=<%=mVo.getM_id()%>&post=<%=mVo.getM_post()%>"
			<%
			} else{
			%>
			alert("로그인 후 이용가능합니다.");
			location.href = "<%=request.getContextPath() %>/view/login/Login.jsp"
			<%
			}
			%>
	
		})
	</script>
</body>
</html>