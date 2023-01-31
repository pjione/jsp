<%@page import="java.util.List"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<%@ include file = "header.jsp" %>
	<table align = center>
		<tr>
			<td><b>전체 게시물 목록</b></td>
		</tr>
	<% List<FeedDTO> feedList = new FeedDAO().getAllList(); 
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

	
	<%@ include file = "footer.jsp" %>
</body>
</html>