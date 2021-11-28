<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="rDo" class="Final_project.reservationDo" >
  <jsp:setProperty name="rDo" property="*" />
</jsp:useBean>

<jsp:useBean id="rDao" class="Final_project.reservationDao" scope="application" />

<%
	rDao.modifyReservation(rDo); //수정된 데이터 저장
	response.sendRedirect("reservationList.jsp"); //수정데이터확인!!
%>
</body>
</html>