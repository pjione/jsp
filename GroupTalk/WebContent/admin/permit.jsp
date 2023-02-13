<%@page import="smtp.*"%>
<%@page import="java.util.*"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String permit = request.getParameter("permit");
	UserDTO udto = new UserDAO().temp(id);
	if(permit.equals("add")){
		new UserDAO().join(id,udto.getPassword(),udto.getName(),udto.getEmail());
		SendMail.sending(udto.getEmail(), udto.getName());
		new UserDAO().deleteTemp(id);
		response.sendRedirect("/admin/temp.jsp");
	}
	else{
		new UserDAO().deleteTemp(id);
		response.sendRedirect("/admin/temp.jsp");
	}
%>
