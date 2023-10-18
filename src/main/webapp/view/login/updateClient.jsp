<%@page import="kr.or.ddit.client.vo.ClientVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>

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

</head>


<style>

<style>

body {
  align-items: center;
  background-color: #000;
  display: flex;
  justify-content: center;
}


form {
margin : 0 auto;
width: 300px;
margin-top : 100px;

}

.title {
  color: #eee;
  font-family: sans-serif;
  font-size: 25px;
  font-weight: 600;
  margin-top: -10px;
  text-align:center;
  margin-bottom: 35px;
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

.ic1 , .ic2, .ic3, .ic4 , .ic5, .ic6, .ic7, .ic8{
  margin-top: 30px;
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
.ic8 {
  background-color: #1C1C1C;
  border-radius: 12px;
  border: 0;
  box-sizing: border-box;
  color: #eee;
  font-size: 15px;
  height: 100%;
  outline: 0;
  padding: 4px 20px 0;
  width: 100%;
}
.cut {
  background-color: #D51619;
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
  margin-top: 20px;
  // outline: 0;
  text-align: center;
  width: 30%;
}

.button:active {
  background-color: #06b;
}


#div2{
height:200px;
}

h1,tr{

color: white;
}

#save{
margin-right : 20px;
}

/*은비 - 푸터 하단고정*/
footer {background:black;
  left: 0;
  bottom: 0;
  width: 100%;
  margin-top: 100px;
}

</style>
<%
String vid = (String) session.getAttribute("id");
String result ="";
if(vid != null){
	result = vid+"님";
}else{
	result = "로그인";
}
ClientVO vo = (ClientVO)request.getAttribute("vo");

request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 

String id = request.getParameter("id");
String name = request.getParameter("name");
String pass = request.getParameter("pass");
String bir = request.getParameter("bir");
String tel = request.getParameter("tel");
String add = request.getParameter("add");
String email = request.getParameter("email");
String gend = request.getParameter("gend");

%>



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

 	
<body>



     
<form action="<%=request.getContextPath()%>/mypageUpdate.do" method="post" >
<div class="title">👨🏻‍💼고객 정보 수정👨🏻‍💼</div>

		
	<div class="input-container ic1">
		<input class="input"id="id"type="text" name ="id" readonly="readonly" value="<%=id%>">
		<div class="cut"></div> 
		<label for="id" class="placeholder">ID</label>
	</div>
	
	<div class="input-container ic2">
		<input class="input"id="pass"type="text" name="pw" value="<%=pass%>">
		<div class="cut"></div>
		<label for="pass" class="placeholder">비밀번호</label>
	</div>
		
		
	<div class="input-container ic3">
		<input class="input"id="name"type="text" name="nm" value="<%=name%>">
	 	<div class="cut"></div>
	 	 <label for="name" class="placeholder">고객이름</label>
      </div>
	 	
	<div class="input-container ic4">
		<input class="input"id="bir"type="text" name="bir" value="<%=bir%>">
		<div class="cut"></div>
		<label for="name" class="placeholder">생년월일</label>
      </div>

	<div class="input-container ic5">
		<input class="input" id="email" type="text" name="email" value="<%=email%>">
	 	<div class="cut"></div>
        <label for="bnum" class="placeholder">E_mail</label>
    </div>
    
    
	<div class="input-container ic6">	
		<input class="input"id="tel"type="text" name="tel" value="<%=tel%>">
	    <div class="cut"></div>
        <label for="tel" class="placeholder">전화번호</label>
    </div>
    
	<div class="input-container ic7">
		<input class="input" id="add"type="text" name="add" value="<%=add%>">
 		<div class="cut"></div>
        <label for="tel" class="placeholder">주소</label>
    </div>
    
      <div class="input-container ic8">
  		<div class="cut"><p>성별</p></div>

  		<input id="gend" name="c_gend" class="radio" type="radio" value="남" <% if (gend.equals("남")) { %> checked
  		<% } %>>
  		<label for="male" class="gender">남</label>
  		<input id="gend" name="c_gend" class="radio" type="radio" value="여" <% if (gend.equals("여")) { %> checked <% } %>>
  		<label for="female" class="gender">여</label> 
	</div>

	
	<input class="button"id="save" type="submit" value="저장"> 
	<input class="button"id="cancel"type="reset" class="cancel" value="취소" onclick="location.href='<%=request.getContextPath()%>/clientInfo.do'"> 

</form>
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