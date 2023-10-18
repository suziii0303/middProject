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
	alert("�߸��� �α��� �����Դϴ�.");
}	
}

 
 	$(function(){
 		
 		// ����������Ű~~~ �ʸ����� ������ ���̵� ���� ��Ű
		$('#savaId').on('click',function(){
			vsava = $('#savaId').val();
			$('#inputForm').append()
		})	
		
		
		
		 //��й�ȣ Ȯ��
		   $('#pwd2').on('change',function(){
		      pw1 = $('#pwd').val();
		      pw2 = $('#pwd2').val();
		      if(pw1 != null && pw2 != null){
		         if(pw1==pw2){
		            $('#checkPw').html("��й�ȣ�� ��ġ�մϴ�.");
		            $('#checkPw').css({"color":"red", "background" : "yellow"});
		            
		         	}else{
		           		 $('#checkPw').html("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		           		 $('#checkPw').css({"color":"red", "background" : "yellow"});
		         		$('#send').prop('disabled', true);
		         		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.")
		         	}
		     	 }
		      
		      })
		      $('#pwd').on('change',function(){
				   vpw=$('pwd').val();
				   if (!pwd.checkValidity()) {
					    
					     $('#spw').html("��й�ȣ ������ ���� �ʽ��ϴ�.");
					     $('#spw').css({"color":"red", "background" : "yellow"});
					      
				}else{
					$('#spw').hide();
					
				}

		      })
		      
		//���â �ݱ�
	 	function closeModal() {
    		$('#joinModal').modal('hide');
		}

		// ȸ������ ��ư Ŭ���� ���� 
	 	$(document).on('click','#send',function(){
	 	
	 	    
	 	    var uid = $('#uid').val();

	 	    // ������ Ʋ����
	 	    if (!uid.match(/^[A-Za-z0-9]+$/)) {
	 	        alert('���̵� ������ �߸� �Է��Ͽ����ϴ�.');
	 	        return;
	 	    }
	 	    
	 		inClient = $('#jform').serializeJSON();
	 		
	 		$.ajax({
	 			url : '<%=request.getContextPath()%>/insertClient.do',
	 			data : inClient,
	 			type : 'post',
	 			success : function(res){
	 				if(res=="OK"){
	 					alert("���������� ȸ�������� �Ϸ� �Ǿ����ϴ�!");
	 					closeModal();
	 				}else{
	 					alert("���������� ȸ�������� �Ϸ� ���� �ʾҽ��ϴ�. ");
	 				}
		 		
	 				
	 			},
	 			error:function(xhr){
	 				alert("���� : "+ xhr.status);
	 			},
	 			dataType : 'json'
	 		})

	 	})
	 	
	 	
	 	
	 
	 	// ���̵� �ߺ� �˻� �ϴ� ajax
	 	$('#checkid').on('click',function(){
	 	
	 		// �Է��� id�� �����´�.
	 		idvalue = $('#uid').val();
	 		
	 		$.ajax({
	 			url : '<%=request.getContextPath()%>/clientcheckId.do',
	 			data : {"id" : idvalue},
	 			type : 'get',
	 			success:function(res){
	 				if(res.flag=="���Ұ��� id"){
	 					$('#send').prop('disabled', true);
	 					alert("���̵� �ߺ� �˴ϴ�.")
	 				}else{$('#send').prop('disabled', false);}
	 				$('#spid').html(res.flag).css({"color":"red", "background" : "yellow"});
	 			},
	 			error:function(xhr){
	 				alert("���� : "+ xhr.status);
	 			},
	 			dataType : 'json'
	 			})

		 })
		 
		  
			// ��й�ȣ ã�� ��� ���� Ŭ���� �̺�Ʈ 
		 	$(document).on('click','#findBtn',function(){
		 		vid = $('#findId').val();
		 		vEmail = $('#findmail').val();
		 		$.ajax({
		 		url : '<%=request.getContextPath()%>/findPass.do',
	 			data : {"id" : vid , "Email" : vEmail},
	 			type : 'get',
	 			success : function(res){
	 				if(res=="1"){
	 					alert("������ ���������� �߼۵Ǿ����ϴ�")
	 				}else{
	 					alert("������ ���������� �߼۵����ʾѽ��ϴ�")
	 				}
	 			},
	 			error:function(xhr){
	 				alert("���� : "+ xhr.status);
	 			},
	 			dataType : 'json'
	 		})
	 		
		 })
		 
		 // ���̵� ã�� ��� ���� Ŭ���� �̺�Ʈ 
		 	$(document).on('click','#findIdBtn',function(){
		 		vname = $('#findname').val();
		 		vEmail = $('#findmailid').val();
		 		$.ajax({
		 		url : '<%=request.getContextPath()%>/findId.do',
	 			data : {"name" : vname , "Email" : vEmail},
	 			type : 'get',
	 			success : function(res){
	 				if(res=="1"){
	 					alert("������ ���������� �߼۵Ǿ����ϴ�")
	 				}else{
	 					alert("������ ���������� �߼۵����ʾѽ��ϴ�")
	 				}
	 			},
	 			error:function(xhr){
	 				alert("���� : "+ xhr.status);
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
		<a href="<%=request.getContextPath()%>/index.jsp"> <img id ="logo"alt="�ް�����" src="<%=request.getContextPath()%>/images/megafox�ΰ�.png"></a>
	<div id ="logDiv">
	    <form id= "inputForm" action="<%=request.getContextPath()%>/loginAll.do"
			method="post">
			
			<h1 id="login-title">�α���</h1> 
			<select name = "auth">
				<option value="1">������</option> 
				<option value="2">����</option> 
				<option value="3" selected="selected">��</option>
			</select><br><br> 
	        <label for="inputId">ID : </label><input id="inputId" type="text" name="id" value="<%=cookieId%>" placeholder="ID�� �Է��ϼ���"><br><br>
	        <label for="inputPw">PASS : </label><input id="inputPw"type="password" name="pass" placeholder="PassWord�� �Է��ϼ���"><br><br>
	        
	        <input id="savaId" type="checkbox" name="savaId" value="check" <%=cookiecheck%>>���̵� ���� <br><br>
	        
	        
	        <input type="submit" value="�α���" id="loging"> <br><br>
	        <a href="#myIdModal" data-bs-toggle="modal" data-bs-target="#myIdModal" id ="find">���̵� ã�� / </a>
	        <a  href="#myPWModal" data-bs-toggle="modal" data-bs-target="#myPWModal" id ="findPass">��й�ȣ ã��</a><br><br>

	        
	<input type="button" value="ȸ���� �ƴϽŰ���? ���� �����ϼ���!" id ="joinBtn" data-bs-toggle="modal" data-bs-target="#joinModal">
		</form>
	</div>
	</div>


<!-- ȸ������ ���  -->
<div class="modal" id="joinModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
      <a href="<%=request.getContextPath()%>/index.jsp"> <img src="<%=request.getContextPath()%>/images/megafox�ΰ�.png" alt="�ް�����" style="width:150px; height: auto;"></a>
        <h5 class="modal-title">ȸ������</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form name="jfrom" id="jform">
        
        	<div id ="idCheckSpan">
        	<label for="uname" >���̵� :<span id="spid"></span> </label><br>
        	<span style="color :#8c8c8c;">������ ���ڸ� ������ id�� �Է��� �ּ���</span>
        	<input type="button" value="�ߺ��˻�" id="checkid"><br>
           	</div>
   			<input type="text" class="form-control form-control-sm" id="uid" placeholder="userID" name="c_id" pattern="[A-Za-z0-9]+" required><br>
            
            <label for="pwd">��й�ȣ:<span id="spw"></span></label><br>
            <span style="color :#8c8c8c;">������ ���� Ư�� ��ȣ�� ������ password�� �Է��� �ּ���</span>
             <input type="password" class="form-control form-control-sm" id=pwd placeholder="userpass" name="c_pass" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]+$" required><br>
            
            <label for="pwd2">��й�ȣȮ�� :<span id ="checkPw"></span></label>
             <input type="password" class="form-control form-control-sm" id=pwd2 placeholder="userpass" name="" required><br>
             <span id ="checkPw"></span>
     		
            
            <label for="uname">�̸� :</label>
            <input type="text" class="form-control form-control-sm" id="uname"name="c_nm" required><br>
            
             <label for="ubir">�������:</label>
      		<input type="date" class="form-control form-control-sm" id="ubir" name="c_bir"placeholder="1999.04.15"><br>
            
           	<label for="uhp">�޴��� ��ȣ:</label>
            <input type="text" class="form-control form-control-sm" id="uhp" name="c_tel"placeholder="010-1234-5678"><br>
            
            <label for="uemail">�̸���:</label>
            <input type="text" class="form-control form-control-sm" id="uemail" name="c_email"placeholder="abcd123@email.com"><br>
                        
             <label for="uadd">�ּ�:</label>
      		 <input type="text" class="form-control form-control-sm" id="uadd" name="c_add" required><br><br>
      		 
      		<label for="gend">����</label>
      		<input style="color: white;" id="gend" type="radio" name="c_gend" value="��"><span class="gendR">��</span>
			<input style="color: white;" type="radio" name="c_gend" value="��"><span class="gendR">��</span>
      		 

        </form>
      </div    >

      <!-- Modal footer -->
      <div class="modal-footer">
            <button id="send" type="button" >����</button>
    		<span id="joinsp"></span>
      </div>

    </div>
  </div>
</div>

<!-- ���̵�ã�� ���  -->
<div class="modal" id="myIdModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">���̵� ã��</h4>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      <label class="pwla" for="findname">�̸� : </label>
       <input type="text" id="findname" placeholder="�̸��� �Է����ּ���">
      </div>
      
       <div class="modal-body">
        <label class="pwla" for="findmailid">Email : </label>
        <input type="text" id="findmailid" placeholder="email�� �Է����ּ���"><br><br>
        <span id="finPw"></span>
       
        
      </div>

      <!-- Modal footer -->
      <div class="modal-footer" >
        <button id="findIdBtn"type="button" class="btn btn-danger" data-bs-dismiss="modal">����</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>


<!-- ��й�ȣã�� ���  -->
<div class="modal" id="myPWModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">��й�ȣ ã��</h4>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      <label class="pwla" for="findId">ID : </label>
       <input type="text" id="findId" placeholder="���̵� �Է����ּ���">
      </div>
      
       <div class="modal-body">
        <label class="pwla" for="findmail">Email : </label>
        <input type="text" id="findmail" placeholder="email�� �Է����ּ���"><br><br>
        <span id="finPw"></span>
       
        
      </div>

      <!-- Modal footer -->
      <div class="modal-footer" >
        <button id="findBtn"type="button" class="btn btn-danger" data-bs-dismiss="modal">����</button>
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>






</body>
</html>