<%@page import="java.util.List"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신청 회원 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<%@ include file = "/header.jsp" %>
	<table align = center>
		<tr>
			<td><b>신청 회원 목록</b></td>
		</tr>
	<% List<UserDTO> userList = new UserDAO().listTemp(); 
	for(UserDTO user : userList){
		%>
		<tr>
			<td colspan=4><hr></td>
		</tr>
		<tr>
			<td><%=user.getId() %></td>
			<td><%=user.getName() %></td>
			<td><small><%=user.getTs() %></small></td>
			<td><a class ='bg-warning text-danger' href='/admin/permit.jsp?id=<%=user.getId() %>&permit=add'>Add</a></td>
			<td><a class ='bg-warning text-primary' href='/admin/permit.jsp?id=<%=user.getId() %>&permit=del'>Del</a></td>
		</tr>
		
	<%
		}
	%>
	</table>

	
	<%@ include file = "/footer.jsp" %>
</body>
</html>