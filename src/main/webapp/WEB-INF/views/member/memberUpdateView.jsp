<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>mypage modify</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/main/header-footer.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 부트스트랩 -->
<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
window.onload = function() {
   chked();
   chked2();
   }

function chked(){

   var chkbox = document.getElementsByName("verify");
   var chkboxLen = chkbox.length;
   
   for(var i=0;i < chkboxLen ; i++){ 

   if(chkbox[i].value == ${member.verify}){

   chkbox[i].checked = true;
   }
   }
   }

   
function chked2(){

   var chkbox = document.getElementsByName("gender");
   var chkboxLen = chkbox.length;
   if (chkboxLen == null || isNaN(chkboxLen)) return;
   var gender='<c:out value="${member.gender}"/>'
   for(var i=0;i < chkboxLen ; i++){ 
         
         
   if(chkbox[i].value == gender){

   chkbox[i].checked = true;
   }
   }
   }

   </script>

<script type="text/javascript">
   
//모든 공백 체크 정규식
var empJ = /\s/g;
//아이디 정규식
var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
// 비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/;
// 이름 정규식
var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
// 이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/
var birthJ = false;
   var address = $('#detailaddress');
      $(document).ready(function() {
   var address = $('#detailaddress');




//아이디 중복확인
$("#userId").blur(function() {
   if($('#userId').val()==''){
      $('#id_check').text('아이디를 입력하세요.');
      $('#id_check').css('color', 'red');
   }
   else if(idJ.test($('#userId').val())!=true){
      $('#id_check').text('4~12자의 영문, 숫자만 사용 가능합니다.');
      $('#id_check').css('color', 'red');
   } 
   else if($('#userId').val()!=''){
      var mem_id=$('#userId').val();
      $.ajax({
         async : true,
         type : 'POST',
         data : {"userId" : $("#userId").val()},
         url : 'member/idChk',
         dateType: 'json',
         contentType: "application/json; charset=UTF-8",
         success : function(data) {
            if(data.cnt > 0){
               $('#id_check').text('중복된 아이디 입니다.');
               $('#id_check').css('color', 'red');
               $("#usercheck").attr("disabled", true);
            }else{
               if(idJ.test(userId)){
                  $('#id_check').text('사용가능한 아이디 입니다.');
                  $('#id_check').css('color', 'blue');
                  $("#usercheck").attr("disabled", false);
               }
               else if(userId==''){
                  $('#id_check').text('아이디를 입력해주세요.');
                  $('#id_check').css('color', 'red');
                  $("#usercheck").attr("disabled", true);
               }
               else{
                  $('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
                  $('#id_check').css('color', 'red');
                  $("#usercheck").attr("disabled", true);
               }
            }
         }
      });//ajax///
   }//else if
});//blur

$(document).ready(function(){
   // 취소
   $(".cencle").on("click", function(){
      
      location.href = "/";
                
   })
   
   $(".delete").on("click",function(){
      location.href = "/member/memberDeleteView";
   })
$('form').on('submit',function(){
   
   var inval_Arr = new Array(4).fill(false);

   // 비밀번호가 같은 경우 && 비밀번호 정규식
   if (($('#userPass').val() == ($('#userPass2').val()))
         && pwJ.test($('#userPass').val())) {
      inval_Arr[0] = true;
   } else {
      inval_Arr[0] = false;
      alert('비밀번호를 확인하세요.');
      return false;
   }

   // 이메일 정규식
   if (mailJ.test($('#email').val())){
      console.log(phoneJ.test($('#email').val()));
      inval_Arr[1] = true;
   } else {
      inval_Arr[1] = false;
      alert('이메일을 확인하세요.');
      return false;
   }

   // 휴대폰번호 정규식
   if (phoneJ.test($('#phone').val())) {
      console.log(phoneJ.test($('#phone').val()));
      inval_Arr[2] = true;
   } else {
      inval_Arr[2] = false;
      alert('휴대폰 번호를 확인하세요.');
      return false;
   }

   //주소확인
   if(address.val() == ''){
      inval_Arr[3] = false;
      alert('주소를 확인하세요.');
      return false;
   }else
      inval_Arr[3] = true;

   //전체 유효성 검사
   var validAll = true;
   for(var i = 0; i < inval_Arr.length; i++){
      if(inval_Arr[i] == false){
         validAll = false;
      }
   }

   if(validAll == true){ // 유효성 모두 통과
      alert('정보수정이 완료되었습니다.');
   } else{
      alert('정보를 다시 확인하세요.')
   }
});
});

$('#userId').blur(function() {
   if (idJ.test($('#userId').val())) {
      console.log('true');
      $('#id_check').text('');
   } else {
      console.log('false');
      $('#id_check').text('5~20자의 영문 소문자, 숫자와 특수기호만 사용 가능합니다.');
      $('#id_check').css('color', 'red');
   }
});

$('#userPass').blur(function() {
   if (pwJ.test($('#userPass').val())) {
      console.log('true');
      $('#pw_check').text('');
   } else {
      console.log('false');
      $('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
      $('#pw_check').css('color', 'red');
   }
});

//1~2 패스워드 일치 확인
$('#userPass2').blur(function() {
   if ($('#userPass').val() != $(this).val()) {
      $('#pw2_check').text('비밀번호가 일치하지 않습니다.');
      $('#pw2_check').css('color', 'red');
   } else {
      $('#pw2_check').text('');
   }
});

//이름에 특수문자 들어가지 않도록 설정
$("#userName").blur(function() {
   if (nameJ.test($(this).val())) {
      console.log(nameJ.test($(this).val()));
      $("#name_check").text('');
   } else {
      $('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
      $('#name_check').css('color', 'red');
   }
});

$("#email").blur(function() {
   if (mailJ.test($(this).val())) {
      $("#email_check").text('');
   } else {
      $('#email_check').text('이메일 양식을 확인해주세요.');
      $('#email_check').css('color', 'red');
   }
});

// 생일 유효성 검사
var birthJ = false;

// 생년월일 birthJ 유효성 검사

$('#birth').blur(function(){
   var dateStr = $(this).val();
   var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
   var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
   var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
   var today = new Date(); // 날짜 변수 선언
   var yearNow = today.getFullYear(); // 올해 연도 가져옴
   if (dateStr.length <=8) {
      // 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
      if (year > yearNow || year < 1900 ){
         $('#birth_check').text('생년월일을 확인해주세요');
         $('#birth_check').css('color', 'red');
      }
      else if (month < 1 || month > 12) {
         $('#birth_check').text('생년월일을 확인해주세요 ');
         $('#birth_check').css('color', 'red');
      }else if (day < 1 || day > 31) {
         $('#birth_check').text('생년월일을 확인해주세요 ');
         $('#birth_check').css('color', 'red');
      }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
         $('#birth_check').text('생년월일을 확인해주세요 ');
         $('#birth_check').css('color', 'red');
      }else if (month == 2) {
         var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
         if (day>29 || (day==29 && !isleap)) {
            $('#birth_check').text('생년월일을 확인해주세요 ');
            $('#birth_check').css('color', 'red');
         }else{
            $('#birth_check').text('');
            birthJ = true;
         }
      }else{
         $('#birth_check').text('');
         birthJ = true;
      }//end of if
   }else{
      //1.입력된 생년월일이 8자 초과할때 : auth:false
      $('#birth_check').text('생년월일을 확인해주세요 ');
      $('#birth_check').css('color', 'red');
   }
}); //End of method /*

// 휴대전화

$('#phone').blur(function(){
   if(phoneJ.test($(this).val())){
      console.log(nameJ.test($(this).val()));
      $("#phone_check").text('');
   } else {
      $('#phone_check').text('휴대폰번호를 확인해주세요 ');
      $('#phone_check').css('color', 'red');
   }
});
});

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
<style>
body {
   font-family: 'Noto Sans KR', sans-serif;
   font-size: 1.2em;
   line-height: 1.5em;
   margin: 0px;
   color: #666;
}

h2 {
   font-size: 2em;
   line-height: 0.5em;
   color: #ECA4A6;
   font-family: 'Noto Sans KR', sans-serif;
   display: inline;
   /* margin-top: 20px; */
}

h3 {
   font-size: 1.5em;
   line-height: 0.5em;
   color: #807F89;
   font-family: 'Noto Sans KR', sans-serif;
   display: inline;
}

h5 {
   font-size: 2.5em;
   line-height: 0.1em;
   color: #807F89;
   font-family: 'Noto Sans KR', sans-serif;
   display: inline;
}

a {
   color: #807F89;
   text-decoration: none
} /* a:link a tag 기본 */
a:hover {
   color: #F9D5D3;
} /* 마우스오버 link*/
a:active {
   color: #BBC7BA;
} /* 선택된 link*/
/* a:visited {color:#000} */

/*d*/
body {
   background-color: #fff;
   margin: 0px;
}

ul li {
   list-style: none; /*텍스트가로정렬*/
   display: inline;
}
/* 버튼 기본설정*/

/*div 기본설정*/
.d-div {
   border: 0px solid red;
   position: relative;
   clear: both;
   padding: 0px;
   margin: 0px;
   background-color: none;
}

.d-div:after {
   content: '';
   display: block;
   clear: both;
   height: 0;
   visibility: hidden;
}

/*회원구분+가입양식*/
.sign {
   border: 0px solid #ECA4A6;
   width: 1200px;
   margin: 0 auto;
   margin-top: 25px;
}

.sign h5 {
   font-size: 1.3em;
   padding: 20px;
   line-height: 2em;
}

.hr1 {
   margin: 20px auto 10px;
   border: 1px solid #8887A2;
}

.hr2 {
   margin: 15px auto 15px;
}

.sign-text {
   border: 0px solid red;
   float: left;
}

.sign-input {
   border: 0px solid black;
   width: 800px;
   margin: auto;
   padding: 0px;
}

.sign-input .c-button {
   background:#fff;
   border-color:#ccc
   
   
}
.sign-input .c-button:hover{
  border-color: #ECA4A6;
  color:#fff;
  background-color: #ECA4A6;
  outline:0;
}
.ia {
   padding: 8px;
   margin-right: 15px;
}

.ib {
   padding: 6px;
   width: 55px;
   height: 31px;
}

.ib2 {
   padding: 6px;
   width: 100px;
   height: 31px;
}

.sign select {
   padding: 6px;
}

/*체크박스 설정*/
input[id="cb1"]+label {
   display: inline-block;
   width: 20px;
   height: 20px;
   border: 1px solid #666;
   cursor: pointer;
   position: relative;
   top: 5px;
   left: 5px;
   margin-right: 8px;
}

input[id="cb1"]:checked+label {
   background-color: #666666;
}

input[id="cb1"] {
   display: none;
}

input[id="cb2"]+label {
   display: inline-block;
   width: 20px;
   height: 20px;
   border: 1px solid #666;
   cursor: pointer;
   position: relative;
   top: 5px;
   left: 5px;
   margin-right: 8px;
}

input[id="cb2"]:checked+label {
   background-color: #666666;
}

input[id="cb2"] {
   display: none;
}

input[id="cb3"]+label {
   display: inline-block;
   width: 20px;
   height: 20px;
   border: 1px solid #666;
   cursor: pointer;
   position: relative;
   top: 5px;
   left: 5px;
   margin-right: 8px;
}

input[id="cb3"]:checked+label {
   background-color: #666666;
}

input[id="cb3"] {
   display: none;
}

input[id="cb4"]+label {
   display: inline-block;
   width: 20px;
   height: 20px;
   border: 1px solid #666;
   cursor: pointer;
   position: relative;
   top: 5px;
   left: 5px;
   margin-right: 8px;
}

input[id="cb4"]:checked+label {
   background-color: #666666;
}

input[id="cb4"] {
   display: none;
}

input[id="cb5"]+label {
   display: inline-block;
   width: 20px;
   height: 20px;
   border: 1px solid #666;
   cursor: pointer;
   position: relative;
   top: 5px;
   left: 12px;
   margin-right: 15px;
}

input[id="cb5"]:checked+label {
   background-color: #666666;
}

input[id="cb5"] {
   display: none;
}

/* 취소.수정 버튼 */
.btn_member_cancel, .btn_comfirm_js_btn_join, .btn_leave {
   background-color: #ECA4A6;
   border: none;
   border-radius:3px 10px;
   color: white;
   padding: 8px 15px;
   text-decoration: none;
   /* display: inline-block; */
   font-size: 14px;
   margin: 5px 2px;
   cursor: pointer;
}

.btn_center_box {
   text-align: right;
}

/* 회원탈퇴  */
.memberLeave {
   margin: 80px 0 0;
   padding: 40px 0;
   background: #f3f3f3;
   text-align: center;
   color: #222;
   font-size: 14px;
}

.btnType7s {
   height: 32px;
   line-height: 30px;
   padding: 0;
   color: #ECA4A6;
   font-size: 14px;
   font-weight: bold;
   margin: 0 4px 0 10px;
   box-sizing: border-box;
   border:none;
   background:#f3f3f3;
}
#ip-al{
padding:0px 0px 0px 3px; margin-right:20px;
}
#ip-al2{
padding:0px 0px 0px 3px;
}
</style>
</head>


<body>

   <div class="container">
      <!-- 회원 header -->
      <div class="header">
         <%@ include file="../include/header2.jsp" %>
    </div><!--header-->
<form action="/member/memberUpdateView" method="post" role="form"
            id="usercheck" name="member">
      <div class="sign">
         <h2 style="margin-right: 35px;">
            <b>회원정보 관리</b>
         </h2>
         <hr class="hr1">
         
         <h3 style="margin-right: 30px;">사용자구분</h3>
         <input type="checkbox" id="verify" name="verify" value="1" disabled="disabled"><h5 id = "ip-al">일반</h5>
         <input type="checkbox" id="verify" name="verify" value="0" disabled="disabled"><h5 id = "ip-al2">사업자</h5>
         <hr class="hr1">
         <br>
         
         <h3>기본정보</h3>
         <hr class="hr1">

         <div class="sign-text">
            <h5 style="line-height: 3em;">
               아이디<span style="color: red;">*</span>
            </h5>
         </div>
         
         <div class="sign-input">
            <input type="text" class="ia" id="userId" name="userId"
               value="${member.userId}" readonly="readonly" />
            <div class="eheck_font" id="id_check"></div>
            <!-- (영문 소문자/숫자 , 4~16자) -->
         </div>
         <hr class="hr2">

         <div class="sign-text">
            <h5 style="line-height: 2.5em;">
               비밀번호 변경<span style="color: red;">*</span>
            </h5>
         </div>
         <div class="sign-input">
            <input type="password" class="ia" id="userPass" name="userPass">
            <div class="eheck_font" id="pw_check"></div>
         </div>
         <hr class="hr2">

         <div class="sign-text">
            <h5 style="line-height: 2.5em;">
               비밀번호 확인<span style="color: red;">*</span>
            </h5>
         </div>
         
         <div class="sign-input">
            <input type="password" class="ia" id="userPass2" name="userPass2">
            <div class="eheck_font" id="pw2_check"></div>
         </div>
         <hr class="hr2">
         <!-- 비밀번호 틀릴 경우 alert창 나오게 해주세요 -->

         <div class="sign-text">
            <h5 style="line-height: 2.5em;">
               이름<span style="color: red;">*</span>
            </h5>
         </div>
         <div class="sign-input">
            <input type="text" class="ia" id="userName" name="userName"
               value="${member.userName}" readonly="readonly" />
            <div class="eheck_font" id="name_check"></div>
         </div>
         <hr class="hr2">

         <div class="sign-text">
            <h5 style="line-height: 2.5em;">
               이메일 주소<span style="color: red;">*</span>
            </h5>
         </div>
         <div class="sign-input">
         <input type="email" class="ia" id="email" name="email" required="required" />
                                <div class="eheck_font" id="email_check"></div>
            
         </div>
         <hr class="hr2">

         <div class="sign-text">
            <h5 style="line-height: 8.5em;">
               주소<span style="color: red;">*</span>
            </h5>
         </div>
         <div class="sign-input">
            <input class="ib" name="oaddress" id="oaddress" type="text"
               readonly="readonly" />&nbsp;-&nbsp;
            <button type="button" class="btn c-button"
               onclick="execPostCode();">
               <i class="fa fa-search"></i> 우편번호
            </button>


            <div>
               <input class="ia" style="margin-top: 10px; width: 300px;"
                  name="address" id="address" type="text" readonly="readonly">기본주소(도로명주소)
            </div>

            <div>
               <input class="ia" name="detailaddress"
                  style="margin-top: 10px; width: 300px;" id="detailaddress"
                  type="text">상세주소
            </div>
         </div>
         
         <hr class="hr2">

         <div class="sign-text">
            <h5 style="line-height: 1.7em;">
               휴대전화<span style="color: red;">*</span>
            </h5>
         </div>
         <div class="sign-input">
            <input type="tel" class="ib2" id="phone" name="phone">
            <div class="eheck_font" id="phone_check"></div>
         </div>
         <hr class="hr2">

         <h3 style="line-height: 2em;">추가정보</h3>
         <hr class="hr1" style="margin: 10px auto 10px;">
         <br>
         
         <div class="sign-text">
            <h5>
               생년월일<span style="color: red;">*</span>
            </h5>
         </div>
         
         <div class="sign-input">
            
              <input type="tel" class="ib2" id="birth" name="birth"
                                     value="${member.birth}" readonly="readonly" />
                                <div class="eheck_font" id="birth_check"></div>

         </div>
         
         <hr class="hr2">

         <h5 style="margin-right: 30px;">성별</h5>
         <input type="checkbox" id="gender" name="gender" value="남" disabled="disabled"><h5 id = "ip-al">남</h5>
         <input type="checkbox" id="gender" name="gender" value="여" disabled="disabled"><h5 id = "ip-al2">여</h5>
         
         <hr class="hr1">

      </div>

      <div class="btn_center_box">
         <button type="button" class="btn_member_cancel cencle">취소</button>
         <button type="submit" class="btn_comfirm_js_btn_join ">수정</button>
         
         <!-- 취소랑 정보수정은 버튼만 만들었습니다 -->
         <!-- 취소 누르면 홈화면(main_1-2)으로 가게 해주세요 -->
      </div>
</form>
      <div class="memberLeave">
         <p>
            소소웨딩 회원 탈퇴를 원하십니까?
            <button type="button" class="delete btnType7s">회원탈퇴</button>

            <!-- 클릭하면 탈퇴페이지로 이동합니다 -->
         </p>
      </div>

      <!-- footer -->
      <div class="footer">
         <div class="row">
            <div class="col-sm-6">
               <p id="info">
                  (주)소소웨딩<br> 서울시 마포구 백범로 23 | 서울 마포구 신수동 63-14<br>
                  사업자등록번호 120-10-4999<br> Copyright (c) 비트캠프 All rights
                  reserved.
               </p>
            </div>
            <div class="col-sm-6">
               <p id="phoneNumber">010-6658-1111</p>
               <p id="phoneImage">☎고객상담</p>
            </div>
         </div>
      </div>
      <!--footer-->
   </div>
   <!--container-->

   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>