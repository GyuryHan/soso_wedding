<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>cart_4-2</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
   href="/resources/css/user/cart/cart_4-2.css" type="text/css">
<link rel="stylesheet" href="/resources/css/main/header-footer.css"
   type="text/css">
<link rel="stylesheet" type="text/css"
   href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
   src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<script type="text/javascript">
   
//모든 공백 체크 정규식
var empJ = /\s/g;
// 이름 정규식
var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
// 휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/
   var sample2_address = $('#sample2_extraAddress');
      $(document).ready(function() {
   var sample2_address = $('#sample2_extraAddress');





// 개개인에 따른 정규식 

//이름에 특수문자 들어가지 않도록 설정
$("#orderRec").blur(function() {
   if (nameJ.test($(this).val())) {
      console.log(nameJ.test($(this).val()));
      $("#name_check").text('');
   } else {
      $('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
      $('#name_check').css('color', 'red');
   }
});
//주소

$('#sample2_address').blur(function(){
   if(nameJ.test($(this).val())){
      console.log(nameJ.test($(this).val()));
      $("#address_check").text('');
   } else {
      $('#address_check').text('주소를 확인해주세요 ');
      $('#address_check').css('color', 'red');
   }
});


//상세주소

$('#sample2_detailAddress').blur(function(){
   if(nameJ.test($(this).val())){
      console.log(nameJ.test($(this).val()));
      $("#address_check").text('');
   } else {
      $('#address_check').text('상세 주소를 확인해주세요 ');
      $('#address_check').css('color', 'red');
   }
});

// 휴대전화

$('#orderPhon').blur(function(){
   if(phoneJ.test($(this).val())){
      console.log(nameJ.test($(this).val()));
      $("#phone_check").text('');
   } else {
      $('#phone_check').text('휴대폰번호를 확인해주세요 ');
      $('#phone_check').css('color', 'red');
   }
});
});

</script>
<style>
.eheck_font, #address_check {
   margin-left: 120px;
   margin-top: -10px;
   margin-bottom: 15px;
}
</style>
</head>

<body>
   <div class="container-fluid">
      <%@ include file="../include/header2.jsp"%>
   </div>
   <!--container-fluid-->

   <div class="container">
      <div class="row topInfo">
         <div class="col-sm-6">
            <h3>주문/결제</h3>
         </div>
         <div class="col-sm-6">
            <ol class="breadcrumb">
               <li>장바구니</li>
               <li class="active">주문/결제</li>
               <li>주문완료</li>
            </ol>
         </div>
      </div>

      <hr>
      <h4 class="odTitle">주문상품</h4>
      <table class="table2">
         <thead>
            <tr>
               <th>상품정보</th>
               <th class="hidden-xs">판매자</th>
               <th>수량</th>
               <th>판매금액</th>
            </tr>
         </thead>
         <tbody>

            <c:set var="sum" value="0" />
            
            <c:forEach items="${cartList}" var="cartList" varStatus="status">
               <tr>
                  <td class="productDescription">
                     <div>
                        <span class="productThumb"><img
                           src="${cartList.gdsThumbImg}"></span>
                        <div class="names">
                           <span class="kategorie">[${goods[status.index].cateName}]</span><span
                              class="companyName">${goods[status.index].comName}</span> <span
                              class="productName">${cartList.gdsName}_${goods[status.index].comArea}</span>
                           <span class="minNum">수량 <span>${cartList.cartStock}</span></span>
                           <c:choose>
                              <c:when test="${goods[status.index].cateCode==101}">
                                 <span class="option">옵션 <span>${goodwed[status.index].h_type}</span>
                                 </span>
                              </c:when>
                           </c:choose>
   
                        </div>
                     </div>
                  </td>
                  <td class="companyName2 hidden-xs">
                     <div>${goods[status.index].comName}</div>
                  </td>
                  <td class="count">${cartList.cartStock}</td>
                  <td class="totalPrice">
                     <div>
                        <fmt:formatNumber pattern="###,###,###"
                           value="${cartList.gdsPrice * cartList.cartStock}" />
                        원
                     </div>
                  </td>
               </tr>
               <c:set var="sum"
                  value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />
                  <c:set var="goods_name"
                  value="${cartList.gdsName}" />
                  <c:set var="count"
                  value="${status.count}" />
                  
            </c:forEach>
         </tbody>
      </table>

      <div class="mbTotal">
         <strong>최종 결제금액 </strong> <span> <span class="mbTotalPrice"><fmt:formatNumber
                  pattern="###,###,###" value="${sum}" /></span> 원
         </span>

      </div>

      <div class="row">
         <div class="col-sm-8 col-md-9">
            <hr>
            <h4 class="odTitle">배송지정보</h4>
            <div class="orderInfo">
               <form id="orderform" role="form" method="post" autocomplete="off"  id="usercheck" name="member">
                  <input type="hidden" name="amount" value="${sum}" />
                  <!-- <input type="hidden" name="amount" value="${sum}" /> -->
                  <div class="row">
                     <div class="col-sm-12">
                        <div class="col-sm-12">
                           <label for="">받는분<em class="required">필수</em></label> <input
                              type="text" name="orderRec" id="orderRec" required="required"
                              placeholder="이름을 입력하세요" />
                                <div class="eheck_font" id="name_check"></div>
                        </div>

                        <div class="col-sm-12">
                           <label for="" >우편번호<em class="required">필수</em></label>
                           <!-- <input type="text" id="sample2_postcode"> -->
                           <input type="text" id="sample2_postcode" readonly placeholder="우편번호">

                           <input type="button" onclick="sample2_execDaumPostcode()"
                              value="우편번호찾기" class="blo">
                        </div>
                        <div class="col-sm-12">
                           <label for="" class="hid">우편번호<em class="required">필수</em></label>
                           <input type="text" name="userAddr1" placeholder="주소"
                              id="sample2_address"> <input type="text"
                              name="userAddr2" placeholder="상세주소" id="sample2_detailAddress">
                           <input type="text" name="userAddr3" id="sample2_extraAddress"
                              required="required" readonly />
                              <div id="address_check"></div>
                        </div>


                        <!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
                        <div id="layer"
                           style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
                           <img src="//t1.daumcdn.net/postcode/resource/images/close.png"
                              id="btnCloseLayer"
                              style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
                              onclick="closeDaumPostcode()" alt="닫기 버튼">
                        </div>
                        <div class="col-sm-12">
                           <label for="orderPhon">휴대폰<em class="required">필수</em></label>
                           <input type="text" name="orderPhon" id="orderPhon"
                              required="required" />
                                <div class="eheck_font" id="phone_check"></div>
                        </div>
                        <div class="col-sm-12">
                           <label for="orderCall">전화번호</label> <select>
                              <option value="02">02</option>
                              <option value="031">031</option>
                              <option value="032">032</option>
                              <option value="033">033</option>
                              <option value="041">041</option>
                              <option value="042">042</option>
                              <option value="043">043</option>
                              <option value="050">050</option>
                              <option value="051">051</option>
                              <option value="052">052</option>
                              <option value="053">053</option>
                              <option value="054">054</option>
                              <option value="055">055</option>
                              <option value="061">061</option>
                              <option value="062">062</option>
                              <option value="063">063</option>
                              <option value="064">064</option>
                              <option value="070">070</option>
                              <option value="0502">0502</option>
                              <option value="0503">0503</option>
                              <option value="0504">0504</option>
                              <option value="0505">0505</option>
                              <option value="0506">0506</option>
                              <option value="0507">0507</option>
                              <option value="0130">0130</option>
                           </select> <input id="orderCall2" type="tel" maxlength="4" /> <input
                              id="orderCall3" type="tel" maxlength="4" />
                              <div class="eheck_font" id="home_check"></div>
                        </div>

                        <div class="col-sm-12">
                           <label for="memo">배송메세지</label> <input type="text"
                              name="orderDes" id="memo"  placeholder="직접입력"/>
                        </div>
                     </div>

                     <div class="col-sm-12">
                        <hr>
                        <h4 class="odTitle">결제수단선택</h4>
                        <div class="payList">
                           <div class="col-sm-12">
                              <div class="socialsPay">
                                 <div class="kakaoPay">
                                    <img
                                       src="/resources/images/cart/kakaoPay.jpg">
                                    <p><input type="radio" name="chk_info" value="kakao" checked><span class="vt_al" >카카오페이</span></p>
                                 </div>
                                 <div class="bankBook">
                                    <img
                                       src="/resources/images/cart/bankBook.jpg">
                                    <p><input type="radio" name="chk_info" value="credit"><span class="vt_al">신용카드</span></p>
                                 </div>
                              </div>
                              <div class="kakaoInfo">
                                 <h5>카카오페이 안내</h5>
                                 <ul class="kakaoList">
                                    <li>- 카카오페이 결제 시 공인인증서 없이 30만원 이상 결제 가능합니다.</li>
                                    <li>- 카카오톡 안에서 개인카드(신용/체크)를 등록하여 다양한 곳에서 결제 시 <br>&nbsp;&nbsp;간단하게
                                       비밀번호만으로 결제할 수 있는 모바일 결제서비스입니다.
                                    </li>
                                    <li>- 본인명의 핸드폰에서 본인명의 카드로만 등록 후 사용 가능합니다.</li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!--row-->
               </form>
            </div>
            <!--orderInfo-->
         </div>
         <!--col-sm-8-->

         <div class="col-sm-4 col-md-3 smOrder">
            <div class="orderRight">
               <div class="orderRightTop">
                  <div class="orderH1">
                     <h1>결제정보</h1>
                  </div>
                  <div class="totalRight">
                     <strong class="pay">총 결제예정금액</strong> <span> <em><fmt:formatNumber
                              pattern="###,###,###" value="${sum}" /> </em>원
                     </span>
                  </div>
               </div>

               <div class="order-agree">
                  <h5>주문동의</h5>
                  <p>
                     주문할 상품의 상품명, 상품가격, 배송정보를 확인하였으며, 구매에 동의하겠습니까? <br>(전자상거래법
                     제8조 2항)
                  </p>
                  <p>주문제작상품의 경우, 교환/반품이 불가능 하다는 내용을 확인하였으며 이에 동의합니다.</p>
                  <td class="checkAgree">
                     <div class="checkbox">
                        <label> <input name="agree" type="checkbox" value="">
                           <span class="cr"><i
                              class="cr-icon glyphicon glyphicon-ok"></i></span> <span class="crP">동의합니다.</span>
                        </label>
                     </div>
                  </td>
               </div>
            
               <div class="button">
                  <button type="button" id="orderBtn"
                     class="btn btn-primary btn-lg btnOrder order_btn">결제하기</button>
               </div>
            </div>
         </div>
         <!--col-sm-4-->

      </div>
      <!--row-->
   </div>
   <!--container-->

   <!-- footer -->
   <div class="footer">
      <%@ include file="../include/footer2.jsp"%>
   </div>
   <!--footer-->


   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script>
      // 우편번호 찾기 화면을 넣을 element
      var element_layer = document.getElementById('layer');

      function closeDaumPostcode() {
         // iframe을 넣은 element를 안보이게 한다.
         element_layer.style.display = 'none';
      }

      function sample2_execDaumPostcode() {
         new daum.Postcode(
               {
                  oncomplete : function(data) {
                     // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                     // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                     var addr = ''; // 주소 변수
                     var extraAddr = ''; // 참고항목 변수

                     //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                     if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                     } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                     }

                     // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                     if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== ''
                              && /[동|로|가]$/g.test(data.bname)) {
                           extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== ''
                              && data.apartment === 'Y') {
                           extraAddr += (extraAddr !== '' ? ', '
                                 + data.buildingName
                                 : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                           extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample2_extraAddress").value = extraAddr;

                     } else {
                        document.getElementById("sample2_extraAddress").value = '';
                     }

                     // 우편번호와 주소 정보를 해당 필드에 넣는다.
                     document.getElementById('sample2_postcode').value = data.zonecode;
                     document.getElementById("sample2_address").value = addr;
                     // 커서를 상세주소 필드로 이동한다.
                     document.getElementById("sample2_detailAddress")
                           .focus();

                     // iframe을 넣은 element를 안보이게 한다.
                     // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                     element_layer.style.display = 'none';
                  },
                  width : '100%',
                  height : '100%',
                  maxSuggestItems : 5
               }).embed(element_layer);

         // iframe을 넣은 element를 보이게 한다.
         element_layer.style.display = 'block';

         // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
         initLayerPosition();
      }

      // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
      // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
      // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
      function initLayerPosition() {
         var width = 350; //우편번호서비스가 들어갈 element의 width
         var height = 500; //우편번호서비스가 들어갈 element의 height
         var borderWidth = 5; //샘플에서 사용하는 border의 두께

         // 위에서 선언한 값들을 실제 element에 넣는다.
         element_layer.style.width = width + 'px';
         element_layer.style.height = height + 'px';
         element_layer.style.border = borderWidth + 'px solid';
         // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
         element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
               + 'px';
         element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
               + 'px';
      }
   </script>

   


   <script>
      
      $(".order_btn").click(function() {
         var check = $('input:checkbox[name="agree"]').is(":checked")
         var checkKakao = $('input:radio[value="kakao"]').is(":checked")
         var checkCredit = $('input:radio[value="credit"]').is(":checked")
         if (check && checkKakao ) {
            
            var inval_Arr = new Array(3).fill(false);

               // 이름 정규식
               if (nameJ.test($('#orderRec').val())) {
                  inval_Arr[0] = true;
               } else {
                  inval_Arr[0] = false;
                  alert('이름을 확인하세요.');
                  return false;
               }

               // 휴대폰번호 정규식
               if (phoneJ.test($('#orderPhon').val())) {
                  console.log(phoneJ.test($('#orderPhon').val()));
                  inval_Arr[1] = true;
               } else {
                  inval_Arr[1] = false;
                  alert('휴대폰 번호를 확인하세요.');
                  return false;
               }
               
               // 주소 정규식
               if (nameJ.test($('#sample2_address').val())) {
                  inval_Arr[2] = true;
               } else {
                  inval_Arr[2] = false;
                  alert('주소를 확인하세요.');
                  return false;
               }

               //전체 유효성 검사
               var validAll = true;
               for(var i = 0; i < inval_Arr.length; i++){
                  if(inval_Arr[i] == false){
                     validAll = false;
                  }
               }
            IMP.init('imp65251784');
            IMP.request_pay({
               pg : 'kakao', // version 1.1.0부터 지원.
               pay_method : 'card',
               merchant_uid : 'merchant_' + new Date().getTime(),
               name : '주문명:결제테스트',
               amount : '${sum}', //판매 가격
               buyer_email : '이메일 : ',
               buyer_name : '구매자 : ',
               buyer_tel : '연락처 : ',
               buyer_addr : '주소 : ',
               buyer_postcode : '우편주소 :'
            }, function(rsp) {
               if (rsp.success) {
                  var msg = '결제가 완료되었습니다.';
                  $('#orderform').submit();
                  window.location = "/shop/orderdetail";
               } else {
                  var msg = '결제에 실패하였습니다.';
                  msg += '에러내용 : ' + rsp.error_msg;
                  window.location = "/shop/cartList";
               }
               alert(msg);
            });
         }
         else if(check && checkCredit) {
            IMP.init('imp04913315');
            IMP.request_pay({
                pg : 'inicis', // version 1.1.0부터 지원.
                pay_method : 'card',
                merchant_uid : 'merchant_' + new Date().getTime(),
                name : '${goods_name} 외  ${count-1}개',
                amount : '${sum}',
                buyer_email : 'iamport@siot.do',
                buyer_name : '구매자이름',
                buyer_tel : '연락처',
                buyer_addr : '주소',
                buyer_postcode : '123-456',
                m_redirect_url : 'https://www.yourdomain.com/payments/complete'
            }, function(rsp) {
               if (rsp.success) {
                  var msg = '결제가 완료되었습니다.';
                  $('#orderform').submit();
                  window.location = "/shop/orderdetail";
               } else {
                  var msg = '결제에 실패하였습니다.';
                  msg += '에러내용 : ' + rsp.error_msg;
                  window.location = "/shop/cartList";
               }
               alert(msg);
            });
         }
         else {
            vaildCheck();
            var msg = '동의란에 체크해주셔야 결제 가능합니다';
            msg;
            alert(msg);
         }

      });
      
      
      
   </script>



</body>

</html>