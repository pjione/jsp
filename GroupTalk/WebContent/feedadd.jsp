<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jdbc.*" %>    
  
<% 
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String content = request.getParameter("content");
	
	out.print(new FeedDAO().insert(id,content));
	
%>