<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	out.print(new UserDAO().getListAJAX());
%>