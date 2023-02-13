<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>    
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>

<%
	request.setCharacterEncoding("utf-8"); //한글 처리
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	if(new UserDAO().login(id,password) == 1){ //로그인 성공
		session.setAttribute("id", id);
		response.sendRedirect("/main.jsp");
	} else if(new UserDAO().login(id,password) == 0){ //비밀번호 존재x
		%>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true"><div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
		    <h1 class="modal-title fs-5" id="exampleModalLabel">회원가입</h1>
		    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
		    	비밀번호가 틀렸습니다.
		  </div>
		  <div class="modal-footer">
		    <button onclick = "location.href = '/user/loginForm.jsp'" type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
		  </div>
		</div>
		</div>
		</div>
		<script>
			$(function(){
				$("#exampleModal").modal("show");
			})
		</script>
	<% 
	} else{ //아이디 존재x
		%>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true"><div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
		    <h1 class="modal-title fs-5" id="exampleModalLabel2">회원가입</h1>
		    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
		    	아이디가 존재하지 않습니다.
		  </div>
		  <div class="modal-footer">
		    <button onclick = "location.href = '/user/loginForm.jsp'" type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
		  </div>
		</div>
		</div>
		</div>
		<script>
			$(function(){
				$("#exampleModal2").modal("show");
			})
		</script>
	<% 
	}
%>
