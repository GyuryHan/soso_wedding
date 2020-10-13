<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
  <!-- 합쳐지고 최소화된 최신 CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/main/header-footer.css">
 
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>mypage-password</title>

    <style>

h2.subTitle4{
    color: #ECA4A6;
    font-weight: 700;
    font-size: 1.7em;
}
legend{
    color: #ECA4A6;
}
s
.tableTypeWrite {
    padding: 14px 0;
    border-top: 1px solid #222;
    border-bottom: 1px solid #dcdcdc;
}
div {
    display: block;
}
body{
overflow-x: hidden;
    height: 100%;
    color: #807F89;
    font: 16px/1.5 'notoR', '맑은 고딕', '돋움', sans-serif;
    letter-spacing: -.06em;
}
.one{
    border-bottom:0 solid #e5e5e5;
    margin-bottom: 200px;
}
    </style>
</head>
 <script type="text/javascript">
      $(document).ready(function(){
      
      
         $("#submit").on("click", function(){
            if($("#userPass").val()==""){
               alert("비밀번호를 입력해주세요.");
               $("#userPass").focus();
               return false;
            }
            $.ajax({
               url : "/member/passChk",
               type : "POST",
               dateType : "json",
               data : $("#delForm").serializeArray(),
               success: function(data){
                  
                  if(data==true){
                     alert("비밀번호가 확인되었습니다.");
                     window.location.href="memberUpdateView"
                  }else{
                     alert("패스워드가 틀렸습니다.");
                     return;
                  }
               }
            })
            
         });
         
            
         
      })
   </script>
<body>
    <div class="container">
      <!-- 회원 header -->
    <div class="header">
       <%@ include file="../include/header2.jsp" %>
    </div><!--header-->

    <section class="contents">

        <h2 class="subTitle4">비밀번호 재확인</h2>
        <p>
            회원님의 개인정보 보호를 위해 비밀번호를 입력해주세요.<br>
            소소웨딩은 회원님의 개인정보를 신중히 취급하며, 회원님의 동의 없이는 회원정보가 공개되지 않습니다.<br>
            보다 다양한 혜택/서비스를 받으시려면 회원 정보를 최신으로 유지해주세요.
        </p>
        
        <fieldset class="pwdInputField">
            <legend>비밀번호 입력</legend>
            
            <form  method="post" novalidate="novalidate" action="/member/memberPassChkView" method="post" id="delForm">
               <input class="form-control" type="hidden" id="userId" name="userId" value="${member.userId}" readonly="readonly"/>      
                <label for="passch" class="titLabel">비밀번호</label>

                <input type="password" id="userPass" name="userPass" >
                
                
               <button class="btnType3m" type="button" id="submit" >확인</button>
                <c:if test="${msg == false}">
               비밀번호가 맞지 않습니다.
            </c:if>
                <!-- 확인 클릭하면 11-1-1page (회원정보수정) 로 이동하게 해주세요-->
                <!-- ***비밀번호가 일치하지 않으면 alert? 그걸로 뜨게 해주세요~ -->
                <hr class="one">

            </form>
            
        </fieldset>
        
    </section>



 <!-- footer -->
 <div class="footer">
  <div class="row">
    <div class="col-sm-6">
      <p id="info">
        (주)소소웨딩<br>
        서울시 마포구 백범로 23 | 서울 마포구 신수동 63-14<br>
        사업자등록번호 120-10-4999<br>
        Copyright (c) 비트캠프 All rights reserved.
        </p>
    </div>
    <div class="col-sm-6">
      <p id="phoneNumber">010-6658-1111</p>
      <p id="phoneImage">☎고객상담</p>
    </div>
  </div>
</div><!--footer-->
    </div><!--container-->
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>