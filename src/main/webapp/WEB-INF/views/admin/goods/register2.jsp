<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
<title>kubg Admin</title>

<script src="/resources/jquery/jquery-3.3.1.min.js"></script>

<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
   href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>

<script src="/resources/ckeditor/ckeditor.js"></script>


<script>

$(document).ready(function(){
	$(".category2").change(function(){
		var category =
			$(".category2 option:selected").val();
		switch (category){
	      case "101" :
	    	  $(".areacontain").load("/admin/goods/details/weddinghalldetail");
	          break;
	      case "102" :
	    	  $(".areacontain").load("/admin/goods/details/dressdetail");
	          break;
	      case "103" :
	    	  $(".areacontain").load("/admin/goods/details/hair_makeup_detail");
	          break;
	      case "104" :
	    	  $(".areacontain").load("/admin/goods/details/studiodetail");
	            break;
	      case "105" :
	    	  $(".areacontain").load("/admin/goods/details/snapshot_dvd_detail");
	          break;
	      case "106" :
	    	  $(".areacontain").load("/admin/goods/details/mendressdetail");
	          break;
	      case "107" :
	    	  $(".areacontain").load("/admin/goods/details/hanbokdetail");
	          break;
	      case "108" :
	    	  $(".areacontain").load("/admin/goods/details/bouquetdetail");
	          break;
	      case "109" :
	    	  $(".areacontain").load("/admin/goods/details/invitdetail");
	          break;
	      default :
	          alert("다시 선택해주시기 바랍니다");
	    }
	});
		
});
</script>

<style>
body {
   font-family: '맑은 고딕', verdana;
   padding: 0;
   margin: 0;
}

ul {
   padding: 0;
   margin: 0;
   list-style: none;
}

div#root {
   width: 90%;
   margin: 0 auto;
}

header#header {
   font-size: 60px;
   padding: 20px 0;
}

header#header h1 a {
   color: #000;
   font-weight: bold;
}

nav#nav {
   padding: 10px;
   text-align: right;
}

nav#nav ul li {
   display: inline-block;
   margin-left: 10px;
}

section#container {
   padding: 20px 0;
   border-top: 2px solid #eee;
   border-bottom: 2px solid #eee;
}

section#container::after {
   content: "";
   display: block;
   clear: both;
}

aside {
   float: left;
   width: 200px;
}

div#container_box {
   float: right;
   width: calc(100% - 200px - 20px);
}

aside ul li {
   text-align: center;
   margin-bottom: 10px;
}

aside ul li a {
   display: block;
   width: 100%;
   padding: 10px 0;
}

aside ul li a:hover {
   background: #eee;
}

footer#footer {
   background: #f9f9f9;
   padding: 20px;
}

footer#footer ul li {
   display: inline-block;
   margin-right: 10px;
}
</style>


<style>
.inputArea {
   margin: 10px 0;
}

select {
   width: 100px;
}

label {
   display: inline-block;
   width: 70px;
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

.select_img img {
   margin: 20px 0;
}

.inputArea #sample2_address { width:230px; }
.inputArea #sample2_detailAddress { width:280px; }
.inputArea #sample2_extraAddress { display:none; }
</style>
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>


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
         <div id="container_box">
            <h2>상품 등록</h2>
            <form role="form" method="post" autocomplete="off" action="register2"
               enctype="multipart/form-data" onsubmit="return formCheck();" id="enterForm" class="enterForm">
               
               <div class="inputArea">
                  <label>1차 분류</label> <select class="category1">
                     <option value="">전체</option>
                  </select> <label>2차 분류</label> <select class="category2" name="cateCode">
                     <option value="">전체</option>
                  </select>
               </div>
			<div class="areacontain">
               <div class="inputArea">
                  <label for="gdsName">상품명</label> <input type="text" id="gdsName"
                     name="gdsName" />
               </div>

               <div class="inputArea">
                  <label for="gdsPrice">상품가격</label> <input type="text"
                     id="gdsPrice" name="gdsPrice" />
               </div>

               <div class="inputArea">
                  <label for="gdsStock">상품수량</label> <input type="text"
                     id="gdsStock" name="gdsStock" />
               </div>
               
               <div class="inputArea">
                  <label for="comName">업체명</label> <input type="text"
                     id="comName" name="comName" />
               </div>
               <div class="inputArea">
                  <label for="comSubway">인근 지하철</label> <input type="text"
                     id="comSubway" name="comSubway" />
               </div>
               <div class="inputArea">
                  <label for="comArea">지역</label> <input type="text"
                     id="comArea" name="comArea" />
               </div>
               
               <div class="inputArea">
               <input  style="width: 40%; display: inline;"
                  placeholder="우편번호" name="oaddress" id="oaddress" type="text"
                  readonly="readonly">
               <button type="button" class="btn btn-default"
                  onclick="execPostCode();">
                  <i class="fa fa-search"></i> 우편번호 찾기
               </button>
            </div>
         
            <div class="inputArea">
               <input style="top: 5px;" placeholder="도로명 주소"
                  name="address" id="address" type="text" readonly="readonly" />
            </div>
         
            <div class="inputArea">
               <input  placeholder="상세주소" name="detailaddress"
                  id="detailaddress" type="text" />
            </div>
            

                  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                  <script>

                  //우편번호 찾기 버튼 클릭시 발생 이벤트

                  function execPostCode() {
                     new daum.Postcode({
                        oncomplete: function(data) {
                           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                           var extraRoadAddr = ''; // 도로명 조합형 주소 변수
                           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                              extraRoadAddr += data.bname;
                           }
                           // 건물명이 있고, 공동주택일 경우 추가한다.
                           if(data.buildingName !== '' && data.apartment === 'Y'){
                              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                           }
                           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                           if(extraRoadAddr !== ''){
                              extraRoadAddr = ' (' + extraRoadAddr + ')';
                           }

                           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                           if(fullRoadAddr !== ''){
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
               
               <div class="inputArea">
                  <label for="gdsDes">상품소개</label>
                  <textarea rows="5" cols="50" id="gdsDes" name="gdsDes"></textarea>

                  <script>
                     var ckeditor_config = {
                        resize_enaleb : false,
                        enterMode : CKEDITOR.ENTER_BR,
                        shiftEnterMode : CKEDITOR.ENTER_P,
                        filebrowserUploadUrl : "/admin/goods/ckUpload"
                     };

                     CKEDITOR.replace("gdsDes", ckeditor_config);
                  </script>

               </div>

               <div class="inputArea">
                  <label for="gdsImg">이미지</label> 
                  <input type="file" multiple="multiple" id="gdsImg" name="file" />
                  <div class="select_img">
                     <img src="" />
                  </div>

                  <script>
                     $("#gdsImg")
                           .change(
                                 function() {
                                    if (this.files && this.files[0]) {
                                       var reader = new FileReader;
                                       reader.onload = function(
                                             data) {
                                          $(".select_img img")
                                                .attr(
                                                      "src",
                                                      data.target.result)
                                                .width(1000);
                                       }
                                       reader
                                             .readAsDataURL(this.files[0]);
                                    }
                                 });
                  </script>

                  <%=request.getRealPath("/")%>

               </div>
               </div>

               <div class="inputArea">
                  <button type=submit id="register_Btn" class="btn btn-primary">등록</button>
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

   <script>
      // 컨트롤러에서 데이터 받기
      var jsonData = JSON.parse('${category}');

      // 필요한 배열과 오브젝트 변수 생성
      var cate1Arr = new Array();
      var cate1Obj = new Object();

      // 1차 분류 셀렉트 박스에 삽입할 데이터 준비
      for (var i = 0; i < jsonData.length; i++) {

         if (jsonData[i].level == "1") { // 레벨이 1인 데이터가 있다면 
            cate1Obj = new Object(); // 초기화

            // cate1Obj에 cateCode와 cateName를 저장
            cate1Obj.cateCode = jsonData[i].cateCode;
            cate1Obj.cateName = jsonData[i].cateName;

            // cate1Obj에 저장된 값을 cate1Arr 배열에 저장
            cate1Arr.push(cate1Obj);
         }
      }

      // 1차 분류 셀렉트 박스에 데이터 삽입
      var cate1Select = $("select.category1")
      
      var result ="result"
      for (var i = 0; i < cate1Arr.length; i++) {
         
         // cate1Arr에 저장된 값을 cate1Select에 추가
         cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
               + cate1Arr[i].cateName + "</option>");   
      }

      // 클래스가 category1인 select변수의 값이 바뀌었을 때 실행
      $(document)
            .on(
                  "change",
                  "select.category1",
                  function() {

                     // 필요한 배열과 오브젝트 변수를 생성
                     var cate2Arr = new Array();
                     var cate2Obj = new Object();

                     // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
                     for (var i = 0; i < jsonData.length; i++) {

                        if (jsonData[i].level == "2") { // 레빌이 2인 데이터가 있다면
                           cate2Obj = new Object(); // 초기화

                           // cate2Obj에 cateCode, cateName, cateCodeRef를 저장
                           cate2Obj.cateCode = jsonData[i].cateCode;
                           cate2Obj.cateName = jsonData[i].cateName;
                           cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;

                           // cate2Obj에 저장된 값을 cate2Arr 배열에 저장
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

                     // cate2Select의 값을 제거함(초기화)
                     cate2Select.children().remove();

                     // cate1Select에서 선택한 값을 기준으로 cate2Select의 값을 조정
                     $("option:selected", this)
                           .each(
                                 function() {

                                    var selectVal = $(this).val(); // 현재 선택한 cate1Select의 값을 저장

                                    cate2Select
                                          .append("<option value='" + selectVal + "'>전체</option>"); // cate2Select의 '전체'에 현재 선택한 cate1Select와 같은 값 부여

                                    // cate2Arr의 데이터를 cate2Select에 추가
                                    for (var i = 0; i < cate2Arr.length; i++) {

                                       // 현재 선택한 cate1Select의 값과 일치하는 cate2Arr의 데이터를 가져옴
                                       if (selectVal == cate2Arr[i].cateCodeRef) {
                                          cate2Select
                                                .append("<option value='" + cate2Arr[i].cateCode + "'>"
                                                      + cate2Arr[i].cateName
                                                      + "</option>");
                                       }
                                    }
                                 });

                  });
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
   
  
</body>
</html>