<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jdbc.*" %>    
  
<% 
	request.setCharacterEncoding("utf-8");

	String no = request.getParameter("no");
	
	out.print(new FeedDAO().delete(no));
	
%>