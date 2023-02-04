<%@page import="java.util.List"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<%@ include file = "header.jsp" %>
	<table align = center>
		<tr>
			<td><b>전체 회원 목록</b></td>
		</tr>
	<% List<UserDTO> userList = new UserDAO().list(); 
	for(UserDTO user : userList){
		%>
		<tr>
			<td colspan=3><hr></td>
		</tr>
		<tr>
			<td><%=user.getId() %></td>
			<td><%=user.getName() %></td>
			<td><small><%=user.getTs() %></small></td>
		</tr>
		
	<%
		}
	%>
	</table>

	
	<%@ include file = "footer.jsp" %>
</body>
</html>