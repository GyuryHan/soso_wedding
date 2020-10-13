<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "/board/readView?bno=${replyUpdate.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			//댓글 수정 View
			
			  $(".replyUpdateBtn3").click(function() {
		            $.ajax({
		            	type:"post",
		                url : "/board/replyUpdate",
		                data : "html",
		                success : function(result) {
		                	var go = $(this).attr("data-rno");
		                    var e = ""
		                    $(".reple"+go).html(e);
		                }
		            });
		        });
			
		})
		
	</script>
				<form name="updateForm" role="form" method="post" action="/board/replyUpdate" class="mb">
					<input type="hidden" name="bno" value="${replyUpdate.bno}" readonly="readonly"/>
					<input type="hidden" id="rno" name="rno" value="${replyUpdate.rno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 	
					<p class="comment-txt more"><input type="text" id="replycontent"  name="content" value="${replyUpdate.content}" /></p>

						<button type="submit" class="update_btn replyUpdateBtn2">저장</button>
						<button type="button" class="cancel_btn">취소</button>
					
				</form>
