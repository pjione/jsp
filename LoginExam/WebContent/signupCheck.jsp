<%@ page import = "jdbc.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String mname = request.getParameter("mname");
		String mid = request.getParameter("mid");
		String mpass = request.getParameter("mpass");
		String mgender = request.getParameter("mgender");
		String memail = request.getParameter("memail");
		
		int result = MemberDAO.insert(mname,mid,mpass,mgender,memail);
		
		if(result == 1){
			out.print("success");
		} else{
			out.print("fail");
		}
	%>
</body>
</html>