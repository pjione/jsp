<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="jdbc.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		String mgender = request.getParameter("mgender");
		
		
		
		//디비메 해당 회원이 존재하는지 여부 exist메서드
		//존재하면 0 세션처리 
		//존재안하면  1 회원 가입 페이지
		
	 	if(MemberDAO.exist(memail) == 1){
			response.sendRedirect("signupForm.jsp?mname="+ URLEncoder.encode(mname, "UTF-8")
												+"&memail="+memail+"&mgender="+mgender);
		} else{
			session.setAttribute("sid", memail);
		}
		 
		
		
		
		String sid = (String)session.getAttribute("sid");
	%>
	
	[<%=sid %>]님  로그인 성공하였습니다.
</body>
</html>