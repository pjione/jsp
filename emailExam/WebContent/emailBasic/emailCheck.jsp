<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import = "java.util.*" %> 
<%@ page import = "smtp.*" %>
<%
	request.setCharacterEncoding("utf-8");

	Map<String,String> emailInfo = new HashMap<>();
	
	emailInfo.put("from", request.getParameter("from"));
	emailInfo.put("to", request.getParameter("to"));
	emailInfo.put("subject", request.getParameter("subject"));
	emailInfo.put("content", request.getParameter("content"));
	
	emailInfo.put("format", "text/plain;charset=UTF-8"); //메일의 형식을 일단 text로 고정
	
	try{
		NaverSMTP smtpServer = new NaverSMTP(); //메일 전송 객체 설정
		smtpServer.emailSending(emailInfo);
		out.print("이메일 전송 성공");
	} catch(Exception e){
		out.print("이메일 전송 실패");
		e.printStackTrace();
	}
	
%>
