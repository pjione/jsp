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
	<% sid = (String)session.getAttribute("id"); %>
	<%if(sid != null){	
		session.setAttribute("id", sid);
	} else{ %>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
		    <h1 class="modal-title fs-5" id="exampleModalLabel">회원 전용 메뉴</h1>
		    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
		    	로그인이 필요합니다.
		  </div>
		  <div class="modal-footer">
		    <button onclick = "location.href = 'loginForm.jsp'" type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
		  </div>
		</div>
		</div>
		</div>
		<script>
			$(function(){
				$("#exampleModal").modal("show");
			})
		</script>	
	<% }%>
	
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

	
	<%@ include file = "footer.jsp" %>
</body>
</html>