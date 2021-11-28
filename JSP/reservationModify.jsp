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

<title>JSP_modify</title>
    <meta charset="utf-8">
<!-- Main css styles -->
<link rel="stylesheet" media="all" href="https://assets02.stayfolio.com/assets/booking/application-7bf9ecc996732e8f7515f76d3555406979ba949c077d734801c9c1eee0d305d9.css" />

<!-- Include style per-controller - vendor plugins -->
<link rel="stylesheet" media="all" href="https://assets01.stayfolio.com/assets/booking/bookings-5cb6c1d5ceca46646a8a29318daf029ff41bef1159a94e4871dc31b409b631ba.css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" type="text/css">
<link href="//fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" media="all" href="https://assets03.stayfolio.com/assets/build/booking_client.bundle-f6aceed9811f4c1366b1c1e366374b887568252189ee000719956d03a8ef9332.css" />
</head>

<% request.setCharacterEncoding("utf-8"); %>

<body class="booking-body desktop-body plugin-body">
<jsp:useBean id="rDao" class="Final_project.reservationDao" scope="application" />
<%
	int num = Integer.parseInt(request.getParameter("num"));
	reservationDo rDo = rDao.getReservationOne(num);
%>

<form action="reservationModifyProc.jsp" method="post">
<div class="booking-plugin">
	<div class="container">
	<div class="booking-new">
	<div data-reactroot="" data-reactid="1" data-react-checksum="-2077992218">
	<div class="booking-new" data-reactid="2">
	<div class="section section-calendar" data-reactid="3">
	<div class="calendar-bold-outline" data-reactid="4">
	    <div class="calendar-outline" data-reactid="5">
	    <div class="title-head" data-reactid="6">
	        <!-- react-text: 7 -->RESERVATIONS<!-- /react-text -->
	    <small data-reactid="8">예약 내용을 확인 후 결제해 주세요.</small>
	</div>
<div class="row" data-reactid="9">
    <div class="col-lg-offset-1 col-lg-10" data-reactid="10">
    <div class="section-calendar" data-reactid="11">
        <form class="booking-form" name="booking-form" data-reactid="12">
            <div class="clearfix form-row" data-reactid="13">
                <div class="key" data-reactid="14">예약일</div>
                <div class="value" data-reactid="15">
                    <!-- react-text: 16 -->Check in (ex 2021.05.31)<!-- /react-text -->
   <div class="static-value" data-reactid="17">
       <input type="text" name="cin" class="form-control" data-reactid="29" value="<%= rDo.getCin() %>"/>
   </div>
   <!-- react-text: 18 -->Check out (ex 2021.06.01)<!-- /react-text -->
        <div class="static-value" data-reactid="17">
            <input type="text" name="cout" class="form-control" data-reactid="29" value="<%= rDo.getCout() %>"/>
        </div>
    </div>
</div>


	    <div class="clearfix form-row form-input" data-reactid="38">
	        <div class="key" data-reactid="39">객실 선택</div>
	            <div class="value" data-reactid="44">
	            <label class="radio-inline" data-reactid="190">
                  <input type="text" name="roomtype" class="form-control" data-reactid="29" value="<%= rDo.getRoomtype() %>"/></label>
               </div>
           </div>
       
   
    <div class="clearfix form-row form-input" data-reactid="26">
    <div class="key" data-reactid="27">이름</div>
        <div class="value" data-reactid="17">
        <label class="radio-inline" data-reactid="190">
            <input type="text" name="name" class="form-control" data-reactid="29" value="<%= rDo.getName() %>"/></label>
        </div>
    </div>
    <div class="clearfix form-row form-input" data-reactid="30">
        <div class="key" data-reactid="31">연락처</div>
        <div class="value" data-reactid="17">
        <label class="radio-inline" data-reactid="190">
            <input type="text" name="tel" class="form-control" data-reactid="29" value="<%= rDo.getTel() %>"/></label>
        </div>
    </div>
    <div class="clearfix form-row form-input" data-reactid="34">
        <div class="key" data-reactid="35">이메일</div>
        <div class="value"  data-reactid="17">
        <label class="radio-inline" data-reactid="190">
            <input type="text" name="email" class="form-control" data-reactid="29" value="<%= rDo.getEmail() %>"/></label>
        </div>
    </div>
    <div class="clearfix form-row form-input" data-reactid="38">
	        <div class="key" data-reactid="39">
	            <!-- react-text: 40 -->인원<!-- /react-text --><!-- react-text: 41 -->(<!-- /react-text --><!-- react-text: 42 -->최소2명 / 최대 6명<!-- /react-text --><!-- react-text: 43 -->)<!-- /react-text -->
	        </div>
	            <div class="value" data-reactid="44">
	                <div class="passenger-input" data-reactid="45">
	                    <span class="passenger-input" data-reactid="46">총 인원</span>
	                    <label class="radio-inline" data-reactid="190">
	                        <input type="text" name="person" class="form-control" data-reactid="29" value="<%= rDo.getPerson() %>"/></label> </label>
                    </div>
                </div>
     </div>
        
        
    
    <div class="clearfix form-row form-total" data-reactid="161">
        <div class="key" data-reactid="162">Total</div>
        <div class="value" data-reactid="163">
            <div class="price-info" data-reactid="164">
                <div class="booking-price" data-reactid="165">
                    <span class="title" data-reactid="166">객실요금</span>
                    <span class="price" data-reactid="167">
                        <!-- react-text: 168 -->300,000<!-- /react-text --><!-- react-text: 169 --><!-- /react-text --></span>
                        <span class="won" data-reactid="170">원</span>
                    </div>
                    
                    <div class="total-price" data-reactid="181">
                        <span class="title" data-reactid="182">총 결제금액</span>
                        <span class="price" data-reactid="183">
                            <!-- react-text: 184 -->￦<!-- /react-text --><!-- react-text: 185 -->300,000<!-- /react-text --></span>
                            <span class="won" data-reactid="186">원</span>
                        </div>
                    </div>
                </div>
            </div>
        
    <div class="clearfix form-row form-radio" data-reactid="187">
        <div class="key" data-reactid="188">결제정보</div>
        <div class="value" data-reactid="189">
            <label class="radio-inline" data-reactid="190">
                <input type="text" name="pay" class="form-control" data-reactid="29" value="<%= rDo.getPay() %>"/></label>
            </label>
                </div>
            </div>
        </div>
    </div>
    </div>
    <div data-reactid="206">
                  <br><br>
                  <div class="clearfix form-row form-agreement-title" data-reactid="207">
                  <div class="key-agreement-title" data-reactid="208">
                  <div class="clearfix form-row booking-last" data-reactid="308">
                      <input type="hidden" name="num" value="<%=rDo.getNum() %>">
    			 <input type="submit" class="ladda-button booking-btn" onclick="location.href='reservationList.jsp?num=<%=rDo.getNum()%>'" value="수정완료" data-reactid="309"/>
                  </div>
                  <div class="clearfix form-row booking-last" data-reactid="308">
                      <a class="ladda-button booking-btn" data-style="zoom-in" onclick="location.href='reservationList.jsp'" role="button" data-reactid="309">
                          <span class="ladda-label" data-reactid="310">전체 예약 리스트 보기</span>
                      </a>
                  </div>
                  <div class="clearfix form-row booking-last" data-reactid="308">
                      <a class="ladda-button booking-btn" onclick="location.href='reservationDelete.jsp?num=<%=rDo.getNum()%>'" role="button" data-reactid="309">
                          <span class="ladda-label" data-reactid="310">삭제하기</span>
                      </a>
                  </div>
              </div>
          </div>
      </div>
</div></div></div></div></div></div></div></div></div>                        

<!-- javascript files -->
<script src="https://assets03.stayfolio.com/assets/booking/application-71b8d010cd9a6e70508db07b813e0f4c86f796ecafce943996f99954453e76dd.js"></script>
<script src="https://assets02.stayfolio.com/assets/build/vendor.dll-2e4ba69daa4e6880bbb376750a1fac83efdc47ac1d6c77b0353cd19ba5fdf841.js"></script>
<script src="https://assets01.stayfolio.com/assets/build/booking_client.bundle-86c685a3c946fd31517ba52fc1f3732eae24be9be55c88b1dfba01a647145482.js"></script>
<script src="https://assets01.stayfolio.com/assets/booking/bookings-50bf3ca647a9d1f8652d903e799619f5a562a174f3fb85adba7a668674ea79c6.js"></script>
</form>
</body>
</html>


