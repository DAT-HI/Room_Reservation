<%@page import="java.util.ArrayList"%>
<%@page import="Final_project.reservationDo"%>
<%@page import="Final_project.reservationDao"%>
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

<title>JSP_List</title>

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
<jsp:useBean id="rDao" class="Final_project.reservationDao" scope="application" />
<%
	ArrayList<reservationDo> v = rDao.getAllReservation();
%>

  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
    </ol>
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img class="first-slide" src="img/voirvien1_2.jpg" alt="First slide">
        <div class="container">
          <div class="carousel-caption">
            <h2>HYWU-STAY</h2>
            <p>????????? ?????? ?????? ????????? ??????</p>
            <p><a class="btn btn-lg btn-primary">????????????</a></p>
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
	            if( logout != null) //logout??? ?????? ???????????????,,
	            {
	                //??????????????? ?????? ?????????, id = null ??? ??????.
	                session.setAttribute("id", null);
	                session.setMaxInactiveInterval(0);
	            }
	        
	            String id = (String) session.getAttribute("id");
	            if( id == null)
	            {
	                id = "??????";
	            }
		        %>

	            <li><a><div class="log"></div></a></li>

	            <%
	                    if( id.equals("??????")){
	            %>
	                    <li><a><%= id %>??? <input type="button" value="?????????"
	                    onclick="location.href='login.jsp'"></a></li>
	            <%
	                    }
	                    else {
	            %>
	                    <li><a><%= id %>??? <input type="button" value="????????????"
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
 <button type="button" class="btn btn-lg btn-dark" onclick="location.href='reservation.jsp'">
      ????????? ?????? ????????????
  </button>
</center>

<br><br>
<table class="table table-striped">
  <thead>
    <tr align="center">
      <th scope="col" width="150">??????</th>
      <th scope="col" width="150">????????????</th>
      <th scope="col" width="150">?????????</th>
	  <th scope="col" width="150">?????????</th>
	  <th scope="col" width="150">????????????</th>  
	  <th scope="col" width="150">????????????</th>  
	  <th scope="col" width="150">??? ?????????</th>
	  <th scope="col" width="150">????????????</th>
    </tr>
  </thead>
  <tbody>

<%
for(int i=0; i < v.size(); i++)
{
	reservationDo rDo = v.get(i);
%>

  <tr height="60" align="center"> 
    <td width="150">
     <a href="reservationInfo.jsp?num=<%=rDo.getNum() %>"><%= rDo.getName() %></a>
    </td>
    <td><%= rDo.getTel() %> </td> 
    <td><%= rDo.getEmail() %> </td> 
    <td><%= rDo.getCin() %> </td>  
    <td><%= rDo.getCout() %> </td>  
    <td><%= rDo.getRoomtype() %> </td> 
    <td><%= rDo.getPerson() %> </td> 
    <td><%= rDo.getPay() %> </td> 
  </tr>
  
<%
}
%>
</tbody>
</table>
</div>
</div>
<br><br>
</body>
</html>