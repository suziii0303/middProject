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

<!-- 파비콘 -->
<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/megafox_favicon.ico">

<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../js/jquery.serializejson.min.js"></script>

</head>

<script type="text/javascript">
$(function(){
	
	$(".modifymvbutton").on("click",function(){
				
		var form = this.form;
		form.method = "GET";
		form.action = "<%=request.getContextPath()%>/updateMovie.do";
		form.submit();
	});
	
	$("#delete").on("click", function(){
		<%-- var form = this.form;
		form.action = "<%=request.getContextPath()%>/deleteMovie.do";
		form.submit(); --%>
	
		alert("영화 정보가 삭제됩니다.");
	});
	
	$("#cancel").on("click",function(){
		
		history.back();

	});
});
</script>


<style>
#buttons{
margin-right : 300px;
margin-top : 10px;
}

#detail-title{
font-weight : 700;
font-size: 25px;
}
#infobutton{
margin-bottom : 100px;
}
.movie{
margin: 0 auto;
margin-left : 250px;
}

#infodiv,#plotbuttondiv {
  background-color: #1C1C1C;
  border-radius: 12px;
  border: 0;
  box-sizing: border-box;
  color: #eee;
  font-size: 15px;
  height: 100%;
  outline: 0;
  padding: 4px 20px 0;
}

#infodiv{
margin-left : 20px;
width : 450px;
height : 240px;
margin-top : 130px;
}


#plotbuttondiv{
width : 700px;
height : 250px;
}

#movie{
font-size: 15px;
}

#title{
font-size : 30px;
margin-bottom : 15px;
font-weight : 700;
}

#imginfodiv{
display:flex;
}

#movie-detail{
	z-index: 500;
}

#mvdetail-table, #mvplot,.movie h2{
color:white;
}

#detail-img{
 height: 350px;
width: 240px;
margin-top : 20px;
}

.modifymvbutton, .deletemvbutton, #cancel{
  background-color:  #d51619;
  border-radius: 15px;
  border: 0;
  box-sizing: border-box;
  color: #eee;
  cursor: pointer;
  height: 30px;
  margin-top: 20px;
  outline: 0;
  text-align: center;
  width: 80px;
  height : 40px;
   float: right;
   display: block;
  margin: 0 auto;
}



</style>

<body>
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


	<%
	MovieVO movieVo = (MovieVO) request.getAttribute("movieVo");
	String rank = "";
	switch(movieVo.getMr_id()){
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
  	      <h2 id="title">🎬영화 상세정보🎬</h2>
  	      
  	      <div id= imginfodiv>
        <div id="imgdiv">
          <img id="detail-img" src="<%=request.getContextPath()%>/images/<%=movieVo.getM_post() %>" class="detail-image" alt="<%=movieVo.getM_post() %>">
          </div>
         
            <div id="infodiv">
            
          <table id="mvdetail-table">
            <tr>
                <td id="detail-title"><%=movieVo.getM_id()%> / <%=movieVo.getM_subject()%><br><hr></td>
            </tr>
            <tr>
                <td>영화감독 : <%=movieVo.getM_director() %></td>
            </tr>
            <tr>
            	<td>출연 : <%=movieVo.getM_actor() %></td>
            </tr>
            <tr>
                <td>장르 : <%=movieVo.getM_genre() %></td>
            </tr>
            <tr>
            	<td>등급 : <%=rank %></td>
            </tr>
            <tr>
            	<td>개봉 : <%=movieVo.getM_date() %></td>
            </tr>
            <tr>
            	<td>상영시간 : <%=movieVo.getM_runtime() %></td>
            </tr>
            </table>
            </div>
            </div>

       <br>
       <div id= plotbuttondiv style="overflow: auto;">
       <p id="mvplot" style="font-size: 20px; font-weight: 700;">줄거리 :
       <br>
       <p id="mvplot"><%=movieVo.getM_plot() %></p>

         </div>
 <form name="movieForm" id="movieForm" >
 <div id="buttons">
                <input id="modify" class="modifymvbutton" type="button" value="영화수정"
                 onclick="location.href='<%=request.getContextPath()%>/updateMovie.do?m_id=<%= movieVo.getM_id()%>' ">
                <input id="delete" class="deletemvbutton" type="button" value="영화삭제" 
                onclick="alert('영화 정보를 삭제합니다.'); location.href='<%=request.getContextPath()%>/deleteMovie.do?m_id=<%= movieVo.getM_id()%>' ">
                <input id="cancel" type = "reset" value="취소" onclick="history.back();" >
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


	
</body>
</html>