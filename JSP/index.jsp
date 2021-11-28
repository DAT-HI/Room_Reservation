<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="/assets/bootstrap-4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>  

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="/assets/bootstrap-4.4.1/js/bootstrap.min.js"></script>

<meta name="description" content="">
<meta name="author" content="">

<title>JSP_index</title>

<!-- Bootstrap core CSS -->
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<!-- Custom styles for this template -->
<link href="carousel.css" rel="stylesheet">
</head>
<!-- NAVBAR
================================================== -->
<body>

<div class="navbar-wrapper">
  <div class="container">

    <nav class="navbar navbar-inverse navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" onclick="location.href='index.jsp'">HYWU-STAY</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a onclick="location.href='room.jsp'">ROOM</a></li>
            <li><a onclick="location.href='reservation.jsp'">RESERVATION</a></li>
            <li><a onclick="location.href='reservationList.jsp'">RESERVATION CHECK</a></li>
            <li><a onclick="location.href='review.jsp'">REVIEW</a></li>

	            <%
	            String logout = request.getParameter("logout");
	            if( logout != null) //logout에 값이 들어있으면,,
	            {
	                //로그아웃을 했기 때문에, id = null 을 설정.
	                session.setAttribute("id", null);
	                session.setMaxInactiveInterval(0);
	            }
	        
	            String id = (String) session.getAttribute("id");
	            if( id == null)
	            {
	                id = "손님";
	            }
		        %>

	            <li><a><div class="log"></div></a></li>

	            <%
	                    if( id.equals("손님")){
	            %>
	                    <li><a><%= id %>님 <input type="button" value="로그인"
	                    onclick="location.href='login.jsp'"></a></li>
	            <%
	                    }
	                    else {
	            %>
	                    <li><a><%= id %>님 <input type="button" value="로그아웃"
	                    onclick="location.href='index.jsp?logout=1'"></a></li>
	            <%
	                    }
	            %>

              </ul>
        </div>
      </div>
    </nav>

  </div>
</div>


<!-- Carousel
================================================== -->


<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img class="first-slide" src="img/voirvien1.jpg" alt="First slide">
      <div class="container">
        <div class="carousel-caption">
          <h2>HYWU-STAY</h2>
          <p>당신이 찾던 가장 완벽한 숙소</p>
          <p><a class="btn btn-lg btn-primary" role="button">펜션 소개</a></p>
        </div>
      </div>
    </div>
    <div class="item">
      <img class="second-slide" src="img/voirvien2.jpg" alt="Second slide">
      <div class="container">
        <div class="carousel-caption">
          <h2>HYWU-STAY</h2>
          <p>당신이 찾던 가장 완벽한 숙소</p>
          <p><a class="btn btn-lg btn-primary" role="button">펜션 소개</a></p>
        </div>
      </div>
    </div>
    <div class="item">
      <img class="third-slide" src="img/voirvien3.jpg" alt="Third slide">
      <div class="container">
        <div class="carousel-caption">
          <h2>HYWU-STAY</h2>
          <p>당신이 찾던 가장 완벽한 숙소</p>
          <p><a class="btn btn-lg btn-primary" role="button">펜션 소개</a></p>
        </div>
      </div>
    </div>
  </div>

  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<!-- /.carousel -->


<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->

<div class="container marketing">

  <!-- Three columns of text below the carousel -->
  <div class="row">
    <div class="col-lg-4">
      <img class="img-circle" src="img/stay1.jpg" alt="room1" width="150" height="150">
      <h3>스텐다드 룸</h3>
      <p>​바쁜 일상 속에서 진정한 휴식을 원하는 여행객들에게 ​편안하고 아늑한 힐링의 시간을 선사할 수 있는 내 집같은 공간입니다. 프리미엄 급의 다양한 시설 및 어메니티를 갖추고 있으며 여유로운 휴식 공간을 제공합니다.</p>
      <p><a class="btn btn-default" onclick="location.href='room.jsp'" role="button">ROOM details &raquo;</a></p>
    </div><!-- /.col-lg-4 -->
    <div class="col-lg-4">
      <img class="img-circle" src="img/stay2.jpg" alt="room2" width="150" height="150">
      <h3>디럭스 룸</h3>
      <p>독채 객실로 두 개의 방, 거실과 주방으로 이루어져 있으며 각 방에는 개별 욕실이 있습니다. 거실의 넓은 창을 통해 비양도를 한 눈에 담으실 수 있습니다. 방 안에 오픈욕조가 있어 바다를 바라보며 피로를 풀어보세요.</p>
      <p><a class="btn btn-default" onclick="location.href='room.jsp'" role="button">ROOM details &raquo;</a></p>
    </div><!-- /.col-lg-4 -->
    <div class="col-lg-4">
      <img class="img-circle" src="img/stay3.jpg" alt="room3" width="150" height="150">
      <h3>스위트 룸</h3>
      <p>가장 넓은 룸으로 최대 8명까지 가능합니다. 침대방, 온돌방, 거실, 주방, 욕실 두 개로 구성되어 있으며 바다전경을 품고 있습니다. 독채 객실의 프라이빗한 공간에서 머무는 동안 편안함과 자유로움을 만끽해보세요.</p>
      <p><a class="btn btn-default" onclick="location.href='room.jsp'" role="button">ROOM details &raquo;</a></p>
    </div><!-- /.col-lg-4 -->
  </div><!-- /.row -->

  <hr class="featurette-divider">

  <!-- /END THE FEATURETTES -->


  <!-- FOOTER -->
  <footer>
    <p class="pull-right"><a href="#">Back to top</a></p>
    <p>&copy; 2014 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
  </footer>

</div><!-- /.container -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../../dist/js/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="../../assets/js/vendor/holder.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>