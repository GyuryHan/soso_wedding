<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
   <head>
      <!-- 합쳐지고 최소화된 최신 CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <!-- 부가적인 테마 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
       
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <title>비밀번호 재확인</title>
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
      <section id="container">
         <form action="/member/memberPassChkView" method="post" id="delForm">
            <div class="form-group has-feedback">
               <label class="control-label" for="userId">아이디</label>
               <input class="form-control" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly"/>
            </div>
            <div class="form-group has-feedback">
               <label class="control-label" for="userPass">패스워드</label>
               <input class="form-control" type="password" id="userPass" name="userPass" />
            </div>
         </form>
         <div class="form-group has-feedback">
            <button class="btn btn-success" type="button" id="submit" >확인</button>
            <button class="cencle btn btn-danger" type="button">취소</button>
         </div>
         <div>
            <c:if test="${msg == false}">
               비밀번호가 맞지 않습니다.
            </c:if>
         </div>
      </section>
      
   </body>
   
</html>