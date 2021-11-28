<%@page import="Final_project.loginDao"%>
<%@page import="Final_project.loginDo"%>
<%@page import="java.util.ArrayList"%>
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
	String id = request.getParameter("id");
	String pass = request.getParameter("password");
	String save = request.getParameter("save");
	
 	//세션에 아이디와 비번 저장
	session.setAttribute("id", id);
	session.setAttribute("pass", pass);
	
	session.setMaxInactiveInterval(60*2);  //2분 
	
	if( save != null ) //쿠키를 저장하도록 save 변수에 값이 있으면
	{
		//1. 쿠키생성
		//Cookie("name","value");
		Cookie cookie = new Cookie("id", id);
		
		//2. 유효기간 설정 (초)
		cookie.setMaxAge(60*1);  //60초 --> 1
		
		//3. 쿠키가 생성되며, 클라이언트 단으로 전달
		response.addCookie(cookie);
		System.out.println("쿠키 생성 완료!!");
	}

	response.sendRedirect("index.jsp"); 
	
%>

	id : <%= id %>
	password : <%= pass %>
	
	
<jsp:useBean id="aDo" class="Final_project.loginDo">
	<jsp:setProperty name="aDo" property="*" />
</jsp:useBean>
<jsp:useBean id="aDao" class="Final_project.loginDao"/>
<%
	aDao.insertLogin(aDo);

	ArrayList<loginDo> aList = aDao.getAllLogin();
	
	for(int i=0; i<aList.size(); i++){
		loginDo jdo2 = aList.get(i);
		out.println(i + ", id : " + jdo2.getId() + 
				", password : " + jdo2.getPassword() + "<br>");
	}
%>


</body>
</html>