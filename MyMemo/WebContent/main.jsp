<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "header.jsp" %>
	<%if(session.getAttribute("id") != null){%>	
		
	<% } else{ %>
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
	<%
		session.setAttribute("id", session.getAttribute("id"));
	%>
	
	<%@ include file = "footer.jsp" %>
</body>
</html>