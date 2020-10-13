<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<html>
<head>
<title>kubg</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/user/shop/store_2.css">
<link rel="stylesheet" href="/resources/css/main/header-footer.css">
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
 <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

<script>

$(document)
.ready(
      function() {
         $(".a1").on('click', function(){
            $(".icon p").removeClass('pink');
            $(".i1 p").addClass('pink');
            $(".areacontain")
                  .load("/shop/list?c=101&l=2 .contents");
            });
         $(".a2").on('click', function(){
            $(".icon p").removeClass('pink');
            $(".i2 p").addClass('pink');
            $(".areacontain")
                  .load(
                        "/shop/list?c=102&l=2 .contents");
            });
         $(".a3").on('click', function(){
            $(".icon p").removeClass('pink');
            $(".i3 p").addClass('pink');
            $(".areacontain")
                  .load(
                        "/shop/list?c=103&l=2 .contents");
            });
         $(".a4").on('click', function(){
            $(".icon p").removeClass('pink');
            $(".i4 p").addClass('pink');
            $(".areacontain")
                  .load(
                        "/shop/list?c=104&l=2 .contents");
            });
         $(".a5").on('click', function(){
            $(".icon p").removeClass('pink');
            $(".i5 p").addClass('pink');
            $(".areacontain")
                  .load(
                        "/shop/list?c=105&l=2 .contents");
            });
         $(".a6").on('click', function(){
            $(".icon p").removeClass('pink');
            $(".i6 p").addClass('pink');
            $(".areacontain")
                  .load(
                        "/shop/list?c=106&l=2 .contents");
            });
         $(".a7").on('click', function(){
            $(".icon p").removeClass('pink');
            $(".i7 p").addClass('pink');
            $(".areacontain")
                  .load(
                        "/shop/list?c=107&l=2 .contents");
            });
         $(".a8").on('click', function(){
            $(".icon p").removeClass('pink');
            $(".i8 p").addClass('pink');
            $(".areacontain")
                  .load(
                        "/shop/list?c=108&l=2 .contents");
            });
         $(".a9").on('click', function(){
            $(".icon p").removeClass('pink');
            $(".i9 p").addClass('pink');
            $(".areacontain")
                  .load(
                        "/shop/list?c=109&l=2 .contents");
            });
         
         $(".icon img").click(function(){
            $('.icon img').removeAttr('id','noimeffect');
            $(this).attr('id','noimeffect');
            
             });
         
         $(".icon img").mouseover(function(){
             $(this).removeClass('imeffect');
             }).mouseout(function(){
                $('.icon img').addClass('imeffect');
             });
      });
</script>
<style>
.imeffect {
   filter: blur(0.9px); 
   -webkit-filter:blur(0.9px);
}
#noimeffect{
filter:none;}

</style>
</head>

<body>
  <div class="container-fluid">
    <%@ include file="../include/header2.jsp"%>
  </div>
  
    <!-- 상단 index 9개 -->
    <div class="indexIcon">
      <div class="row">
       <div class="container">
        <div class="col-xs-12 col-sm-4">
          <div class="icon i1">
            <a href="javascript:void(0);" class="a1"><img src="/resources/images/store/weddingHall.jpg"
            alt="드레스" class="img-responsive img-circle imeffect" /></a>
         <p>웨딩홀</p>
          </div>
          <div class="icon i2">
            <a href="javascript:void(0);" class="a2"><img src="/resources/images/store/weddingDress.jpg"
            alt="드레스" class="img-responsive img-circle imeffect"/></a>
         <p>드레스</p>
          </div>
          <div class="icon i3">
            <a href="javascript:void(0);" class="a3"><img src="/resources/images/store/hairNmakeup.jpg"
            alt="메이크업" class="img-responsive img-circle imeffect" /></a>
         <p>메이크업</p>
          </div>
        </div> <!-- /col-sm-4 -->
        <div class="col-xs-12 col-sm-4">
          <div class="icon i4">
            <a href="javascript:void(0);" class="a4"><img src="/resources/images/store/studio.jpg"
                     alt="웨딩홀" class="img-responsive img-circle imeffect" /></a>
         <p>스튜디오</p>
          </div>
          <div class="icon i5">
            <a href="javascript:void(0);" class="a5"><img src="/resources/images/store/snapNdvd.png"
                     alt="스냅/DVD" class="img-responsive img-circle imeffect" /></a>
         <p>스냅/DVD</p>
          </div>
          <div class="icon i6">
            <a href="javascript:void(0);" class="a6"><img src="/resources/images/store/dressSuit.jpg"
                     alt="예복" class="img-responsive img-circle imeffect" /></a>
         <p>예복</p>
          </div>
        </div>  <!-- /col-sm-4 -->
        <div class="col-xs-12 col-sm-4">
          <div class="icon i7">
            <a href="javascript:void(0);" class="a7"><img src="/resources/images/store/hanbok.jpg"
                     alt="한복" class="img-responsive img-circle imeffect" /></a>
                  <p>한복</p>
          </div>
          <div class="icon i8">
            <a href="javascript:void(0);" class="a8"><img src="/resources/images/store/bouquet.jpg"
                     alt="부케" class="img-responsive img-circle imeffect" /></a>
         <p>부케</p>
          </div>
          <div class="icon i9">
            <a href="javascript:void(0);" class="a9"><img src="/resources/images/store/invitation.jpg"
                     alt="청첩장" class="img-responsive img-circle imeffect" /></a>
         <p>청첩장</p>
          </div>
        </div>  <!-- /col-sm-4 -->
       </div> <!-- /container -->
      </div> <!-- /row -->
    </div><!--/indexIcon-->


   <div class="container">
    <!-- 상품검색 -->
    <div class="KategorieSearch">
      <form action="" method="GET">
        <div class="row">
          <div class="col-sm-12">
            <select name="gdsPrice" id="select1">
              <option value="none" disabled selected>금액대</option>
              <option value="0">금액무관</option>
              <option value="1">100만원 이하</option>
              <option value="1000000">100-200만원</option>
              <option value="2000000">200-300만원</option>
              <option value="3000000">300-500만원</option>
            </select>
            <select name="comArea" id="select2">
              <option value="전체">지역전체</option>
              <option value="서울">서울</option>
              <option value="경기">경기</option>
              <option value="인천">인천</option>
              <option value="강원">강원</option>
              <option value="충청">충청</option>
              <option value="전라">전라</option>
              <option value="경상">경상</option>
              <option value="제주">제주</option>
            </select>
            <div class="form-inline" role="search" id="select3">
              <div class="form-group">
                <input type="text" placeholder="결과 내 검색" id="select4"/>
                <button type="submit" class="btn btn-default" href="#" id="select5">
                  <span class="glyphicon glyphicon-search glyphicon-search2"></span></button>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div> <!--KategorieSearch-->
    
   <!-- 상품목록 -->
   <div class="areacontain">
    <div class="contents">
     <c:set var="loop_flag" value="false" />
    
     
          <div class="row">
            <c:forEach items="${list}" var="list" varStatus="status">
            <div class="col-xs-6 col-sm-3">
           <div class="boxContents"> 
             <a href="/shop/view?n=${list.gdsNum}"><img src="${list.gdsThumbImg}"></a>
             <h4>${list.gdsName}</h4>
             <p id="brown">[${list.comArea }]</p>
             <p>${list.comName }</p>
             <h4><fmt:formatNumber pattern="###,###,###" value="${list.gdsPrice}" />원</h4>
            </div>
          </div>
            </c:forEach>
           </div> <!-- row -->
   </div>    <!--contents-->
</div>


    <!-- 페이지네이션 -->
    <div class="indexpagination">
      <div class="row">
          <nav class="paginationSize">
            <ul class="pagination">
              <li>
                <a href="#" aria-label="Previous">
                  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                </a>
              </li>
              <li class="active"><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li>
                <a href="#" aria-label="Next">
                  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                </a>
              </li>
            </ul>
          </nav>
      </div>
    </div> <!--/indexpagination-->
    </div> <!-- /container -->

    <!-- footer -->
  <div class="footer">
    <%@ include file="../include/footer2.jsp"%>
  </div>  <!--/footer-->

  <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <script>
     $(document).ready(function(){
       $(".pagination li").click(function(){
         var menu= $(".pagination li");
         menu.removeClass("active");
         $(this).addClass("active");
       })
     })
</script>
 
</body>
</html>