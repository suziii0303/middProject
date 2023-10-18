<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
String vid = (String)session.getAttribute("id");
String auNum = (String)session.getAttribute("auNum");
String result="";
if(vid != null) {
   result = vid + "님";
} else {
   result = "로그인";
}
%>

 qnaListPageServer = function(npage) {
       // 입력받은 검색어 저장
       search = $('#searchQna').val();
       
       $.ajax({
         url : `\${mypath}/QnaList.do`,
         data : {
                "page" : npage,
                "search" : search
                },
         type : 'post',
         success : function(res) {
            
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
                              <th>작성자</th>
                              <th>등록일</th>
                           </tr>
                        </thead>
                        <tbody>`;
            if(res == null) {
               
               code += `<tr><td colspan="4">게시글이 존재하지 않습니다.</td></tr>`;
            
            } else {
               $.each(res.datas, function(i, v) {
                  
                  code += `<tr>
                           <td>\${v.q_num}</td>
                           <td><a href="<%=request.getContextPath() %>/QnaDetail.do?widx=\${v.q_num}&page=\${currentPage}">`;
                           
                           if(v.r_count == 0) {
                              code += `[답변대기]  `;
                           } else {
                              code += `[답변완료]  `;
                           }
                           
                  code += `\${v.q_subject}</a></td>
                           <td>\${v.q_writer}</td>
                           <td>\${v.q_date}</td>
                        </tr>`;
               })
            }
            
            <%
            	if(auNum.equals("3")) {
            %>
	            code += `</table></div>
	                  <form action="<%=request.getContextPath()%>/QnaWrite.do" method="post">
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
            alert("qnaListPageServer: " + xhr.status);
         },
         dataType : 'json'
       })
    }
 
  
 qnaDeleteServer = function() {
   console.log(idx);
   $.ajax({
      url : `\${mypath}/QnaDelete.do`,
      data : {"idx" : idx},
      type : 'get',
      success : function(res) {
         alert(idx + "번 게시글 삭제가 완료되었습니다.");
         
         location.href = `\${mypath}/board/qna.jsp`; 
         
        
      },
      error : function(xhr) {
         alert("qnaDeleteServer: " + xhr.status);
      },
      dataType : 'json'
   })
}
 
 replyListServer = function() {
    
    $.ajax({
       url : `\${mypath}/ReplyList.do`,
       data : {"num" : num},
       type : 'get',
       success : function(res) {
          //alert("성공");
          rcode = "";
          
          $.each(res, function(i, v) {
             cont = v.r_content;
             cont = cont.replace(/\n/g, "<br>");
             //console.log(cont);
             
             rcode += `<div class="be-comment">
                        <div class="be-img-comment">   
                           <img id="commentImg" src="\${mypath}/images/megafox_commentLogo.png" class="be-ava-comment">
                        </div>
                        <div class="be-comment-content">
                           <h3 class="commentName">
                              MegaFox
                           </h3>`;
             <%
             	if(auNum.equals("1")) {
             %>   
             rcode += `<a href='#' idx='\${v.r_num}' id='delBtn'>DELETE</a>`;
             <%
             	}
             %>
             
             rcode += `<span class="be-comment-time">
                              <i class="fa fa-clock-o"></i>
                              \${v.r_date}
                           </span>
                           
                           <p class="be-comment-text">
                           \${cont}
                           </p>
                        </div>
                     </div>`;
                     
             $('.be-comment-block').find('.be-comment').remove();
             $('.be-comment-block').find('#replyList').append(rcode);
          })
       },
       error : function(xhr) {
          alert("replyListServer: " + xhr.status);
       },
       dataType : 'json'
    })
 }
 
  replyDeleteServer = function() {
	 $.ajax({
		 url : `\${mypath}/ReplyDelete.do`,
		 data : {"rnum" : rnum},
		 type : 'get',
		 success : function(res) {
			 alert("댓글을 삭제합니다.");
			 
			 delBtn.parents('.be-comment').remove();
			 replyListServer();
		 },
		 error : function(xhr) {
			 alert("replyDeleteServer: " + xhr.status);
		 },
		 dataType : 'json'
	 })
 }
 

 