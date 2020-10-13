
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/resources/css/board/write-read.css">

   <!-- 합쳐지고 최소화된 최신 CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="/resources/css/main/header-footer.css">
   <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

  <title> review write </title>
  
 <script type="text/javascript">
   $(document).ready(function() {
      var formObj = $("form[name='writeForm']");
      $(".write_btn").on("click", function() {
         if (fn_valiChk()) {
            return false;
         }
         formObj.attr("action", "/qnaboard/write");
         formObj.attr("method", "post");
         formObj.submit();
      });
      fn_addFile();
   })
   function fn_valiChk() {
      var regForm = $("form[name='writeForm'] .chk").length;
      for (var i = 0; i < regForm; i++) {
         if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null || $(".chk").eq(i).val()=="선택") {
            alert($(".chk").eq(i).attr("title"));
            return true;
         }
      }
   }

   $(document).ready(function(){
      // 취소
      $("#reset").on("click", function(){
         location.href = "/qnaboard/list";
      })
      
   });
   
   document.addEventListener("DOMContentLoaded", function () {

         // 브라우저의 현재 날짜를 받아온다.

         var toDay = new Date();
         document.getElementById("toYmd").value = toDay.yyyymmdd();
       });

       // 현재 날짜값을 yyyy-mm-dd 형식으로 변환해주는 함수
       Date.prototype.yyyymmdd = function () {
         var yyyy = this.getFullYear().toString();
         var mm = (this.getMonth() + 1).toString();
         var dd = this.getDate().toString();
         return yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]);
       }
</script>


</head>

<body>
  <!-- 회원 header -->
  <!-- <div class="container"> -->
    <%@ include file="../include/header2.jsp"%>

    <div class="boardwrap">
      <div class="boardwrap2">
        <h2 id="h2"> Q & A </h2>
        <p> 소소웨딩에게 궁금한 점을 물어봐주세요 친절하게 답변해드리겠습니다 </p>
    </div>
    <form name="writeForm" method="post" action="/qnaboard/write" enctype="multipart/form-data">
      <c:if test="${member.userId != null}">
        <div class="row">
          <div class="col-25">
            <label for="date">날짜</label>
          </div>
          <div class="col-75">
            <!-- <input type="date" id="currentDate" name="date" placeholder="날짜"> -->
            <!--*** <input type="text" id="date"> -->
            <input type="text" id="toYmd" readonly />
          </div>
        </div>

        <div class="row">
          <div class="col-25">
            <label for="name">작성자</label>
          </div>
          <div class="col-75">
            <input type="text" id="writer" name="writer" placeholder="작성자" title="작성자를 입력하세요." value="${member.userId}" readonly="readonly">
          </div>
        </div>

        <div class="row">
          <div class="col-25">
            <label for="categori">말머리</label>
          </div>
          <div class="col-75">
            <select id="header" name="header" class="chk">
              <option value="선택">선택해주세요</option>
              <option value="웨딩홀">웨딩홀</option>
              <option value="드레스">드레스</option>
              <option value="헤어/메이크업">헤어/메이크업</option>
              <option value="스튜디오">스튜디오</option>
              <option value="스냅/DVD">스냅/DVD</option>
              <option value="예복">예복</option>
              <option value="한복">한복</option>
              <option value="부케">부케</option>
              <option value="청첩장">청첩장</option>
              <option value="기타">기타</option>
            </select>
          </div>
        </div>

        <div class="row">
          <div class="col-25">
            <label for="title">제목</label>
          </div>
          <div class="col-75">
            <input type="text" id="title" name="title" placeholder="제목" class="chk">
          </div>
        </div>

        <div class="row">
          <div class="col-25">
            <label for="subject">내용</label>
          </div>
          <div class="col-75">
            <textarea id="content" name="content" placeholder="작성해주세요" style="height:200px" class="chk"></textarea>
          </div>
        </div>


        <div class="row">
          <div class="col-25">
            <label for="title">파일첨부</label>
          </div>
          <div class="col-75">
            <input type="file" id="myfile" name="file_1" placeholder="파일첨부">
            <!-- <input type="submit"> -->
          </div>
        </div>


     <div class="row" id="down-btn">
        <input type="button"  value="등록" class="write_btn" id="sub">

        <input type="button" id="reset" value="취소">
        <!-- 취소버튼 누르면 목록으로 가게 해주세요  -->
      </div>
    </c:if>
      </form>
    </div>
      <!-- 페이지네이션은 기존 폼 써주셔도 됩니다 -->


  <!-- footer -->
  <div class="footer">
    <%@ include file="../include/footer2.jsp"%>
  </div>
  <!--footer-->
</body>

</html>