<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String vid = (String) session.getAttribute("id");
String auNum = (String) session.getAttribute("auNum");
String result ="";
if(vid != null){
	result = vid+"님";
}else{
	result = "로그인";
}
%>

/**
 * 
 */

noticeDeleteServer = function() {
	
	$.ajax({
		url : `\${mypath}/NoticeDelete.do`,
		data : {"idx" : idx},
		type : 'get',
		success : function(res) {
			alert(idx + "번 게시글 삭제가 완료되었습니다.");
			
			// 게시판 목록으로 이동해야 함!
			location.href = `\${mypath}/board/notice.jsp`;
			
//			currentPage = 1;
//			listPageServer(currentPage);
		},
		error : function(xhr) {
			alert("noticeDeleteServer: " + xhr.status);
		},
		dataType : 'json'
	})
}

noticeListPageServer = function(npage) {
	
	// 입력받은 검색어 저장
	search = $('#searchNotice').val();
	//alert("search : " + search);
	
	//if(search!=null) search = search.trim();
	
	$.ajax({
		url : `\${mypath}/NoticeList.do`,
		data : {
			"page" : npage,
			"search" : search
		},
		type : 'post',
		success : function(res) {
			//alert(res.flag);
			
			code = "";
			code += `<div id="centerdiv" class="container mt-3">`;
			
			if(search.trim()=="") {
				code += `<p>총 \${res.count}건의 게시글이 조회되었습니다.</p><br>`;
			} else {
				code += `<p>총 \${res.datas.length}건의 게시글이 조회되었습니다.</p><br>`;
			}
			
			code += `<table class="table">
						<thead>
							<tr class="bg-light">
								<th>번호</th>
								<th>제목</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>`;
							
			if(res==null) {
				
				code += `<tr><td colspan="4">게시글이 존재하지 않습니다.</td></tr>`;
			
			} else {
				$.each(res.datas, function(i, v) {
					
					code += `<tr>
								<td>\${v.no_num}</td>
								<td><a idx="\${v.no_hit}" href="\${mypath}/NoticeDetail.do?widx=\${v.no_num}">\${v.no_subject}</a></td>
								<td>\${v.no_date}</td>
								<td><span class="hit">\${v.no_hit}</span></td>
							</tr>`;
				})
			}
			
			code += `</table></div>`;
			
 			<%
 				if(auNum.equals("1")) {
 			%>
				code += `<form action="\${mypath}/NoticeWrite.do" method="post">
							<div id="writediv" class="container mt-3">
								<button style="z-index: 5000; position: relative;" id="writebtn" type="button" class="btn btn-dark">글쓰기</button>
							</div>
						</form> `;
			
 			<% 
 				}
 			%>
			
			$('#boardTable').html(code);	
			
			
			// 페이지 처리
			pager = "";
			
			// 이전 페이지
			pager += `<div class="container mt-3">
							<ul class="pagination">`;
			if(res.sp > 1) {
				pager += `<li class="page-item"><a class="page-link" href="#">Previous</a></li>`; 
			}
			
			// 페이지 번호
			for(i=res.sp; i<=res.ep; i++) {
				if(i==currentPage) {
					pager += `<li class="page-item active"><a class="page-link pageno" href="#">\${i}</a></li>`;
				} else {
					pager += `<li class="page-item"><a class="page-link pageno" href="#">\${i}</a></li>`;
				}
			}
			
			// 다음 페이지
			if(res.ep < res.tp) {
				pager += `<li class="page-item"><a class="page-link" href="#">Next</a></li>`;
			}
		
			pager += `</ul>
					</div>`;
			
			//console.log(pager);
			
			$('#pageList').html(pager);
		},
		error : function(xhr) {
			alert("listPageServer: " + xhr.status);
		},
		dataType : 'json'
	})
}



