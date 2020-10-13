
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

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
               <!-- 상세내용 -->
                <div class="inputArea">
                  <label for="prod_comp">상품구성</label> <input type="text"
                     id="prod_comp" name="prod_comp" />
               </div>
                <div class="inputArea">
                  <label for="prod_per">제작기간</label> <input type="text"
                     id="prod_per" name="prod_per" />
               </div>
                <div class="inputArea">
                  <label for="standard">규격</label> <input type="text"
                     id="standard" name="standard" />
               </div>
                <div class="inputArea">
                  <label for="m_invit">모바일청첩장</label> <input type="text"
                     id="m_invit" name="m_invit" />
               </div>
               <div class="inputArea">
                  <label for="i_concept">컨셉</label> <input type="text"
                     id="i_concept" name="i_concept" />
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