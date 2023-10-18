/**
 * 
 */
var	vtime;
var	vvidx;
var	vmidx;
var	vddx ;
var	tdx ;

//지역 선택했을 때 해당 영화관들 가져와서 출력
getCinemaList = function(){
	 $.ajax({
		 url : `${mypath}/getCinemas.do`,
		 data : {"loc" : vidx},
		 type : 'post',
		 success : function(res){
		
			 code = "";
			 $.each(res,function(i,v){
			 	code += "<a class='cinemas' midx='"+ movieId + "' idx='"+v.id+"'>"+v.name + "<br></a>";	 
			 })
			 $('#cinemabyloc').html(code);
			 $('#screeningdate').empty();
			 $('#screeningtheater').empty();
			 $('#screeningtime').empty();
			 $('#showCinema').empty();
			 $('#showDate').empty();
			 $('#showTheater').empty();
			 $('#showTime').empty();
			 
			
		 },
		 error : function(xhr){
			 alert(xhr.status);
		 },
		 dataType : 'json'
	 })
	 
 }
//출력된 해당 영화관들 중 하나를 클릭할 때 그 영화관 id와 영화 id 값으로 상영 일정 출력 보낼 데이터 m_id, cn_id
$(document).on('click','.cinemas',function(){
	vcname = $(this).text();
	
	vvidx = $(this).attr('idx'); 	// megabox대전점 클릭시 해당 대전점의 id값
	vmidx = $(this).attr('midx');	// 선택된 영화 id값
	 $.ajax({
		 url : `${mypath}/bookingList.do`,
		 data : {"mid" : vmidx, "cid" : vvidx},
		 type : 'post',
		 success : function(res){
			console.log(res[0].flag);
			code = "";
         if(res[0].flag!=0 ){
            $.each(res,function(i,v){
               code += "<a class='dates' idx='"+vvidx+"' midx='"+vmidx+"' ddx='"+v.date+"'>"+v.date+"<br></a>";
                $('#screeningtheater').html("");
               $('#screeningtime').html("");
               $('#showCinema').html("영화관 : "+ vcname);
            })
         } else{
               code += "<a class='nodates' ddx='0' disabled>상영일정이<br> 없습니다.<br></a>";
               $('#screeningtheater').html(code);
               $('#screeningtime').html(code);
         }
         $('#screeningdate').html(code);
         
         
		 },
		 error : function(xhr){
			 alert(xhr.statux)
		 },
		 dataType : 'json'
	 })
})

// 출력된 날짜들 중 하나를 클릭할 때 그 영화를 상영하는 상영관들 출력
$(document).on('click','.dates',function(){
	vdname = $(this).text();
	vvidx = $(this).attr('idx'); 	// megabox대전점 클릭시 해당 대전점의 id값
	vmidx = $(this).attr('midx');	// 선택된 영화 id값
	vddx = $(this).attr('ddx');		// 선택된 영화 날짜
	$.ajax({
		url : `${mypath}/bookedTheaterList.do`,
		data : {"mid" : vmidx, "cid" : vvidx, "did" : vddx},
		type : 'post',
		success : function(res){
			code = "";
			$.each(res,function(i,v){
				code +=  "<a class='theaters' idx='"+vvidx+"' midx='"+vmidx+"' ddx='"+vddx+"' tdx='"+v.id+"'>"+v.name+"<br></a>";
			})
			$('#screeningtheater').html(code);
			 $('#showDate').html("상영일자 : " + vdname);
		},
		error : function(xhr){
			alert(xhr.status);
		},
		dataType : 'json'
	})
})
	
// 상영관을 클릭할 때 해당 상영관에 해당하는 영화 상영시간들을 출력
$(document).on('click','.theaters',function(){
	vtname = $(this).text();
	vvidx = $(this).attr('idx'); 	// megabox대전점 클릭시 해당 대전점의 id값
	vmidx = $(this).attr('midx');	// 선택된 영화 id값
	vddx = $(this).attr('ddx');		// 선택된 영화 날짜
	tdx = $(this).attr('tdx');		//선택한 상영관id값
	$.ajax({
		url : `${mypath}/bookedTimeList.do`,
		data : {"mid" : vmidx, "cid" : vvidx, "did" : vddx, "tid" : tdx},
		type : 'post',
		success : function(res){
			code = "";
			$.each(res,function(i,v){
				code += "<a class='times' time='"+v.time+"' idx='"+vvidx+"' midx='"+vmidx+"' ddx='"+vddx+"' tdx='"+tdx+"'>"+v.time+"</a><br>";
			})
			$('#screeningtime').html(code);
			$('#showTheater').html("상영관 : " + vtname);
		},
		error : function(xhr){
			alert(xhr.status);
		},
		dataType : 'json'
	})
})

// 상영 시간 클릭 시
$(document).on('click','.times',function(){
	vtime = $(this).text();
	vvidx = $(this).attr('idx'); 	// megabox대전점 클릭시 해당 대전점의 id값
	vmidx = $(this).attr('midx');	// 선택된 영화 id값
	vddx = $(this).attr('ddx');		// 선택된 영화 날짜
	tdx = $(this).attr('tdx');		//선택한 상영관id값
	$('#showTime').html("상영시간 : " + vtime);
	
	
})

//좌석들 보여주는 메서드
selectSeat = function(){
	var a = $('#showCinema').text().trim();
	var b = $('#showDate').text().trim();
	var c = $('#showTheater').text().trim();
	var d = $('#showTime').text().trim();
	var cnid = vvidx;								//해당 영화관(대전점)의 id값 c_id
	var mid = vmidx;								// 선택된 영화 m_id값
	var tdate = vddx;								// 선택된 영화 날짜 t_date
	var thid = tdx;									// 선택한 상영관 th_id값
	var time = vtime;  								// 선택한 상영 시간
	
	if(a==""||b==""||c==""||d==""){
		alert('영화를 선택하세요');
		return;
	}else{
		location.href = `${mypath}/seatList.do?tid=${thid}&cid=${cnid}&mid=${mid}&date=${tdate}&time=${time}`;
	}
}



insertReservation = function(){
	var vsid = $('.buttonBox input').val();
	var vtid = $("#showSelectedSeat li button").attr('tid');
	var vpost =  $('ul li.theaterInfo:nth-child(2) span').text();
	var vtdate = $('ul li.theaterInfo:nth-child(3) span').text();
	var vttime = $('ul li.theaterInfo:nth-child(4) span').text();
	var mid = $('#moviename span').text();
	var vid = $('.clearfix2 li:first-child a').text().slice(0, -1);
	
	location.href = `${mypath}/reservation.do?sid=${vsid}&tid=${vtid}&post=${vpost}&date=${vtdate}&time=${vttime}&mid=${mid}&vid=${vid}`;
	

}

	


