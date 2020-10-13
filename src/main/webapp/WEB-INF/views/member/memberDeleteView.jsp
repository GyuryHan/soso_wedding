<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="/resources/css/main/header-footer.css">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원탈퇴</title>
      <title>회원탈퇴</title>
   </head>
   <script type="text/javascript">
      $(document).ready(function(){
         // 취소
         $(".cencle").on("click", function(){
            
            location.href = "/";
                      
         })
      
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
                     if(confirm("회원탈퇴 하시겠습니까?")){
                        $("#delForm").submit();
                     }
                  }else{
                     alert("패스워드를 다시 확인해주세요.");
                     return;
                  }
               }
            })
         });
         
            
         
      })
   </script>


<style>
      h3{
        color: #ECA4A6;
        font-family: 'Noto Sans KR', sans-serif;  
        font-weight: 700;
        font-size: 1.8em;
        line-height: 0.5em;
        padding: 10px;
        margin-top: 30px;
      }

.tableTypeWrite {
    font-family: 'Noto Sans KR', sans-serif;
    padding: 14px 0;
    border-top: 1px solid #BBC7BA;
    border-bottom: 1px solid #dcdcdc;
}
span, th, caption{
    color: #807F89;
}
caption{
    font-size: 15px;
}
.mbOutAll{
  font-family: 'Noto Sans KR', sans-serif;
  text-align: right;
  color: #99A89E;
  font-weight: bold;
  margin-top: 20px;
}
/* 탈퇴,취소 버튼 */
.btn_member_cancel,.btn_comfirm_js_btn_leave{
    background-color: #ECA4A6;
    border: none;       
    color:white;
    padding: 10px;
    text-decoration: none;
    /* display: inline-block; */
    font-size: 14px;
    margin: 5px 2px;
    cursor: pointer;
    border-radius:3px 10px;
}

.btn_center_box{
    text-align: right;
}

.mbOutRsnSel{
  margin-top: 10px;
  margin: 8px;
}

#reason{
margin-right:3px;}
    </style>
</head>
 

<body>
   <div class="container">
         <!-- 회원 header -->
      <div class="header">
         <%@ include file="../include/header2.jsp" %>
    </div><!--header-->
      <h3> 회원탈퇴 </h3>
      <form action="/member/memberDelete" method="post" id="delForm">

         <div class="tableTypeWrite">
            <table summary="온라인 회원탈퇴">
               <caption></caption>
               <colgroup>
                  <col style="width: 175px">
                  <col>
               </colgroup>
               <tbody>
                  <tr>
                     <th scope="col">비밀번호</th>
                     <td>
                     <input class="form-control" type="hidden" id="userId"
                        name="userId" value="${member.userId}" readonly="readonly" /> 
                        <input type="password" id="userPass" name="userPass" class="inputTxt"
                        title="비밀번호 입력" style="width: 210px;"> 
</td>


                  </tr>
                  <tr>
                     <th scope="col">탈퇴사유</th>

                     <td>
                        <div class="mbOutRsnSel">

                           <label class="inputRadio" for="memberLeave1"><input type="checkbox" id="reason"
                              name="reason" value="재가입을 위해 "><span>재가입을 위해</span> </label><br> 
                              <label class="inputRadio" for="memberLeave1"><input
                              type="checkbox" id="reason" name="reason" value="사이트 이용이 불편함 "><span>사이트
                           이용이 불편함</span></label><br> 
                           <label class="inputRadio" for="memberLeave1"><input type="checkbox" id="reason"
                              name="reason" value="정보가 별로 없음 "><span>정보가 별로 없음</span></label><br>
                              <label class="inputRadio" for="memberLeave1"> <input
                              type="checkbox" id="reason" name="reason"
                              value="서비스 장애가 자주발생 "><span>서비스 장애가 자주발생</span>
                              </label><br> 
                              <label class="inputRadio" for="memberLeave1"><input
                              type="checkbox" id="reason" name="reason" value="개인정보 유출 우려"><span>개인정보
                           유출 우려</span></label><br> <label class="inputRadio" for="memberLeave1"><input type="checkbox" id="reason" name="reason"
                              value="기타 "><span>기타</span></label> <br>

                        </div> <textarea id="reason" name="reason" tabindex="1"
                           title="기타 불편사항을 입력하세요." style="width: 100%; height: 120px;"></textarea>
                        <p class="letterCount">
                           <em class="colorGreen" id="charLength">0</em>/100자
                        </p>
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>
      </form>
      <p class="mbOutAll">
            회원탈퇴를 하시겠습니까?
      <div class="btn_center_box">

         <button class="btn_member_cancel cencle" type="button">취소</button>
         <button class="btn_comfirm_js_btn_leave" type="button" id="submit">탈퇴</button>
      </div>
      <div>
            <c:if test="${msg == false}">
               비밀번호가 맞지 않습니다.
            </c:if>
         </div>
      
      </p>

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