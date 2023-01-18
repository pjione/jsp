<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String mname = request.getParameter("mname");
	String memail = request.getParameter("memail");
	String mgender = request.getParameter("mgender");
%>
	<div class = "container">
		<form class="row g-3" action = "signupCheck.jsp">
			<div class="col-md-6">
			    <label for="inputName" class="form-label">이름</label>
			    <input type="text" class="form-control" id="inputName" name = "mname" value =<%=mname %> readonly>
		  	</div>
			<div class="col-md-6">
			   <label for="mid" class="form-label">아이디</label>
			   <input type="text" class="form-control" id="mid" name = "mid">
			 </div>
			  <div class="col-md-6">
			   <label for="inputPassword" class="form-label">비밀번호</label>
			   <input type="password" class="form-control" id="inputPassword" name = "mpass">
			 </div>
			 <div class="col-md-6">
			   <label for="inputPasswordCheck" class="form-label">비밀번호 확인</label>
			   <input type="password" class="form-control" id="inputPasswordCheck">
			 </div>
			 <div class="col-md-6">
			   <label for="inputEmail4" class="form-label">이메일</label>
			   <input type="email" class="form-control" id="inputEmail4" name = "memail" value = <%=memail %> readonly>
			 </div>
			 <div class="col-md-6">
			   <label for="mgender" class="form-label">성별</label>
			   <select id="mgender" class="form-select" name="mgender">
			     <%if(mgender.equals("male")){ %>
			     <option value = "male">남자</option>
			     <%} else {%>
			     <option value = "female" >여자</option>
			   	<%} %>
			   </select>
			 </div>
			 <div class="col-12">
			   <button type="submit" class="btn btn-primary">회원가입</button>
			 </div>
		</form>
	</div>
</body>
</html>