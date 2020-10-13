
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


<div class="table_title table_mt">웨딩홀 세부내용 등록</div>
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
									<input type="text" id="gdsName" name="gdsName" class="chk" /><span
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
										class="chk" /><span style="color: #666; font-weight: bold"
										id="counter">(<em>0</em> / 최대 30자)
									</span>
								</div>
							</td>

						</tr>
						<tr>
							<th><label for="gdsStock">상품수량</label></th>

							<td class="td_sec">
								<div class="inputArea gdsStock">
									<input type="text" id="gdsStock" name="gdsStock" class="chk" /><span
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
									<input type="text" id="comName" name="comName" class="chk" /><span
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
									<input type="text" id="comSubway" name="comSubway" class="chk" /><span
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
									<input type="text" id="comArea" name="comArea" class="chk" /><span
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
									<input type="text" id="h_type" name="h_type" class="chk" /><span
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
									<input type="text" id="oddnum" name="oddnum" class="chk" /> <span
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
									<input type="text" id="seat" name="seat" class="chk" /><span
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
									<input type="text" id="w_type" name="w_type" class="chk" /> <span
										style="color: #666; font-weight: bold" id="counter">(<em>0</em>
										/ 최대 50자)
									</span>
								</div>
							</td>

						</tr>
						<tr>
							<th><label for="m_menu">식사메뉴</label></th>

							<td class="td_sec">
						
								<div class="inputArea m_menu">
									<input type="text" id="m_menu" name="m_menu" class="chk" /><span
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
									<input type="text" id="m_cost" name="m_cost" class="chk" /><span
										style="color: #666; font-weight: bold" id="counter">(<em>0</em>
										/ 최대 30자)
									</span>
								</div>
							</td>

						</tr>
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
							<th><label for="gdsDes">추가 설명</label></th>

							<td class="td_sec">
								<div class="inputArea gdsDes ">
									<textarea rows="5" cols="50" id="gdsDes" name="gdsDes"></textarea>
								</div>
							</td>

						</tr>
						<tr>
							<th><label for="gdsImg">이미지</label></th>
							<td class="td_sec">
								<div class="inputArea gdsImg">
									<div class="filebox">
										<label for="gdsImg">이미지 업로드</label> <input type="file"
											multiple="multiple" id="gdsImg" name="file" />
										<div class="select_img">
											<img src="" />
										</div>
									</div>
										<div class="filebox2">
										<label for="gdsImg2">이미지 업로드 2</label> <input type="file"
											multiple="multiple" id="gdsImg2" name="file" />
										<div class="select2_img">
											<img src="" />
										</div>
									</div>
									<%=request.getRealPath("/")%>
								</div>
							</td>

						</tr>


					</tbody>
				</table>

				<div class="inputArea" style="text-align:center">
					<button type="button" id="register_Btn" class="btn btn-reg">등록</button>
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
