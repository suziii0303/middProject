<%@page import="kr.or.ddit.client.vo.ClientVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/megafox_favicon.ico">
 <script SRC="<%=request.getContextPath()%>/js/jquery.serializejson.min.js"></script>

<%
String check = (String) request.getAttribute("check");
String cookieId ="";
String cookiecheck = "";

Cookie[] cookieArr = request.getCookies();

for(Cookie cookie : cookieArr){
	if("cookieId".equals(cookie.getName())){
		cookieId = cookie.getValue();
		cookiecheck ="checked";
	}
}

%>

<script>
chk = <%= check %>;
window.onload =function(){
if(chk=="0" ){
	alert("잘못된 로그인 정보입니다.");
}	
}

 
 	$(function(){
 		
 		// 내가만든쿠키~~~ 너를위해 구웠지 아이디 저장 쿠키
		$('#savaId').on('click',function(){
			vsava = $('#savaId').val();
			$('#inputForm').append()
		})	
		
		
		
		 //비밀번호 확인
		   $('#pwd2').on('change',function(){
		      pw1 = $('#pwd').val();
		      pw2 = $('#pwd2').val();
		      if(pw1 != null && pw2 != null){
		         if(pw1==pw2){
		            $('#checkPw').html("비밀번호가 일치합니다.");
		            $('#checkPw').css({"color":"red", "background" : "yellow"});
		            
		         	}else{
		           		 $('#checkPw').html("비밀번호가 일치하지 않습니다.");
		           		 $('#checkPw').css({"color":"red", "background" : "yellow"});
		         		$('#send').prop('disabled', true);
		         		alert("비밀번호가 일치하지 않습니다.")
		         	}
		     	 }
		      
		      })
		      $('#pwd').on('change',function(){
				   vpw=$('pwd').val();
				   if (!pwd.checkValidity()) {
					    
					     $('#spw').html("비밀번호 형식이 맞지 않습니다.");
					     $('#spw').css({"color":"red", "background" : "yellow"});
					      
				}else{
					$('#spw').hide();
					
				}

		      })
		      
		//모달창 닫기
	 	function closeModal() {
    		$('#joinModal').modal('hide');
		}

		// 회원가입 버튼 클릭시 전송 
	 	$(document).on('click','#send',function(){
	 	
	 	    
	 	    var uid = $('#uid').val();

	 	    // 형식이 틀릴때
	 	    if (!uid.match(/^[A-Za-z0-9]+$/)) {
	 	        alert('아이디 형식을 잘못 입력하였습니다.');
	 	        return;
	 	    }
	 	    
	 		inClient = $('#jform').serializeJSON();
	 		
	 		$.ajax({
	 			url : '<%=request.getContextPath()%>/insertClient.do',
	 			data : inClient,
	 			type : 'post',
	 			success : function(res){
	 				if(res=="OK"){
	 					alert("정상적으로 회원가입이 완료 되었습니다!");
	 					closeModal();
	 				}else{
	 					alert("정상적으로 회원가입이 완료 되지 않았습니다. ");
	 				}
		 		
	 				
	 			},
	 			error:function(xhr){
	 				alert("상태 : "+ xhr.status);
	 			},
	 			dataType : 'json'
	 		})

	 	})
	 	
	 	
	 	
	 
	 	// 아이디 중복 검사 하는 ajax
	 	$('#checkid').on('click',function(){
	 	
	 		// 입력한 id를 가져온다.
	 		idvalue = $('#uid').val();
	 		
	 		$.ajax({
	 			url : '<%=request.getContextPath()%>/clientcheckId.do',
	 			data : {"id" : idvalue},
	 			type : 'get',
	 			success:function(res){
	 				if(res.flag=="사용불가능 id"){
	 					$('#send').prop('disabled', true);
	 					alert("아이디가 중복 됩니다.")
	 				}else{$('#send').prop('disabled', false);}
	 				$('#spid').html(res.flag).css({"color":"red", "background" : "yellow"});
	 			},
	 			error:function(xhr){
	 				alert("상태 : "+ xhr.status);
	 			},
	 			dataType : 'json'
	 			})

		 })
		 
		  
			// 비밀번호 찾기 모달 전송 클릭시 이벤트 
		 	$(document).on('click','#findBtn',function(){
		 		vid = $('#findId').val();
		 		vEmail = $('#findmail').val();
		 		$.ajax({
		 		url : '<%=request.getContextPath()%>/findPass.do',
	 			data : {"id" : vid , "Email" : vEmail},
	 			type : 'get',
	 			success : function(res){
	 				if(res=="1"){
	 					alert("메일이 성공적으로 발송되었습니다")
	 				}else{
	 					alert("메일이 정상적으로 발송되지않앗습니다")
	 				}
	 			},
	 			error:function(xhr){
	 				alert("상태 : "+ xhr.status);
	 			},
	 			dataType : 'json'
	 		})
	 		
		 })
		 
		 // 아이디 찾기 모달 전송 클릭시 이벤트 
		 	$(document).on('click','#findIdBtn',function(){
		 		vname = $('#findname').val();
		 		vEmail = $('#findmailid').val();
		 		$.ajax({
		 		url : '<%=request.getContextPath()%>/findId.do',
	 			data : {"name" : vname , "Email" : vEmail},
	 			type : 'get',
	 			success : function(res){
	 				if(res=="1"){
	 					alert("메일이 성공적으로 발송되었습니다")
	 				}else{
	 					alert("메일이 정상적으로 발송되지않앗습니다")
	 				}
	 			},
	 			error:function(xhr){
	 				alert("상태 : "+ xhr.status);
	 			},
	 			dataType : 'json'
	 		})
	 		
		 })
		 	

 	})

	
	
</script>
<style>
#main{
	display: inline-block;
	text-align: center;
	color : white;
	width : 100%;
	margin-top: 200px;
	
}

#logDiv{
	text-align: center;
	background : black;
	width : 300px;
	height: 400px;
	margin: auto;
	padding : 10px;
}
#logDiv label{
	width : 60px;
}

#logo {
	width: 300px;
	height: auto;
}
#loging, #send {
	width : 100px;
	height : 50px;
	border-radius : 20px;
	background:  #d51619;
	color : white;
	font-size : 1.0rem;
	
}
#joinBtn{
background: none;
border : none;
color : white;
}
#login-title{
	display: inline;
}
a{
	color:white;
}
a:visited{
	color:white;
}

.modal-title{
color :  #d51619;
margin-left: 10px;
font-size: 1.5rem;
font-weight: bold;
}
.modal-content{
background-color : black;
width : 100%;
/* opacity: 0.8; */
}
input {
background : blick;
}

label{
    color: white;
}
#idCheckSpan{

margin-bottom:13px; 
}

#checkid{

float: right;
height: 30px;
border-radius : 20px;
background:  #d51619;
color : white;
}

#myPWModal , #myIdModal{
margin-top: 20%; 
}
.pwla{
width: 50px;
}
.gendR{
color : white;
}

</style>
</head>
<body style="background: black;">


	<div id ="main">
		<a href="<%=request.getContextPath()%>/index.jsp"> <img id ="logo"alt="메가폭스" src="<%=request.getContextPath()%>/images/megafox로고.png"></a>
	<div id ="logDiv">
	    <form id= "inputForm" action="<%=request.getContextPath()%>/loginAll.do"
			method="post">
			
			<h1 id="login-title">로그인</h1> 
			<select name = "auth">
				<option value="1">관리자</option> 
				<option value="2">점주</option> 
				<option value="3" selected="selected">고객</option>
			</select><br><br> 
	        <label for="inputId">ID : </label><input id="inputId" type="text" name="id" value="<%=cookieId%>" placeholder="ID를 입력하세요"><br><br>
	        <label for="inputPw">PASS : </label><input id="inputPw"type="password" name="pass" placeholder="PassWord를 입력하세요"><br><br>
	        
	        <input id="savaId" type="checkbox" name="savaId" value="check" <%=cookiecheck%>>아이디 저장 <br><br>
	        
	        
	        <input type="submit" value="로그인" id="loging"> <br><br>
	        <a href="#myIdModal" data-bs-toggle="modal" data-bs-target="#myIdModal" id ="find">아이디 찾기 / </a>
	        <a  href="#myPWModal" data-bs-toggle="modal" data-bs-target="#myPWModal" id ="findPass">비밀번호 찾기</a><br><br>

	        
	<input type="button" value="회원이 아니신가요? 지금 가입하세요!" id ="joinBtn" data-bs-toggle="modal" data-bs-target="#joinModal">
		</form>
	</div>
	</div>


<!-- 회원가입 모달  -->
<div class="modal" id="joinModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
      <a href="<%=request.getContextPath()%>/index.jsp"> <img src="<%=request.getContextPath()%>/images/megafox로고.png" alt="메가폭스" style="width:150px; height: auto;"></a>
        <h5 class="modal-title">회원가입</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form name="jfrom" id="jform">
        
        	<div id ="idCheckSpan">
        	<label for="uname" >아이디 :<span id="spid"></span> </label><br>
        	<span style="color :#8c8c8c;">영문과 숫자를 포함해 id를 입력해 주세요</span>
        	<input type="button" value="중복검사" id="checkid"><br>
           	</div>
   			<input type="text" class="form-control form-control-sm" id="uid" placeholder="userID" name="c_id" pattern="[A-Za-z0-9]+" required><br>
            
            <label for="pwd">비밀번호:<span id="spw"></span></label><br>
            <span style="color :#8c8c8c;">영문과 숫자 특수 기호를 포함해 password를 입력해 주세요</span>
             <input type="password" class="form-control form-control-sm" id=pwd placeholder="userpass" name="c_pass" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]+$" required><br>
            
            <label for="pwd2">비밀번호확인 :<span id ="checkPw"></span></label>
             <input type="password" class="form-control form-control-sm" id=pwd2 placeholder="userpass" name="" required><br>
             <span id ="checkPw"></span>
     		
            
            <label for="uname">이름 :</label>
            <input type="text" class="form-control form-control-sm" id="uname"name="c_nm" required><br>
            
             <label for="ubir">생년월일:</label>
      		<input type="date" class="form-control form-control-sm" id="ubir" name="c_bir"placeholder="1999.04.15"><br>
            
           	<label for="uhp">휴대폰 번호:</label>
            <input type="text" class="form-control form-control-sm" id="uhp" name="c_tel"placeholder="010-1234-5678"><br>
            
            <label for="uemail">이메일:</label>
            <input type="text" class="form-control form-control-sm" id="uemail" name="c_email"placeholder="abcd123@email.com"><br>
                        
             <label for="uadd">주소:</label>
      		 <input type="text" class="form-control form-control-sm" id="uadd" name="c_add" required><br><br>
      		 
      		<label for="gend">성별</label>
      		<input style="color: white;" id="gend" type="radio" name="c_gend" value="남"><span class="gendR">남</span>
			<input style="color: white;" type="radio" name="c_gend" value="여"><span class="gendR">여</span>
      		 

        </form>
      </div    >

      <!-- Modal footer -->
      <div class="modal-footer">
            <button id="send" type="button" >전송</button>
    		<span id="joinsp"></span>
      </div>

    </div>
  </div>
</div>

<!-- 아이디찾기 모달  -->
<div class="modal" id="myIdModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">아이디 찾기</h4>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      <label class="pwla" for="findname">이름 : </label>
       <input type="text" id="findname" placeholder="이름을 입력해주세요">
      </div>
      
       <div class="modal-body">
        <label class="pwla" for="findmailid">Email : </label>
        <input type="text" id="findmailid" placeholder="email를 입력해주세요"><br><br>
        <span id="finPw"></span>
       
        
      </div>

      <!-- Modal footer -->
      <div class="modal-footer" >
        <button id="findIdBtn"type="button" class="btn btn-danger" data-bs-dismiss="modal">전송</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>


<!-- 비밀번호찾기 모달  -->
<div class="modal" id="myPWModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">비밀번호 찾기</h4>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      <label class="pwla" for="findId">ID : </label>
       <input type="text" id="findId" placeholder="아이디를 입력해주세요">
      </div>
      
       <div class="modal-body">
        <label class="pwla" for="findmail">Email : </label>
        <input type="text" id="findmail" placeholder="email를 입력해주세요"><br><br>
        <span id="finPw"></span>
       
        
      </div>

      <!-- Modal footer -->
      <div class="modal-footer" >
        <button id="findBtn"type="button" class="btn btn-danger" data-bs-dismiss="modal">전송</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>






</body>
</html>