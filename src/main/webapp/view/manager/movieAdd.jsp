<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.movie.vo.MovieVO"%>

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

<!-- 파비콘 -->
<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/megafox_favicon.ico">

<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">


<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.7.0.min.js">
</script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../js/jquery.serializejson.min.js"></script>


<script type="text/javascript">

//전송버튼 클릭 이벤트
$('#save').on('click', function(){
   
   // 입력한 모든 값을 가져온다.      
   idvalue = $('#id').val();
   mridvalue = $('#mrid').val();
   filevalue = $('#ex_file').val();
   plotvalue = $('#plot').val();   
   directorvalue = $('#director').val();
   datevalue = $('#date').val();
   genrevalue = $('#genre').val();
   runtimevalue = $('#runtime').val();
   actorvalue = $('#actor').val();

   
   console.log(idvalue, passvalue, namevalue, bnumvalue, telvalue);
   
   fdata = {
         "m_id" : idvalue,
         "mr_pw"  : mridvalue,
         "m_post"  : filevalue,
         "m_plot"  : plotvalue,
         "m_director"  : directorvalue,    
         "m_date"  : datevalue,    
         "m_genre"  : genrevalue,    
         "m_runtime"  : runtimevalue,    
         "m_actor"  : actorvalue  
   }
   
   console.log(fdata);

   
   $.ajax({
      url : '<%=request.getContextPath()%>/insertMovie.do',
      data : fdata,
      type : 'post',
      success : function(res){
                 alert("res.flag" ); 
      },
       error : function(xhr){
          alert("상태 : " + xhr.status);
       },
       dataType : 'json'      
   }) //ajax
   
}) // click 이벤트

$(function(){
	$("#cancel").on("click",function(){
		
		history.back();

	});
	
	 $(document).ready(function() {
		    $('#date').datepicker();
		  });
});



function autoResize(textarea) {
	  textarea.style.height = 'auto';
	  textarea.style.height = textarea.scrollHeight + 'px';
	}

</script>
</head>


<style>

#title{
font-size : 30px;
margin-bottom : 15px;
font-weight : 700;
}

#plot, #actor {
height : 145px;
}

#bigdiv{
  display: flex;
}

#leftdiv, #rightdiv{
margin:10px;
}

body {
  align-items: center;
  background-color: #000;
  display: flex;
  justify-content: center;
}


form {
margin : 0 auto;
margin-top : 100px;
}

.title {
  color: #eee;
  font-family: sans-serif;
  font-size: 35px;
  font-weight: 600;
  margin-top: -10px;
  text-align:center;
}

.subtitle {
  color: #eee;
  font-family: sans-serif;
  font-size: 16px;
  font-weight: 600;
  margin-top: 10px;
}

.input-container {
  height: 50px;
  position: relative;
  width: 100%;
}

.ic1 , .ic2, .ic3, .ic4 , .ic5 {
  margin-top: 30px;
  width: 440px;
  height : 50px;
}


.input {
  background-color: #1C1C1C;
  border-radius: 12px;
  border: 0;
  box-sizing: border-box;
  color: #eee;
  font-size: 18px;
  height: 100%;
  outline: 0;
  padding: 4px 20px 0;
  width: 100%;
}

.cut {
  background-color: #d51619;
  border-radius: 10px;
  height: 20px;
  left: 20px;
  position: absolute;
  top: -20px;
  transform: translateY(0);
  transition: transform 200ms;
  width: 100px;
}

.input:focus ~ .cut,
.input:not(:placeholder-shown) ~ .cut {
  transform: translateY(8px);
}

.placeholder {
  color: #65657b;
  font-family: sans-serif;
  left: 20px;
  line-height: 14px;
  pointer-events: none;
  position: absolute;
  transform-origin: 0 50%;
  transition: transform 200ms, color 200ms;
  top: 20px;
}

.input:focus ~ .placeholder,
.input:not(:placeholder-shown) ~ .placeholder {
  transform: translateY(-30px) translateX(10px) scale(0.75);
}

.input:not(:placeholder-shown) ~ .placeholder {
  color: #808097;
}

.input:focus ~ .placeholder {
  color: white;
  font-size: 23px;
  font-weight: 500;
}

.button {
  background-color:  #d51619;
  border-radius: 15px;
  border: 0;
  box-sizing: border-box;
  color: #eee;
  cursor: pointer;
  font-size: 18px;
  height: 50px;
  // outline: 0;
  text-align: center;
  width: 100px;
  margin-left : 10px;
  float : right;
}

.button:active {
  background-color: #06b;
}


#div2{
height:200px;
}

#div3{
height:100px;
}

h1,tr{

color: white;
}

/*은비 - 푸터 하단고정*/
footer {
background:black;
  position: absolute;
  left: 0;
  bottom: 0;
  width: 100%;
}

.footer_infor {
   padding: 0 !important;
}



</style>


<header id="header">
		<div class="container">
			<div class="row">
				<div class="header clearfix">
					<h1>
					<a href="<%=request.getContextPath() %>/clientList.do"> 
						<em>
						<img src="<%=request.getContextPath() %>/images/megafox로고.png" alt="MEGAFOX">
						</em> 
						</a>
					</h1>
					
					<nav class="nav">
					<div id="div1">
						</div>
						<ul class="clearfix1">
					      	<li><a href="<%=request.getContextPath() %>/clientList.do">고객관리</a></li>
							<li><a href="<%=request.getContextPath() %>/shopperList.do">점주관리</a></li>
							<li><a href="<%=request.getContextPath() %>/mngMovieList.do">영화관리</a></li>
							<li><a href="<%=request.getContextPath() %>/board/notice.jsp">게시판관리</a></li>
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

 	
<body>



<section id="movie">     
<form action="<%=request.getContextPath()%>/insertMovie.do" method="post" >
<div class="title">🎬‍영화 정보 추가🎬</div>


<div id = "bigdiv" >

<div id= "leftdiv">
      <div class="input-container ic1">
      <input id="id" name="m_id" class="input" type="text" >
<div class="cut"></div>    
      <label for="id" class="placeholder">영화ID</label>
</div>

      <div class="input-container ic2">
        <input id="mrid" name="mr_id" class="input" type="text"> 
        <div class="cut"></div>
        <label for="mrid" class="placeholder">연령등급</label>
      </div>

        <div class="input-container ic3">
        <input id="subject" name="m_subject" class="input" type="text" > 
        <div class="cut"></div>
        <label for="subject" class="placeholder">영화제목</label>
      </div>
      
            <div id = "filebox" class="input-container ic4">
        <input id="ex_file" name="m_post" class="input" type="file" >
        <div class="cut"></div>
        <label for="post" class="placeholder">영화포스터</label>
      </div>
     
       <div class="input-container ic5">
         <textarea id="plot" name="m_plot" class="input"></textarea>
        <div class="cut"></div>
        <label for="plot" class="placeholder">영화줄거리</label>
      </div>
 </div>     
 
 
   
   <div id= "rightdiv">   
       <div class="input-container ic5">
        <input id="director" name="m_director"  class="input" type="text" >
        <div class="cut"></div>
        <label for="director" class="placeholder">감독</label>
      </div>
      
             <div class="input-container ic5">
        <input id="date" name="m_date"  class="input" type="date" >
        <div class="cut"></div>
        <label for="date" class="placeholder">개봉날짜</label>
      </div>

      
             <div class="input-container ic5">
        <input id="genre" name="m_genre"  class="input" type="text">
        <div class="cut"></div>
        <label for="genre" class="placeholder">장르</label>
      </div>
      
      
       <div class="input-container ic5">
        <input id="runtime" name="m_runtime"  class="input" type="text">
        <div class="cut"></div>
        <label for="runtime" class="placeholder">상영시간</label>
      </div>
          
             <div class="input-container ic5">
        <textarea id="actor" name="m_actor"  class="input"></textarea>
        <div class="cut"></div>
        <label for="actor" class="placeholder">출연진</label>
      </div>
  </div> 
  </div>   
      <div id="div3">
      </div>
 <input type="submit" class="button" value="저장" id="save"><input type = "reset" class="button" value="취소" id="cancel">
 

</form>
 	
</section> 
</body>
    
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
</body>
</html>