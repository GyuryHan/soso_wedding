<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


    <div class="row">
      <div class="col-sm-12 marginSm">
        <nav class="navbar navbar-default navbar-fixed-top">
          <div class="container">
            <!-- mobile -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                data-target="#bs-example-navbar-collapse-1">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
               <a href="/"><img src="/resources/images/main/logo.png"></a>
            </div>
            
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                 <ul class="nav navbar-nav">      
                   <li class="firstNav"><a href="/shop/list?c=101&l=2">상점</a></li>
                   <li><a href="/estimate/estimate">견적</a></li>
                   <li><a href="/reviewboard/list">후기</a></li>
                   <li><a href="/board/comunity">커뮤니티</a></li>
                   <li><a href="/notice/notice">회사소개</a></li>
                 </ul>      
                <form class="navbar-form navbar-right">
                  <a class="btn btn-default btn-lg headerSearch1" role="button">
                    <span class="glyphicon glyphicon-search"></span></a>
                      <c:if test="${member.userId != null}">
                       <a class="btn btn-default btn-lg headerSearch1" href="/shop/cartList" role="button">
                         <span class="glyphicon glyphicon-shopping-cart"></span>
                        </a>
                      </c:if>
                      <c:if test="${member.userId==null }">  
                         <a href="/member/signin" class="login">로그인</a>
                         <a href="/member/register" class="login">회원가입</a>
                      </c:if>
                      
                      <c:if test="${member != null}">
                           <a href="/member/signout" class="login">로그아웃</a>
                         <c:if test="${member.verify == 9}">
                             <a href="/admin2/index" class="login">마이페이지</a>
                          </c:if>
                          <c:if test="${member.verify == 0}">
                            <a href="/company/goods/register2" class="login">마이페이지</a>
                          </c:if>
                          <c:if test="${member.verify == 1}">
                           <a href="/shop/orderList" class="login">마이페이지</a>
                        </c:if>
                     </c:if>
                </form>
             </div> <!-- /collapse navbar-collapse -->
          </div> <!-- /container -->
        </nav> 
      </div> <!-- /col-sm-12 -->
    </div> <!-- /row -->
    
   <div class="row">
     <div class="fullSearch">
       <form role="search" action="/mainsearch/totalsearch" method="post">
         <div class="search_wrap">
            <input type="text" id="topSearch" name="keyword" placeholder="검색어를 입력해 주세요">
             <button class="btn button btn-default btn-lg topSearchBtn" role="button">
               <span class="glyphicon glyphicon-search" aria-hidden="true" id="topSearchIcon"></span> 
            </button>
            <span class="closeBtn">
              <button type="button" class="btn btn-danger btn-lg searchClose hidden-xs hidden-sm"> 
                 <span class="glyphicon glyphicon-remove" aria-hidden="true" id="closeIcon"></span> </button>
            </span>
         </div>
        </form>
      </div>
    </div> <!-- /row -->
    
    
    
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <script>
    // 검색창 show, hide
    $(document).ready(function(){
      $(".headerSearch1").click(function(){
        $(".fullSearch").slideToggle("slideUp");
      });

      $(".searchClose").click(function(){
        $(".fullSearch").slideToggle("slideDown");
      });
    });

    // 사이드바
    $(document).ready(function(){
      $(".side_wrap li").click(function(){
        var menu= $(".side_wrap li");
        menu.removeClass("active");
        $(this).addClass("active");
      })
    })
  </script>
</body>