<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
<title>kubg company</title>

<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
   href="/resources/bootstrap/bootstrap-theme.min.css">

<link rel="stylesheet" href="/resources/css/company/c_main.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>

<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/js/company/scroll.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script src="/resources/js/company/menu_fixed.js"></script>


<style>
div#container_box {
height:auto;
}
body{
font-size:15px;
}
.h_mb{
margin-bottom:0;
border-bottom:1.5px solid #333;
}

/*테이블 높이값*/
.th_he{
height:70px;
}

#container_box2 table { width:100%; } 
#container_box2 table th { font-size:20px; font-weight:bold;
                     text-align:center; padding:10px; border-bottom:2px solid #333; }
#container_box2 table tr:hover { background:#eee; }
#container_box2 table td { padding:10px; text-align:center; }
#container_box2 table img { width:150px; height:auto; }
</style>

<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      $("input:text[numberOnly]").on("keyup", function() {
          $(this).val($(this).val().replace(/[^0-9]/g,""));
      });

      var formObj = $("form[name='register2']");
      $("#register_Btn").on("click", function() {
         if (fn_valiChk()) {
            return false;
         }
         formObj.attr("action", "/company/goods/register2");
         formObj.attr("method", "post");
         formObj.submit();
      });
      
      //서류사항 textarea 체크
      $('#gdsName').keyup(
            function(e) {
               var content = $(this).val();
               $('.gdsName > #counter').html(
                     "(<em>" + content.length
                           + " </em> / 최대 200자)"); //글자수 실시간 카운팅

               if (content.length > 200) {
                  alert("최대 200자까지 입력 가능합니다.");
                  $(this).val(content.substring(0, 200));
                  $('.gdsName > #counter').html(
                        "(200 / 최대 200자)");
               }
            });

      $('#gdsPrice').keyup(
            function(e) {
               var content = $(this).val();
               $('.gdsPrice > #counter').html(
                     "(<em>" + content.length
                           + " </em> / 최대 30자)"); //글자수 실시간 카운팅

               if (content.length > 30) {
                  alert("최대 30자까지 입력 가능합니다.");
                  $(this).val(content.substring(0, 30));
                  $('.gdsPrice > #counter').html(
                        "(30 / 최대 30자)");
               }
            });

      $('#gdsStock').keyup(
            function(e) {
               var content = $(this).val();
               $('.gdsStock > #counter').html(
                     "(<em>" + content.length
                           + " </em> / 최대 30자)"); //글자수 실시간 카운팅

               if (content.length > 30) {
                  alert("최대 30자까지 입력 가능합니다.");
                  $(this).val(content.substring(0, 30));
                  $('.gdsStock > #counter').html(
                        "(30 / 최대 30자)");
               }
            });

      $('#comName').keyup(
            function(e) {
               var content = $(this).val();
               $('.comName > #counter').html(
                     "(<em>" + content.length
                           + " </em> / 최대 200자)"); //글자수 실시간 카운팅

               if (content.length > 200) {
                  alert("최대 200자까지 입력 가능합니다.");
                  $(this).val(content.substring(0, 200));
                  $('.comName > #counter').html(
                        "(200 / 최대 200자)");
               }
            });

      $('#comSubway').keyup(
            function(e) {
               var content = $(this).val();
               $('.comSubway > #counter').html(
                     "(<em>" + content.length
                           + " </em> / 최대 30자)"); //글자수 실시간 카운팅

               if (content.length > 30) {
                  alert("최대 30자까지 입력 가능합니다.");
                  $(this).val(content.substring(0, 30));
                  $('.comSubway > #counter').html(
                        "(30 / 최대 30자)");
               }
            });

      $('#comArea').keyup(
            function(e) {
               var content = $(this).val();
               $('.comArea > #counter').html(
                     "(<em>" + content.length
                           + " </em> / 최대 30자)"); //글자수 실시간 카운팅

               if (content.length > 30) {
                  alert("최대 30자까지 입력 가능합니다.");
                  $(this).val(content.substring(0, 30));
                  $('.comArea > #counter').html(
                        "(30 / 최대 30자)");
               }
            });

      $('#h_type').keyup(
            function(e) {
               var content = $(this).val();
               $('.h_type > #counter').html(
                     "(<em>" + content.length
                           + " </em> / 최대 50자)"); //글자수 실시간 카운팅

               if (content.length > 50) {
                  alert("최대 50자까지 입력 가능합니다.");
                  $(this).val(content.substring(0, 50));
                  $('.h_type > #counter').html(
                        "(50 / 최대 50자)");
               }
            });

      $('#oddnum').keyup(
            function(e) {
               var content = $(this).val();
               $('.oddnum > #counter').html(
                     "(<em>" + content.length
                           + " </em> / 최대 30자)"); //글자수 실시간 카운팅

               if (content.length > 30) {
                  alert("최대 30자까지 입력 가능합니다.");
                  $(this).val(content.substring(0, 30));
                  $('.oddnum >  #counter').html(
                        "(30 / 최대 30자)");
               }
            });

      $('#seat').keyup(
            function(e) {
               var content = $(this).val();
               $('.seat > #counter').html(
                     "(<em>" + content.length
                           + " </em> / 최대 30자)"); //글자수 실시간 카운팅

               if (content.length > 30) {
                  alert("최대 30자까지 입력 가능합니다.");
                  $(this).val(content.substring(0, 30));
                  $('.seat >  #counter').html(
                        "(30 / 최대 30자)");
               }
            });

      $('#w_type').keyup(
            function(e) {
               var content = $(this).val();
               $('.w_type > #counter').html(
                     "(<em>" + content.length
                           + " </em> / 최대 50자)"); //글자수 실시간 카운팅

               if (content.length > 50) {
                  alert("최대 50자까지 입력 가능합니다.");
                  $(this).val(content.substring(0, 50));
                  $('.w_type >  #counter').html(
                        "(50 / 최대 50자)");
               }
            });

      $('#m_menu').keyup(
            function(e) {
               var content = $(this).val();
               $('.m_menu > #counter').html(
                     "(<em>" + content.length
                           + " </em> / 최대 50자)"); //글자수 실시간 카운팅

               if (content.length > 50) {
                  alert("최대 50자까지 입력 가능합니다.");
                  $(this).val(content.substring(0, 50));
                  $('.m_menu > #counter').html(
                        "(50 / 최대 50자)");
               }
            });

      $('#m_cost').keyup(
            function(e) {
               var content = $(this).val();
               $('.m_cost > #counter').html(
                     "(<em>" + content.length
                           + " </em> / 최대 30자)"); //글자수 실시간 카운팅

               if (content.length > 30) {
                  alert("최대 30자까지 입력 가능합니다.");
                  $(this).val(content.substring(0, 30));
                  $('.m_cost > #counter').html(
                        "(30 / 최대 30자)");
               }
            });
      

   });
    
   function fn_valiChk() {
      var regForm = $("form[name='register2'] .chk").length;
      for (var i = 0; i < regForm; i++) {
         if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null
               || $(".chk").eq(i).val() == "선택") {
            alert($(".chk").eq(i).attr("title"));
            return true;
         }
      }
   };

   


   
</script>
</head>
<body>
   <div id="root">
      <header id="header">
         <div id="header_box">
            <%@ include file="../include/header.jsp"%>
         </div>
      </header>

      <nav id="nav">
         <div id="nav_box">
            <%@ include file="../include/nav.jsp"%>
         </div>
      </nav>

      <section id="container">
         <aside>
            <%@ include file="../include/aside.jsp"%>
         </aside>
         <div id="container_all">
         <div id="container_box">
            <h3 class="goods_text_2">상품 수정</h3>
            <div class="table_title">카테고리 연결</div>
<form role="form" method="post" autocomplete="off"
                           enctype="multipart/form-data" name="register2"
                           action="/company/goods/register2">
            <table class="table_box tb_mb">
               <colgroup>
                  <col width="22%">
                  <col width="*">
               </colgroup>
               <tbody>
                  <tr>
                     <th>카테고리 선택</th>

                     <td class="td_sec">
                        
                           <div class="inputArea">
                              <label>1차 분류</label> <select class="category1">
                                 <option value="">전체</option>
                               </select> <label>2차 분류</label> <select class="category2" name="cateCode">
                                 <option value="">전체</option>
                               </select>
                           </div>
                           
                        
                     </td>
                  </tr>
               </tbody>
            </table>
            <div class="areacontain">
<table class="table_box">
               <colgroup>
                  <col width="22%">
                  <col width="*">
               </colgroup>
               <tbody>
                  <tr>
                     <th><label for="gdsName">상품명</label></th>

                     <td class="td_sec">
                        <div class="inputArea gdsName">
                           <input type="text" id="gdsName" name="gdsName" class="chk" value="${goods.gdsName}"/><span
                              style="color: #666; font-weight: bold" id="counter">(<em>0</em>
                              / 최대 200자)
                           </span>
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="gdsPrice">상품가격</label></th>

                     <td class="td_sec">
                        <div class="inputArea gdsPrice">
                           <input type="text" numberOnly id="gdsPrice" name="gdsPrice"
                              class="chk" value="${goods.gdsPrice}"/><span style="color: #666; font-weight: bold"
                              id="counter">(<em>0</em> / 최대 30자)
                           </span>
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="gdsStock">상품수량</label></th>

                     <td class="td_sec">
                        <div class="inputArea gdsStock">
                           <input type="text" id="gdsStock" name="gdsStock" class="chk" value="${goods.gdsStock}"/><span
                              style="color: #666; font-weight: bold" id="counter">(<em>0</em>
                              / 최대 30자)
                           </span>
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="comName">업체명</label></th>

                     <td class="td_sec">
                        <div class="inputArea comName">
                           <input type="text" id="comName" name="comName" class="chk" value="${goods.comName}"/><span
                              style="color: #666; font-weight: bold" id="counter">(<em>0</em>
                              / 최대 200자)
                           </span>
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="comSubway">인근 지하철</label></th>

                     <td class="td_sec">
                        <div class="inputArea comSubway">
                           <input type="text" id="comSubway" name="comSubway" class="chk" value="${goods.comSubway}"/><span
                              style="color: #666; font-weight: bold" id="counter">(<em>0</em>
                              / 최대 30자)
                           </span>
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="comArea">지역</label></th>

                     <td class="td_sec">
                        <div class="inputArea comArea">
                           <input type="text" id="comArea" name="comArea" class="chk" value="${goods.comArea}"/><span
                              style="color: #666; font-weight: bold" id="counter">(<em>0</em>
                              / 최대 30자)
                           </span>
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="h_type">홀타입</label></th>

                     <td class="td_sec">
                        <div class="inputArea h_type">
                           <input type="text" id="h_type" name="h_type" class="chk" value="${weddingvo.h_type}"/><span
                              style="color: #666; font-weight: bold" id="counter">(<em>0</em>
                              / 최대 50자)
                           </span>
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="oddnum">홀수</label></th>

                     <td class="td_sec">
                        <div class="inputArea oddnum">
                           <input type="text" id="oddnum" name="oddnum" class="chk" value="${weddingvo.oddnum}"/> <span
                              style="color: #666; font-weight: bold" id="counter">(<em>0</em>
                              / 최대 30자)
                           </span>
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="seat">좌석수(인원)</label></th>

                     <td class="td_sec">
                        <div class="inputArea seat">
                           <input type="text" id="seat" name="seat" class="chk" value="${weddingvo.seat}"/><span
                              style="color: #666; font-weight: bold" id="counter">(<em>0</em>
                              / 최대 30자)
                           </span>
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="w_type">예식타입</label></th>

                     <td class="td_sec">
                        <div class="inputArea w_type">
                           <input type="text" id="w_type" name="w_type" class="chk" value="${weddingvo.w_type}"/> <span
                              style="color: #666; font-weight: bold" id="counter">(<em>0</em>
                              / 최대 50자)
                           </span>
                        </div>
                     </td>

              </tr>
              <c:choose>
                     <c:when test="${goods.cateCode == 101}">
                  <tr>
                     <th><label for="m_menu">식사메뉴</label></th>

                     <td class="td_sec">
                  
                        <div class="inputArea m_menu">
                           <input type="text" id="m_menu" name="m_menu" class="chk" value="${weddingvo.m_menu}"/><span
                              style="color: #666; font-weight: bold" id="counter">(<em>0</em>
                              / 최대 50자)
                           </span>
                        </div>
                     </td>

                  </tr>

                  <tr>
                     <th><label for="m_cost">식사비용</label></th>

                     <td class="td_sec">
                        <div class="inputArea m_cost">
                           <input type="text" id="m_cost" name="m_cost" class="chk" value="${weddingvo.m_cost}"/><span
                              style="color: #666; font-weight: bold" id="counter">(<em>0</em>
                              / 최대 30자)
                           </span>
                        </div>
                     </td>

              </tr>
            </c:when>
            <c:when test="${goods.cateCode == 102}">
                        <input type="hidden" name="gdsNum" value="${dressvo.gdsNum}" />
                        <div class="inputArea">
                           <label for="d_type">드레스타입</label> <input type="text"
                              id="d_type" name="d_type" value="${dressvo.d_type}" />
                        </div>
                        <div class="inputArea">
                           <label for="mater">소재</label> <input type="text" id="mater"
                              name="mater" value="${dressvo.mater}" />
                        </div>
                        <div class="inputArea">
                           <label for="d_size">사이즈</label> <input type="text" id="d_size"
                              name="d_size" value="${dressvo.d_size}" />
                        </div>
                        <div class="inputArea">
                           <label for="d_concept">드레스컨셉</label> <input type="text"
                              id="d_concept" name="d_concept" value="${dressvo.d_concept}" />
                        </div>
                        <div class="inputArea">
                           <label for="w_shoewh">웨딩슈즈</label> <input type="text"
                              id="w_shoewh" name="w_shoewh" value="${dressvo.w_shoewh}" />
                        </div>
                        <div class="inputArea">
                           <label for="as_wh">A/S</label> <input type="text" id="as_wh"
                              name="as_wh" value="${dressvo.as_wh}" />
                        </div>
                     </c:when>
                     <c:when test="${goods.cateCode == 103}">
                        <input type="hidden" name="gdsNum"
                           value="${hairmakeupvo.gdsNum}" />
                        <div class="inputArea">
                           <label for="hair_ch">헤어담당</label> <input type="text"
                              id="hair_ch" name="hair_ch" value="${hairmakeupvo.hair_ch}" />
                        </div>
                        <div class="inputArea">
                           <label for="makeup_ch">메이크업답당</label> <input type="text"
                              id="makeup_ch" name="makeup_ch"
                              value="${hairmakeupvo.makeup_ch}" />
                        </div>
                        <div class="inputArea">
                           <label for="nailart_wh">네일아트</label> <input type="text"
                              id="nailart_wh" name="nailart_wh"
                              value="${hairmakeupvo.nailart_wh}" />
                        </div>
                        <div class="inputArea">
                           <label for="formula">방식 </label> <input type="text"
                              id="formula" name="formula" value="${hairmakeupvo.formula}" />
                        </div>
                     </c:when>
                     <c:when test="${goods.cateCode == 104}">
                        <input type="hidden" name="gdsNum" value="${studiovo.gdsNum}" />
                        <div class="inputArea">
                           <label for="r_num">룸 갯수</label> <input type="text" id="r_num"
                              name="r_num" value="${studiovo.r_num}" />
                        </div>
                        <div class="inputArea">
                           <label for="seat">인원</label> <input type="text" id="seat"
                              name="seat" value="${studiovo.seat}" />
                        </div>
                        <div class="inputArea">
                           <label for="cam_rent_wh">카메라대여</label> <input type="text"
                              id="cam_rent_wh" name="cam_rent_wh"
                              value="${studiovo.cam_rent_wh}" />
                        </div>
                        <div class="inputArea">
                           <label for="lens_rent_wh">렌즈대여</label> <input type="text"
                              id="lens_rent_wh" name="lens_rent_wh"
                              value="${studiovo.lens_rent_wh}" />
                        </div>
                        <div class="inputArea">
                           <label for="pet_comp_wh">반려동물</label> <input type="text"
                              id="pet_comp_wh" name="pet_comp_wh"
                              value="${studiovo.pet_comp_wh}" />
                        </div>
                        <div class="inputArea">
                           <label for="night_comp_wh">야간촬영</label> <input type="text"
                              id="night_comp_wh" name="night_comp_wh"
                              value="${studiovo.night_comp_wh}" />
                        </div>
                     </c:when>
                     <c:when test="${goods.cateCode == 105}">
                        <input type="hidden" name="gdsNum"
                           value="${snapshotdvdvo.gdsNum}" />
                        <div class="inputArea">
                           <label for="prod_comp">상품구성</label> <input type="text"
                              id="prod_comp" name="prod_comp"
                              value="${snapshotdvdvo.prod_comp}" />
                        </div>
                        <div class="inputArea">
                           <label for="shooting_step">촬영스탭</label> <input type="text"
                              id="shooting_step" name="shooting_step"
                              value="${snapshotdvdvo.shooting_step}" />
                        </div>
                        <div class="inputArea">
                           <label for="shooting_eq">촬영장비</label> <input type="text"
                              id="shooting_eq" name="shooting_eq"
                              value="${snapshotdvdvo.shooting_eq}" />
                        </div>
                        <div class="inputArea">
                           <label for="runtime">러닝타임</label> <input type="text"
                              id="runtime" name="runtime" value="${snapshotdvdvo.runtime}" />
                        </div>
                        <div class="inputArea">
                           <label for="prod_proc">제작과정</label> <input type="text"
                              id="prod_proc" name="prod_proc"
                              value="${snapshotdvdvo.prod_proc}" />
                        </div>
                     </c:when>
                     <c:when test="${goods.cateCode == 106}">
                        <input type="hidden" name="gdsNum" value="${mendressvo.gdsNum}" />
                        <div class="inputArea">
                           <label for="prod_comp">상품구성</label> <input type="text"
                              id="prod_comp" name="prod_comp"
                              value="${mendressvo.prod_comp}" />
                        </div>
                        <div class="inputArea">
                           <label for="manufacturer">제조사</label> <input type="text"
                              id="manufacturer" name="manufacturer"
                              value="${mendressvo.manufacturer}" />
                        </div>
                        <div class="inputArea">
                           <label for="mater">소재</label> <input type="text" id="mater"
                              name="mater" value="${mendressvo.mater}" />
                        </div>
                        <div class="inputArea">
                           <label for="c_r_wh">맞춤/대여</label> <input type="text"
                              id="c_r_wh" name="c_r_wh" value="${mendressvo.c_r_wh}" />
                        </div>
                        <div class="inputArea">
                           <label for="rent_per">대여기간</label> <input type="text"
                              id="rent_per" name="rent_per" value="${mendressvo.rent_per}" />
                        </div>
                        <div class="inputArea">
                           <label for="prod_per">제작기간</label> <input type="text"
                              id="prod_per" name="prod_per" value="${mendressvo.prod_per}" />
                        </div>
                     </c:when>
                     <c:when test="${goods.cateCode == 107}">
                        <input type="hidden" name="gdsNum" value="${hanbokgvo.gdsNum}" />
                        <div class="inputArea">
                           <label for="prod_comp">상품구성</label> <input type="text"
                              id="prod_comp" name="prod_comp" value="${hanbokgvo.prod_comp}" />
                        </div>
                        <div class="inputArea">
                           <label for="rent_purch_method">대여구매방법</label> <input
                              type="text" id="rent_purch_method" name="rent_purch_method"
                              value="${hanbokgvo.rent_purch_method}" />
                        </div>
                        <div class="inputArea">
                           <label for="retrun_collect_method">수령반납방법</label> <input
                              type="text" id="retrun_collect_method"
                              name="retrun_collect_method"
                              value="${hanbokgvo.retrun_collect_method}" />
                        </div>
                        <div class="inputArea">
                           <label for="fitting_cost">피팅비</label> <input type="text"
                              id="fitting_cost" name="fitting_cost"
                              value="${hanbokgvo.fitting_cost}" />
                        </div>
                        <div class="inputArea">
                           <label for="as_wh">A/S</label> <input type="text" id="as_wh"
                              name="as_wh" value="${hanbokgvo.as_wh}" />
                        </div>
                     </c:when>
                     <c:when test="${goods.cateCode == 108}">
                        <input type="hidden" name="gdsNum" value="${bouquetgvo.gdsNum}" />
                        <div class="inputArea">
                           <label for="prod_comp">상품구성</label> <input type="text"
                              id="prod_comp" name="prod_comp"
                              value="${bouquetgvo.prod_comp}" />
                        </div>
                        <div class="inputArea">
                           <label for="standard">규격</label> <input type="text"
                              id="standard" name="standard" value="${bouquetgvo.standard}" />
                        </div>
                        <div class="inputArea">
                           <label for="mater">소재</label> <input type="text" id="mater"
                              name="mater" value="${bouquetgvo.mater}" />
                        </div>
                        <div class="inputArea">
                           <label for="color">색상</label> <input type="text" id="color"
                              name="color" value="${bouquetgvo.color}" />
                        </div>
                        <div class="inputArea">
                           <label for="sale_ava_time">판매가능시기</label> <input type="text"
                              id="m_menu" name="m_menu" value="${bouquetgvo.sale_ava_time}" />
                        </div>
                     </c:when>
                     <c:when test="${goods.cateCode == 109}">
                        <input type="hidden" name="gdsNum" value="${invitvo.gdsNum}" />
                        <div class="inputArea">
                           <label for="prod_comp">상품구성</label> <input type="text"
                              id="prod_comp" name="prod_comp" value="${invitvo.prod_comp}" />
                        </div>
                        <div class="inputArea">
                           <label for="prod_per">제작기간</label> <input type="text"
                              id="prod_per" name="prod_per" value="${invitvo.prod_per}" />
                        </div>
                        <div class="inputArea">
                           <label for="standard">규격</label> <input type="text"
                              id="standard" name="standard" value="${invitvo.standard}" />
                        </div>
                        <div class="inputArea">
                           <label for="m_invit">모바일청첩장</label> <input type="text"
                              id="m_invit" name="m_invit" value="${invitvo.m_invit}" />
                        </div>
                        <div class="inputArea">
                           <label for="i_concept">컨셉</label> <input type="text"
                              id="i_concept" name="i_concept" value="${invitvo.i_concept}" />
                        </div>
                     </c:when>
                     <c:otherwise>
                        <p style="font-color: red">조건에 해당하지 않습니다</p>
                     </c:otherwise>
                  </c:choose>
                  <tr>
                     <th><label for="oaddress">주소등록</label></th>

                     <td class="td_sec">
                        <div class="inputArea">
                           <input style="width: 40%; display: inline;" placeholder="우편번호"
                              name="oaddress" id="oaddress" type="text" readonly="readonly">
                           <button type="button" class="btn btn-address"
                              onclick="execPostCode();">
                              <i class="fa fa-search"></i> 우편번호 찾기
                           </button>
                        </div>
                        <div class="inputArea">
                           <input style="top: 5px;" placeholder="도로명 주소" name="address"
                              id="address" type="text" readonly="readonly" class="chk" />
                        </div>

                        <div class="inputArea">
                           <input placeholder="상세주소" name="detailaddress"
                              id="detailaddress" type="text" class="chk" />
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="gdsDes">상품소개</label></th>

                     <td class="td_sec">
                        <div class="inputArea gdsDes ">
                           <textarea rows="5" cols="50" id="gdsDes" name="gdsDes">${goods.gdsDes}</textarea>
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="gdsImg">이미지</label></th>
                     <td class="td_sec">
                        <div class="inputArea gdsImg">
                           <div class="filebox">
                              <label for="gdsImg">이미지 업로드</label> <input type="file"
                                 multiple="multiple" id="gdsImg" name="file" value="${goods.gdsImg}"/>
                              <div class="select_img">
                        <img src="${goods.gdsImg}" />
                              </div>
                           </div>
                              <div class="filebox2">
                              <label for="gdsImg2">이미지 업로드 2</label> <input type="file"
                                 multiple="multiple" id="gdsImg2" name="file" value="${goods.gdsImg2}"/>
                              <div class="select2_img">
                        <img src="${goods.gdsImg2}" />
                              </div>
                           </div>
                           <%=request.getRealPath("/")%>
                        </div>
                     </td>

                  </tr>


               </tbody>
            </table>
         <div class="inputArea" style="text-align:center">
            <button type="submit" id="update_Btn" class="btn btn-reg">완료</button>
            <button type="button" id="back_Btn" class="btn btn-reg">취소</button>

            <script>
               $("#back_Btn").click(function() {
                 //history.back();
                 location.href = "/company/goods/view?n=" + ${goods.gdsNum};
               });
            </script>

          </div>
            </div>
            </form>
         </div>
         </div>
      </section>



      <footer id="footer">
         <div id="footer_box">
            <%@ include file="../include/footer.jsp"%>
         </div>
      </footer>

   </div>

   <script>
      var ckeditor_config = {
         resize_enaleb : false,
         enterMode : CKEDITOR.ENTER_BR,
         shiftEnterMode : CKEDITOR.ENTER_P,
         filebrowserUploadUrl : "/company/goods/ckUpload"
      };
  
      CKEDITOR.replace("gdsDes", ckeditor_config);
    </script>
   <script>
      /*
       * --------------------
       * register.jsp 주석 참고
       * --------------------
       */
      var jsonData = JSON.parse('${category}');

      var cate1Arr = new Array();
      var cate1Obj = new Object();

      for (var i = 0; i < jsonData.length; i++) {

         if (jsonData[i].level == "1") {
            cate1Obj = new Object(); //초기화
            cate1Obj.cateCode = jsonData[i].cateCode;
            cate1Obj.cateName = jsonData[i].cateName;
            cate1Arr.push(cate1Obj);
         }
      }

      var cate1Select = $("select.category1")

      for (var i = 0; i < cate1Arr.length; i++) {
         cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
               + cate1Arr[i].cateName + "</option>");
      }

      $(document)
            .on(
                  "change",
                  "select.category1",
                  function() {

                     var cate2Arr = new Array();
                     var cate2Obj = new Object();

                     for (var i = 0; i < jsonData.length; i++) {

                        if (jsonData[i].level == "2") {
                           cate2Obj = new Object();
                           cate2Obj.cateCode = jsonData[i].cateCode;
                           cate2Obj.cateName = jsonData[i].cateName;
                           cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;

                           cate2Arr.push(cate2Obj);
                        }
                     }

                     var cate2Select = $("select.category2");

                     /*
                     for(var i = 0; i < cate2Arr.length; i++) {
                           cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
                                          + cate2Arr[i].cateName + "</option>");
                     }
                      */

                     cate2Select.children().remove();

                     $("option:selected", this)
                           .each(
                                 function() {

                                    var selectVal = $(this).val();

                                    cate2Select
                                          .append("<option value='" + selectVal + "'>전체</option>");

                                    for (var i = 0; i < cate2Arr.length; i++) {
                                       if (selectVal == cate2Arr[i].cateCodeRef) {
                                          cate2Select
                                                .append("<option value='" + cate2Arr[i].cateCode + "'>"
                                                      + cate2Arr[i].cateName
                                                      + "</option>");
                                       }
                                    }
                                 });
                  });

      var select_cateCode = '${goods.cateCode}';
      var select_cateCodeRef = '${goods.cateCodeRef}';
      var select_cateName = '${goods.cateName}';

      console.log("select_cateCode = " + select_cateCode);
      console.log("select_cateCodeRef = " + select_cateCodeRef);

      if (select_cateCodeRef != null && select_cateCodeRef != "") {

         console.log("값이 있으면");

         $(".category1").val(select_cateCodeRef);
         $(".category2").val(select_cateCode);
         $(".category2").children().remove();
         $(".category2").append(
               "<option value='"
                     + select_cateCode + "'>"
                     + select_cateName + "</option>");

      } else {

         console.log("값이 없으면");

         $(".category1").val(select_cateCode);
         //$(".category2").val(select_cateCode);
         $(".category2")
               .append(
                     "<option value='"
         + select_cateCode + "' selected='selected'>전체</option>");
      }
   </script>
   <script>
      var regExp = /[^0-9]/gi;

      $("#gdsPrice").keyup(function() {
         numCheck($(this));
      });
      $("#gdsStock").keyup(function() {
         numCheck($(this));
      });

      function numCheck(selector) {
         var tempVal = selector.val();
         selector.val(tempVal.replace(regExp, ""));
      }
   </script>
   <script>
    //우편번호 찾기 버튼 클릭시 발생 이벤트
  
    function execPostCode() {
      new daum.Postcode({
         oncomplete : function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수
           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
             extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if (data.buildingName !== '' && data.apartment === 'Y') {
             extraRoadAddr += (extraRoadAddr !== '' ? ', '
                  + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if (extraRoadAddr !== '') {
             extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
  
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if (fullRoadAddr !== '') {
             fullRoadAddr += extraRoadAddr;
           }
           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           /* var a = console.log(data.zonecode);
           var b = console.log(fullRoadAddr);
           if(a == null || b = null){
             alert("주소를 확인하세요.");
             return false;
           } */
           $("[name=oaddress]").val(data.zonecode);
           $("[name=address]").val(fullRoadAddr);
           document.getElementById('oaddress').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('address').value = fullRoadAddr;
           //document.getElementById('detailaddress').value = data.jibunAddress;
         }
      }).open();
    }
  </script>
    <script>
      $("#gdsImg")
           .change(
               function() {
                  if (this.files && this.files[0]) {
  
                    var reader = new FileReader;
                    reader.onload = function(data) {
                      $(".select_img img").attr("src",
                           data.target.result).width(100);
                    }
                    reader.readAsDataURL(this.files[0]);
                  }
               });
      $("#gdsImg2").change(
           function() {
             if (this.files && this.files[0]) {
               var reader = new FileReader;
               reader.onload = function(data) {
                  $(".select2_img img").attr("src",
                      data.target.result).width(100);
               }
               reader.readAsDataURL(this.files[0]);
             }
           });
    </script>

   
</body>
</html>