<%@page import="Final_project.reviewDo"%>
<%@page import="Final_project.reviewDao"%>
<%@page import="java.util.ArrayList"%>
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

<title>JSP_review</title>

<!-- Bootstrap core CSS -->
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<link href="carousel.css" rel="stylesheet">

<style>
  th,td {
    text-align: center;
  }
</style>


</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="vDao" class="Final_project.reviewDao" scope="application" />



<%
	ArrayList<reviewDo> v = vDao.getAllReview();
%>

  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
    </ol>
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img class="first-slide" src="img/voirvien1_3.jpg" alt="First slide">
        <div class="container">
          <div class="carousel-caption">
            <h2>HYWU-STAY</h2>
            <p>당신이 찾던 가장 완벽한 숙소</p>
            <p><a class="btn btn-lg btn-primary">REVIEW</a></p>
          </div>
        </div>
      </div>
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
	                    onclick="location.href='reservationList.jsp?logout=1'"></a></li>
	            <%
	                    }
	            %>
            

              </ul>
        </div>
      </div>
    </nav>

  </div>
</div>
      
<br><br>
<center>
<div class="container marketing">
	<h2> HYWU 펜션 리뷰하기 </h2>
	<hr>
	<form action="reviewProc.jsp" method="post">
		<%= id %> : <input type="text" name="msg">
		<input type="submit" value="tweet">
	</form>
<br>
<hr>

<%
	ArrayList<String> msgs = (ArrayList<String>)application.getAttribute("msgs");
	if( msgs != null ){//트윗한 내용이 있으면... 프린트한다..
		for( String msg : msgs ){ %>
			<b><%=id %> 님의 리뷰<br></b>
			<%out.println( msg );%><br><hr>
<%
		}
	}
%>

</div>
</center>
</div>
</div>
</body>
</html>