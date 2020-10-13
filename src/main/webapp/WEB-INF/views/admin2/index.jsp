<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>메인</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="/resources/assets/css/animate.min.css" rel="stylesheet" />

    <!--  Paper Dashboard core CSS    -->
    <link href="/resources/assets/css/paper-dashboard.css" rel="stylesheet" />


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="/resources/assets/css/demo.css" rel="stylesheet" />


    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="/resources/assets/css/themify-icons.css" rel="stylesheet">

</head>

<body>

    <div class="wrapper">
        <div class="sidebar" data-background-color="white" data-active-color="danger">

            <!--
      Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
      Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
   -->

            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="/admin2/index" class="simple-text">
                        SOSO WEDDING ADMIN
                    </a>
                </div>

                <ul class="nav">
                    <li>
                        <li class="active">
                        <a href="/admin2/index">
                            <i class="ti-panel"></i>
                            <p>MAIN</p>
                        </a>
                    </li>
                    <li>
                        <a href="/admin2/goods/notices">
                            <i class="ti-bell"></i>
                            <p>공지사항</p>
                        </a>
                    </li>

                    <li>
                        <a href="/admin2/qna/qnaList">
                            <i class="ti-pencil-alt2"></i>
                            <p>Q & A</p>
                        </a>
                    </li>

                    <li>
                        <a href="/admin2/goods/list">
                            <i class="ti-map"></i>
                            <p>상품승인</p>
                        </a>
                    </li>

                    <li>
                        <a href="/admin2/goods/boardList">
                            <i class="ti-text"></i>
                            <p>자유게시판</p>
                        </a>
                    </li>

                    <li>
                        <a href="/admin2/goods/user">
                            <i class="ti-user"></i>
                            <p>회원정보</p>
                        </a>
                    </li>
                    <li>
                        <a href="/admin2/goods/company">
                            <i class="ti-view-list-alt"></i>
                            <p>기업정보</p>
                        </a>
                    </li>
                      <li>
                        <a href="/admin2/review">
                            <i class="ti-view-list-alt"></i>
                            <p>후기게시판</p>
                        </a>
                    </li>

                </ul>
            </div>
        </div>

        <div class="main-panel">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar bar1"></span>
                            <span class="icon-bar bar2"></span>
                            <span class="icon-bar bar3"></span>
                        </button>
                    </div>

                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="/">
                                    <i class="ti-panel"></i>
                                    <p>일반화면</p>
                                </a>
                            </li>
                            <li>
                                <a href="/member/signout">
                                    <i class="ti-settings"></i>
                                    <p>로그아웃</p>
                                </a>
                            </li>
                        </ul>

                    </div>


                    <div class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-3 col-sm-6">
                                    <div class="card">
                                        <div class="content">
                                            <div class="row">
                                                <div class="col-xs-5">
                                                    <div class="icon-big icon-warning text-center">
                                                        <i class="ti-server"></i>
                                                    </div>
                                                </div>
                                                <div class="col-xs-7">
                                                    <div class="numbers">
                                                        <p>방문자</p>
                                                       <span id="getTodayCount">${getTodayCount}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="footer">
                                                <hr />
                                                <div class="stats">
                                                    <i class="ti-reload"></i> 업데이트
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6">
                                    <div class="card">
                                        <div class="content">
                                            <div class="row">
                                                <div class="col-xs-5">
                                                    <div class="icon-big icon-success text-center">
                                                        <i class="ti-wallet"></i>
                                                    </div>
                                                </div>
                                                <div class="col-xs-7">
                                                    <div class="numbers">
                                                        <p>수입</p>
                                                        <span><fmt:formatNumber value="${getToalMoneyCount}" pattern ="#,###"/>원  </span>                                                 </div>
                                                </div>
                                            </div>
                                            <div class="footer">
                                                <hr />
                                                <div class="stats">
                                                    <i class="ti-calendar"></i> 업데이트
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6">
                                    <div class="card">
                                        <div class="content">
                                            <div class="row">
                                                <div class="col-xs-5">
                                                    <div class="icon-big icon-danger text-center">
                                                        <i class="ti-pulse"></i>
                                                    </div>
                                                </div>
                                                <div class="col-xs-7">
                                                    <div class="numbers">
                                                        <p>회원</p>
                                                        <span id="getMemberCount">${getMemberCount}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="footer">
                                                <hr />
                                                <div class="stats">
                                                    <i class="ti-timer"></i> 업데이트
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6">
                                    <div class="card">
                                        <div class="content">
                                            <div class="row">
                                                <div class="col-xs-5">
                                                    <div class="icon-big icon-info text-center">
                                                        <i class="ti-twitter-alt"></i>
                                                    </div>
                                                </div>
                                                <div class="col-xs-7">
                                                    <div class="numbers">
                                                        <p>업체</p>
                                                        <span id="getCompanyCount">${getCompanyCount}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="footer">
                                                <hr />
                                                <div class="stats">
                                                    <i class="ti-reload"></i> 업데이트
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">

                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="header">
                                            <h4 class="title">방문자 수</h4>
                                            <p class="category">24시간 방문 기준</p>
                                        </div>
                                        <div class="content">
                                            <div id="chartHours" class="ct-chart"></div>
                                            <div class="footer">
                                                <div class="chart-legend">
                                                    <i class="fa fa-circle text-info"></i> 일일 방문기록
                                                    <!-- <i class="fa fa-circle text-danger"></i> Click
                                                    <i class="fa fa-circle text-warning"></i> Click Second Time -->
                                                </div>
                                                <hr>
                                                <div class="stats">
                                                    <i class="ti-reload"></i> 현시간 업데이트
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="header">
                                            <h4 class="title">가입자 수의 성별 비율</h4>
                                            <p class="category">성별을 파악하기 위한 그래프</p>
                                        </div>
                                        <div class="content">
                                            <div id="chartPreferences" class="ct-chart ct-perfect-fourth"></div>

                                            <div class="footer">
                                                <div class="chart-legend">
                                                    <i class="fa fa-circle text-info"></i> 남자
                                                    <i class="fa fa-circle text-warning"></i> 여자
                                                    <!-- <i class="fa fa-circle text-warning"></i> Unsubscribe -->
                                                </div>
                                                <hr>
                                                <div class="stats">
                                                    <i class="ti-timer"></i> 현 시간 업데이트
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="card ">
                                        <div class="header">
                                            <h4 class="title">수입</h4>
                                            <p class="category">월별 수입</p>
                                        </div>
                                        <div class="content">
                                            <div id="chartActivity" class="ct-chart"></div>

                                            <div class="footer">
                                                <div class="chart-legend">
                                                    <i class="fa fa-circle text-info"></i> 결제
                                                </div>
                                                <hr>
                                                <div class="stats">
                                                    <i class="ti-check"></i> 데이터를 통한 사이트 집계
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>


</body>

 <!--   Core JS Files   -->
    <script src="/resources/assets/js/jquery-1.10.2.js" type="text/javascript"></script>
   <script src="/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>

   <!--  Checkbox, Radio & Switch Plugins -->
   <script src="/resources/assets/js/bootstrap-checkbox-radio.js"></script>

   <!--  Charts Plugin -->
   <script src="/resources/assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="/resources/assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

    <!-- Paper Dashboard Core javascript and methods for Demo purpose -->
   <script src="/resources/assets/js/paper-dashboard.js"></script>

   <!-- Paper Dashboard DEMO methods, don't include it in your project! -->
   <!-- 
   <script src="/resources/assets/js/demo.js"></script>
    -->

<script type="text/javascript">
    $(document).ready(function () {

       // demo.initChartist();
       loadCount();
       loadVisitorCount();
       MoneyCount();
    });
    
    
  //count 
   function loadCount() {
      console.log("loadCount() 호출됨");
      $.getJSON(
         "/admin2/gender",
         function (result) {
            Chartist.Pie('#chartPreferences', {
               "labels": result.labels,
               "series": result.series
               });
            console.log(result);
         }
      );
   }
  
      //그래프
   function loadVisitorCount() {
      console.log("loadVisitorCount() 호출됨");
      $.getJSON(
         "/admin2/visitor",
         function (result) {
            console.log(result);
            var max = 0;
            for(var count of result.series[0]){
               (max < count) && (max = count);
               
            }
               console.log(max);
                 var optionsSales = {
                         lineSmooth: false,
                         low: 0,
                         high: max,
                         showArea: true,
                         height: "245px",
                         axisX: {
                           showGrid: false,
                         },
                         lineSmooth: Chartist.Interpolation.simple({
                           divisor: 3
                         }),
                         showLine: true,
                         showPoint: false,
                       };

                       var responsiveSales = [
                         ['screen and (max-width: 640px)', {
                           axisX: {
                             labelInterpolationFnc: function (value) {
                               return value[0];
                             }
                           }
                         }]
                       ];

                       Chartist.Line('#chartHours', result, optionsSales, responsiveSales);
         }
      );
   }
      
   <!-- javascript -->
   function MoneyCount() {
      console.log("MoneyCount() 호출됨");
      $.getJSON(
         "/admin2/money",
         function (data) {
            console.log(data);
   
   var options = {
       seriesBarDistance: 10,
       axisX: {
           showGrid: false
       },
       height: "250px"
   };

   var responsiveOptions = [
     ['screen and (max-width: 640px)', {
       seriesBarDistance: 5,
       axisX: {
         labelInterpolationFnc: function (value) {
           return value[0];
         }
       }
     }]
   ];

   Chartist.Line('#chartActivity', data, options, responsiveOptions);
         });
   }
</script>

</html>