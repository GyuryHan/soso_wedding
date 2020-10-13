
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<!DOCTYPE html>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>store2-1</title>
  <!-- 합쳐지고 최소화된 최신 CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/main/header-footer.css">
  <link rel="stylesheet" href="/resources/css/estimate/estimate.css" type="text/css">
  <link rel="stylesheet" href="/resources/css/estimate/sub-layout.css" type="text/css">
   <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
  <script type="text/javascript">
    //지역선택(페이지)
    function select_area_tab(idx,area_name)
    {
      $(".area-select li").removeClass("on");
      $(".area-select li").eq(idx).addClass("on");
    }
    
    function popup(){
        var url = "/";
        var name = "popup test";
        var option = "width = 500, height = 500, top = 100, left = 200, location = no"
        window.open(url, name, option);
    }
 </script>     
  
</head>
<body>

  <%@ include file="../include/header2.jsp"%>
    
   <!--visual-->
   <div id="estimate">
		
    <!--content-->
		<div class="common-wrapper-1">
			<div class="real-wrapper" style="padding:100px 0 100px;">
				<h3 class="st1 real_count"><span>실시간 견적 현황</span>등록된 견적서는 총 40912건입니다.</h3>
				<form name="esForm" id="content-box">
					<select name="wp_search_area" id="wp_search_area">
						<option value="">지역</option>
						<option value="강남">서울강남</option>
						<option value="강동">서울강동</option>
						<option value="강서">서울강서</option>
						<option value="강북">서울강북</option>
						<option value="인경">경기/인천</option>
						<option value="대전">대전</option>
					</select>
					<select name="wh_hall_typediv" id="wh_hall_typediv">
						<option value="">홀타입</option>
						<option value="동시예식">동시예식</option>
						<option value="분리예식">분리예식</option>
					</select>
					<select name="wp_people" id="wp_people">
						<option value="0">하객수</option>
						<option value="90">100명 미만</option>
						<option value="100">100~200명</option>
						<option value="200">200~300명</option>
						<option value="300">300~400명</option>
						<option value="400">400~500명</option>
						<option value="500">500명 이상</option>
					</select>
					<select name="ei_total" id="ei_total">
						<option value="0">견적금액</option>
						<option value="900">1,000만원 미만</option>
						<option value="1000">1,000만원대</option>
						<option value="2000">2,000만원대</option>
						<option value="3000">3,000만원대</option>
						<option value="4000">4,000만원대</option>
						<option value="5000">5,000만원 이상</option>
					</select>
					<input type="text" id="s_partner_name" title="웨딩홀명" defaultvalue="웨딩홀명" value="웨딩홀명" name="wc_name" maxlength="10" />
					<a onclick="move_page(1);">검색</a>
				</form>
        <div class="view_estimate_list yes">
          <div id="real_estimate_list">				
          <ul class="real-list-1">
            <li class="estimate-item">
              <div style="float:right; width:640px; overflow:hidden;">
                <div class="section-1">
                  <h3 class="hall">
                  
                  <a href="javascript:popup_login('/html/estimate/estimate_view.asp?ei_no=46104');">
                  
                  <span class="area">서울특별시 강남구 삼성동</span><br>소소 웨딩점</a></h3>
                  <span class="info">
                    
                    <img src="../resources/images/estimate/icon_02.gif" class="esticon">&nbsp;그랜드볼룸&nbsp;&nbsp;
                    
                    <img src="../resources/images/estimate/icon_03.gif" class="esticon">&nbsp;하객수 0명&nbsp;&nbsp;
                    
                    <img src="../resources/images/estimate/icon_04.gif" class="esticon">&nbsp;양식 기준&nbsp;&nbsp;
                    
                  </span>
                  <span class="price">2,800,000원</span>
                  <span class="date">2020-06-21 오후 6:05:23</span>
                </div>
                <div class="section-2">
                  <span class="ten-icon traffic">텐웨딩홀 교통</span>
                  <span class="score-box">
                    <img src="../resources/images/estimate/28_46_num_09.gif">
          <img src="../resources/images/estimate/28_46_num_point.gif"><img src="../resources/images/estimate/28_46_num_04.gif">
          
                    <span class="blind">9.4</span>
                  </span>
                  <span class="after">
                  <!--
                  <a href="/html/after/progress.asp">이용후기(<span class="bold">2이용후기(<span class="bold">2</span>)</a></span>
                  -->
                  <span class="bold">후기평점</span>
                  </span>
                </div>
                <span class="btn-box">
                  
                  <a href="javascript:popup_login('/html/estimate/estimate_view.asp?ei_no=46104');" class="detail">견적상세보기</a>
                  
                 
                </span>
              </div>
              <div class="photo-box">
                
                <span class="flag">EVENT</span>
               
                <img src="http://wedimg.duonet.com/gallery/gallery4439_big_67898.jpg" alt="그래머시 코엑스점" class="thumb-327">
              </div>
            </li>
          </ul>
          </div>

          </div>
				<!-- 페이지네이션 -->
        <div class="indexpagination">
          <div class="row">
              <nav class="paginationSize">
                <ul class="pagination">
                  <li>
                    <a href="#" aria-label="Previous">
                      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    </a>
                  </li>
                  <li><a href="#">1</a></li>
                  <li><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
                  <li>
                    <a href="#" aria-label="Next">
                      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    </a>
                  </li>
                </ul>
              </nav>
          </div>
        </div><!--indexpagination-->
				
			</div>
		</div>
		<!--content-->

    </div>
		<!--visual-->
   

    

     <!-- footer -->
  <div class="footer">
    <%@ include file="../include/footer2.jsp"%>
  </div>
  <!--footer-->
  

  <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</body>

</html>