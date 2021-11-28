<%@page import="java.util.ArrayList"%>
<%@page import="Final_project.reviewDo"%>
<%@page import="Final_project.reviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="vDo" class="Final_project.reviewDo">
	<jsp:setProperty name="vDo" property="*" />
</jsp:useBean>
<jsp:useBean id="vDao" class="Final_project.reviewDao"/>


<%
	request.setCharacterEncoding("utf-8");
	String msg = request.getParameter("msg"); //tweet 내용
	String id = request.getParameter("id"); //아이디

	vDao.insertReview(vDo);
	ArrayList<reviewDo> aList = vDao.getAllReview();
	

		
	ArrayList<String> msgs = (ArrayList<String>)application.getAttribute("msgs");
	if( msgs == null ){//msgs에 처음 접근하면,
		msgs = new ArrayList<String>();
		application.setAttribute("msgs", msgs); //msgs 이름으로 어레이리스트 객체를 어플리케이션 객체에 생성
	}
	msgs.add(msg);
	response.sendRedirect("review.jsp");


	
%>
</body>
</html>