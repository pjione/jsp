<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	subject = URLEncoder.encode(subject,"UTF-8");
	content = URLEncoder.encode(content,"UTF-8");
	/* int result = boardDAO.insert(subject, content); */
	int result = 1;
	
	//msg, rphone
	String rphone = "010-4192-4250";
	
	
	if(result == 1){
		response.sendRedirect("../smsAdv/smsCheck.jsp?msg=" + subject + "&rphone=" + rphone);
	}
%>