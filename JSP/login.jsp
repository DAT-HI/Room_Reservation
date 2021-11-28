<%@page import="Final_project.loginDo"%>
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

<title>JSP_login</title>

 <!-- Custom styles for this template -->
 <link href="signin.css" rel="stylesheet">

 <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
<style>
.a{
	width : 100
}
</style>
</head>

  <body>
  
  <%
	//1. 브라우저에 쿠키가 있는지 확인, 있다면 읽어 들인다.
	// 쿠키가 몇개인지 모르기 때문에, 배열로 쿠키값을 저장합니다...
	Cookie cookies[] = request.getCookies();
	//userid 저장을 위한 변수
	String id="";
	
	if( cookies != null) //하나이상의 쿠키가 있다면
	{
		for(int i=0; i<cookies.length; i++)
		{
			//읽어온 쿠키의 이름이 "userid"가 있다면,
			if( cookies[i].getName().equals("id")){
				id = cookies[i].getValue();
				break; //for문 중단..
			}
		}
	}
%>
  

  <form action="loginProc.jsp" method="post">
    <div class="container">
      <div class="form-signin">
        <h3 class="form-signin-heading">로그인 해주세요.</h3>
        <h5 class="form-signin-heading">더욱 다양한 서비스가 가능합니다.</h5>
        <label for="inputId" class="sr-only">Id</label>
        <input type="text" name="id" value="<%= id %>" class="form-control" placeholder="Id" required >
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="text" name="password" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me" name="save" value="1"> 아이디 저장
          </label>
        </div>
        <input type="submit" class="btn btn-lg btn-primary btn-block" value="로그인">
      </div>
	
    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    
    </center>
  </body>
</html>