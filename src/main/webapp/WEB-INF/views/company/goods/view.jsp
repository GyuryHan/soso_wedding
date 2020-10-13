<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>kubg company</title>

<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/company/c_main.css">

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
   href="/resources/bootstrap/bootstrap-theme.min.css">
<link rel="stylesheet" href="/resources/css/company/c_main.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>

<script src="/resources/js/company/scroll.js"></script>



<style>
.inputArea {
   margin: 10px 0;
}

select {
   width: 100px;
}

label {
   display: inline-block;
   width: 100px;
   padding: 5px;
}

label[for='gdsDes'] {
   display: block;
}

input {
   width: 150px;
}

textarea#gdsDes {
   width: 400px;
   height: 180px;
}

.oriImg {
   width: 500px;
   height: auto;
}

.thumbImg {
   
}

.gdsDes img {
   max-width: 600px;
   height: auto;
}
</style>

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
         <div id="container_box2">
         <h3 class="goods_text_2">상품 조회</h3>
            <div class="table_title table_mt">${goods.cateName} 상세내용</div>
<form role="form" method="post" autocomplete="off">

   <input type="hidden" name="n" value="${goods.gdsNum}" />
            <table class="table_box">
               <colgroup>
                  <col width="22%">
                  <col width="*">
               </colgroup>
               <tbody>
            <tr>
               <th><label for="category1">1차분류</label></th>

               <td class="td_sec">
                  <div class="inputArea gdsName">
                  상점
                  </div>
               </td>

             </tr>
             <tr>
               <th><label for="category2">2차분류</label></th>

               <td class="td_sec">
                  <div class="inputArea gdsName">
                  ${goods.cateName}
                  </div>
               </td>

             </tr>
                  <tr>
                     <th><label for="gdsName">상품명</label></th>

                     <td class="td_sec">
                        <div class="inputArea gdsName">
                     ${goods.gdsName}
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="gdsPrice">상품가격</label></th>

                     <td class="td_sec">
                        <div class="inputArea gdsPrice">
                     <span><fmt:formatNumber
                        value="${goods.gdsPrice}" pattern="###,###,###" /></span>
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="gdsStock">상품수량</label></th>

                     <td class="td_sec">
                        <div class="inputArea gdsStock">
                     <span>${goods.gdsStock}</span>
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="comName">업체명</label></th>

                     <td class="td_sec">
                        <div class="inputArea comName">
                     <span>${goods.comName} </span>
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="comSubway">인근 지하철</label></th>

                     <td class="td_sec">
                        <div class="inputArea comSubway">
                     <span>${goods.comSubway}
                     </span>
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="comArea">지역</label></th>

                     <td class="td_sec">
                        <div class="inputArea comArea">
                     <span>${goods.comArea}</span>
                        </div>
                     </td>

              </tr>
              <c:choose>
                  <c:when test="${goods.cateCode == 101}">
                  <tr>
                     <th><label for="h_type">홀타입</label></th>

                     <td class="td_sec">
                        <div class="inputArea h_type">
                     <span>${weddingvo.h_type}</span>
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="oddnum">홀수</label></th>

                     <td class="td_sec">
                        <div class="inputArea oddnum">
                     <span>${weddingvo.oddnum}</span>
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="seat">좌석수(인원)</label></th>

                     <td class="td_sec">
                        <div class="inputArea seat">
                     <span>${weddingvo.seat}</span>
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="w_type">예식타입</label></th>

                     <td class="td_sec">
                        <div class="inputArea w_type">
                     <span>${weddingvo.w_type}</span>
                        </div>
                     </td>

                  </tr>
                  <tr>
                     <th><label for="m_menu">식사메뉴</label></th>

                     <td class="td_sec">
                  
                        <div class="inputArea m_menu">
                     <span>
                        ${weddingvo.m_menu}</span>
                        </div>
                     </td>

                  </tr>

                  <tr>
                     <th><label for="m_cost">식사비용</label></th>

                     <td class="td_sec">
                        <div class="inputArea m_cost">
                     <span>
                        ${weddingvo.m_cost}</span>
                        </div>
                     </td>

              </tr>
            </c:when>
<c:when test="${goods.cateCode == 102}">
                     <div class="inputArea">
                        <label for="d_type">드레스타입</label> <span>${dressvo.d_type}</span>
                     </div>
                     <div class="inputArea">
                        <label for="mater">소재</label> <span>${dressvo.mater}</span>
                     </div>
                     <div class="inputArea">
                        <label for="d_size">사이즈</label> <span>${dressvo.d_size}</span>
                     </div>
                     <div class="inputArea">
                        <label for="d_concept">드레스컨셉</label> <span>${dressvo.d_concept}</span>
                     </div>
                     <div class="inputArea">
                        <label for="w_shoewh">웨딩슈즈</label> <span>
                           ${dressvo.w_shoewh}</span>
                     </div>
                     <div class="inputArea">
                        <label for="as_wh">A/S</label> <span>
                           ${dressvo.as_wh}</span>
                     </div>
                  </c:when>
                  <c:when test="${goods.cateCode == 103}">
                     <div class="inputArea">
                        <label for="hair_ch">헤어담당</label> <span>${hairmakeupvo.hair_ch}</span>
                     </div>
                     <div class="inputArea">
                        <label for="makeup_ch">메이크업답당</label> <span>${hairmakeupvo.makeup_ch}</span>
                     </div>
                     <div class="inputArea">
                        <label for="nailart_wh">네일아트</label> <span>${hairmakeupvo.nailart_wh}</span>
                     </div>
                     <div class="inputArea">
                        <label for="formula">예식타입</label> <span>${hairmakeupvo.formula}</span>
                     </div>
                  </c:when>
                  <c:when test="${goods.cateCode == 104}">
                     <div class="inputArea">
                        <label for="r_num">룸 갯수</label> <span>${studiovo.r_num}</span>
                     </div>
                     <div class="inputArea">
                        <label for="seat">인원</label> <span>${studiovo.seat}</span>
                     </div>
                     <div class="inputArea">
                        <label for="cam_rent_wh">카메라대여</label> <span>${studiovo.cam_rent_wh}</span>
                     </div>
                     <div class="inputArea">
                        <label for="lens_rent_wh">렌즈대여</label> <span>${studiovo.lens_rent_wh}</span>
                     </div>
                     <div class="inputArea">
                        <label for="pet_comp_wh">반려동물</label> <span>
                           ${studiovo.pet_comp_wh}</span>
                     </div>
                     <div class="inputArea">
                        <label for="night_comp_wh">야간촬영</label> <span>
                           ${studiovo.night_comp_wh}</span>
                     </div>
                  </c:when>
                  <c:when test="${goods.cateCode == 105}">
                     <div class="inputArea">
                        <label for="prod_comp">상품구성</label> <span>${snapshotdvdvo.prod_comp}</span>
                     </div>
                     <div class="inputArea">
                         <label for="shooting_step">촬영스탭</label> <span>${snapshotdvdvo.shooting_step}</span>
                     </div>
                     <div class="inputArea">
                        <label for="shooting_eq">촬영장비</label> <span>${snapshotdvdvo.shooting_eq}</span>
                     </div>
                     <div class="inputArea">
                        <label for="runtime">러닝타임</label> <span>${snapshotdvdvo.runtime}</span>
                     </div>
                     <div class="inputArea">
                        <label for="prod_proc">제작과정</label> <span>
                           ${snapshotdvdvo.prod_proc}</span>
                     </div>
                  </c:when>
                  <c:when test="${goods.cateCode == 106}">
                     <div class="inputArea">
                        <label for="prod_comp">상품구성</label> <span>${mendressvo.prod_comp}</span>
                     </div>
                     <div class="inputArea">
                        <label for="manufacturer">제조사</label> <span>${mendressvo.manufacturer}</span>
                     </div>
                     <div class="inputArea">
                        <label for="mater">소재</label> <span>${mendressvo.mater}</span>
                     </div>
                     <div class="inputArea">
                        <label for="c_r_wh">맞춤/대여</label> <span>${mendressvo.c_r_wh}</span>
                     </div>
                     <div class="inputArea">
                        <label for="rent_per">대여기간</label> <span>
                           ${mendressvo.rent_per}</span>
                     </div>
                     <div class="inputArea">
                        <label for="prod_per">제작기간</label> <span>
                           ${mendressvo.prod_per}</span>
                     </div>
                  </c:when>
                  <c:when test="${goods.cateCode == 107}">
                     <div class="inputArea">
                        <label for="prod_comp">상품구성</label> <span>${hanbokgvo.prod_comp}</span>
                     </div>
                     <div class="inputArea">
                        <label for="rent_purch_method">대여구매방법</label> <span>${hanbokgvo.rent_purch_method}</span>
                     </div>
                     <div class="inputArea">
                        <label for="retrun_collect_method">수령반납방법</label> <span>${hanbokgvo.retrun_collect_method}</span>
                     </div>
                     <div class="inputArea">
                        <label for="fitting_cost">피팅비</label> <span>${hanbokgvo.fitting_cost}</span>
                     </div>
                     <div class="inputArea">
                        <label for="as_wh">A/S</label> <span>
                           ${hanbokgvo.as_wh}</span>
                     </div>
                  </c:when>
                  <c:when test="${goods.cateCode == 108}">
                     <div class="inputArea">
                        <label for="prod_comp">상품구성</label> <span>${bouquetgvo.prod_comp}</span>
                     </div>
                     <div class="inputArea">
                        <label for="standard">규격</label> <span>${bouquetgvo.standard}</span>
                     </div>
                     <div class="inputArea">
                        <label for="mater">소재</label> <span>${bouquetgvo.mater}</span>
                     </div>
                     <div class="inputArea">
                        <label for="color">색상</label> <span>${bouquetgvo.color}</span>
                     </div>
                     <div class="inputArea">
                        <label for="sale_ava_time">판매가능시기</label> <span>
                           ${bouquetgvo.sale_ava_time}</span>
                     </div>
                  </c:when>
                  <c:when test="${goods.cateCode == 109}">
                     <div class="inputArea">
                        <label for="prod_comp">상품구성</label> <span>${invitvo.prod_comp}</span>
                     </div>
                     <div class="inputArea">
                        <label for="prod_per">제작기간</label> <span>${invitvo.prod_per}</span>
                     </div>
                     <div class="inputArea">
                        <label for="standard">규격</label> <span>${invitvo.standard}</span>
                     </div>
                     <div class="inputArea">
                        <label for="m_invit">모바일청첩장</label> <span>${invitvo.m_invit}</span>
                     </div>
                     <div class="inputArea">
                        <label for="i_concept">컨셉</label> <span>
                           ${invitvo.i_concept}</span>
                     </div>
                  </c:when>
            <c:otherwise>
                     <p style="font-color: red">조건에 해당하지 않습니다</p>
                  </c:otherwise>
            </c:choose>
                 
                  <tr>
                     <th><label for="gdsImg">이미지</label></th>
                     <td class="td_sec">
                     <div class="inputArea gdsImg">
                  <img src="${goods.gdsImg}" class="oriImg" />
                  
                  </div>
                       
                     </td>

                  </tr>
                  <tr>
                     <th><label for="gdsImg2">이미지2</label></th>
                     <td class="td_sec">
                     <div class="inputArea gdsImg2">
                  <img src="${goods.gdsImg2}" class="oriImg" />
                  </div>
                       
                     </td>

                  </tr>
                  <tr>
                     <th><label for="gdsThumbImg">썸네일</label></th>
                     <td class="td_sec">
                  <div class="inputArea gdsThumbImg">
                  <img src="${goods.gdsThumbImg}" class="thumbImg" />
                          </div>
                       
                     </td>

                  </tr>


               </tbody>
         </table>

         <div class="inputArea" style="text-align:center">
            <button type="button" id="modify_Btn" class="btn btn-reg">수정</button>
            <button type="button" id="delete_Btn" class="btn btn-reg">삭제</button>

            <script>
               var formObj = $("form[role='form']");

               $("#modify_Btn").click(function() {
                  formObj.attr("action", "/company/goods/modify");
                  formObj.attr("method", "get")
                  formObj.submit();
               });

               $("#delete_Btn").click(
                     function() {

                        var con = confirm("정말로 삭제하시겠습니까?");

                        if (con) {
                           formObj.attr("action",
                                 "/company/goods/delete");
                           formObj.submit();
                        }
                     });
            </script>
         </div>
         </form>
         </div>
      </section>

      <footer id="footer">
         <div id="footer_box">
            <%@ include file="../include/footer.jsp"%>
         </div>
      </footer>

   </div>

</body>
</html>