<%@page import="java.util.List"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<%@ include file = "/header.jsp" %>
	<link href="/css/sign-in.css" rel="stylesheet">
	<table align = center>
		<tr>
			<td><b>작성 메모 리스트</b></td>
		</tr>
	<% List<FeedDTO> feedList = new FeedDAO().getList(sid); 
	for(FeedDTO feed : feedList){
		%>
		<tr>
			<td colspan=2><hr></td>
		</tr>
		<tr>
			<td><%=feed.getId() %></td>
			<td><small><%=feed.getTs() %></small></td>
		</tr>
		<tr>
			<td colspan=2><%=feed.getContent() %></td>
		</tr>
	<%
		}
	%>
	</table>

	
	<%@ include file = "/footer.jsp" %>
</body>
</html>