<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <link rel="stylesheet" href="/resources/css/main/header-footer.css">
    <link rel="stylesheet" href="/resources/css/board/community.css">
    <title> community menu</title>

    <style>

    .halfback {
    background-image: url(../resources/images/border/halfback.jpg);
}
.content{
cursor:pointer;}
    </style>

</head>

<body>
    <!-- 회원 header -->
    <div class="container">
        <div class="header">
            <%@ include file="../include/header2.jsp"%>
        </div>
        <!--header-->

        <!-- MAIN (Center website) -->
        <div class="main">
            <div class="halfback">

                <h1> 커뮤니티 </h1>
                <!-- <hr> -->

                <h2> for your happy wedding day! </h2>
                <h5> 소소웨딩과 함께하는 모든 분들의 소통 공간입니다<br>
                    커뮤니티에서는 소소웨딩의 최신 소식들을 알아보실 수 있고<br> 
                    Q & A 게시판과 자유게시판을 이용하실 수 있습니다 </h5>


            </div>
            <hr class="one">

            <!-- Portfolio Gallery Grid -->
            <div class="row">
                <div class="quotes">
                    <div class="col-sm-4">
                        <div class="content" onclick="location.href='/board/notices'">
                            <img src="../resources/images/border/notice.png" alt="공지사항" style="width:100%">
                            <h3> 공지사항 </h3>
                            <!-- <p>소소웨딩의 최신 소식들을 전해드립니다</p> -->
                        </div>
                    </div>
                   
                    <div class="col-sm-4">
                        <div class="content" onclick="location.href='/qnaboard/list'">
                            <img src="../resources/images/border/qna.JPG" alt="큐엔에이" style="width:100%">
                            <h3> Q & A </h3>
                            <!-- <p>소소웨딩에게 궁금한 점을 물어봐주세요^^ <br>친절하게 답변해드립니다</p> -->
                        </div>
                    </div>
                    
                    <div class="col-sm-4">
                        <div class="content" onclick="location.href='/board/list'">
                            <img src="../resources/images/border/free.jpg" alt="자유게시판" style="width:100%">
                            <h3> 자유게시판 </h3>
                            <!-- <p> 정보 공유 , 일상 이야기 등 자유롭게<br> 소통하는 공간입니다</p> -->
                        </div>
                      
                    </div>
                   
                </div>
            </div>
        </div>

        <!-- footer -->
        <div class="footer">
            <%@ include file="../include/footer2.jsp"%>
        </div>
        <!--footer-->
    </div>
    <!--container-->
</body>

</html>