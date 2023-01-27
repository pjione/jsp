<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jdbc.*" %>
<%@ page import = "java.util.List" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<script type = "text/javascript">
	var searchRequest = new XMLHttpRequest();
	var registerRequest = new XMLHttpRequest();
	function searchFunction() {
		searchRequest.open("Post", "./UserSearchServlet?userName=" + encodeURIComponent(document.getElementById('userName').value), true);
		searchRequest.onreadystatechange = searchProcess;
		searchRequest.send(null);
	}
	function searchProcess() {
		var table = document.getElementById('ajaxTable');
		table.innerHTML = "";
		if(searchRequest.readyState == 4 && searchRequest.status == 200) {
			var object = eval('(' + searchRequest.responseText + ')');
			var result = object.result;
			for(var i = 0; i < result.length; i++) {
				var row = table.insertRow(0);
				for(var j = 0; j < result[i].length; j++) {
					var cell = row.insertCell(j);
					cell.innerHTML = result[i][j].value;
				}
			}
		}
	}
	function registerFunction() {
		registerRequest.open("Post", "./UserRegisterServlet?userName=" + encodeURIComponent(document.getElementById('registerName').value)
			+ "&userAge=" + encodeURIComponent(document.getElementById('registerAge').value)
			+ "&userGender=" + encodeURIComponent($('input[name=userGender]:checked').val())
			+ "&userEmail=" + encodeURIComponent(document.getElementById('registerEmail').value)
			, true);
		registerRequest.onreadystatechange = registerProcess;
		registerRequest.send(null);
	}
	function registerProcess() {
		if(registerRequest.readyState == 4 && registerRequest.status == 200) {
			var result = registerRequest.responseText;
			if(result != 1) {
				alert('등록에 실패했습니다.');
			} else {
				var userName = document.getElementById('userName');
				var registerName = document.getElementById('registerName');
				var registerAge = document.getElementById('registerAge');
				var registerEmail = document.getElementById('registerEmail');
				userName.value = "";
				registerName.value = "";
				registerAge.value = "";
				registerEmail.value = "";
				searchFunction();
			}
		}
	}
	window.onload = function() {
		searchFunction();
	}
	
</script>
</head>
<body>
	<nav class="navbar bg-body-tertiary">
	  <div class="container-fluid">
	    <a class="navbar-brand">Navbar</a>
	    <form class="d-flex" role="search">
          <input class="form-control me-2" type="search" id="userName" onkeyup="searchFunction()" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" onclick="searchFunction();" type="button">Search</button>
    	</form>
	  </div>
	</nav>
	<div class = "container">
		<table class="table table-hover">
		  <thead>
		    <tr>
		      <th scope="col">이름</th>
		      <th scope="col">나이</th>
		      <th scope="col">성별</th> 
		      <th scope="col">이메일</th>
		    </tr>
		  </thead>
		  <tbody id="ajaxTable">
		  <%-- <%
		
			List<User> userList = UserDAO.getList();
		
		
			for(User list : userList){
				%> --%>
			 <%-- 	<tr>
			      <th scope="row"><%=list.getUserName() %></th>
			      <td><%=list.getUserAge() %></td>
			      <td><%=list.getUserGender() %></td>
			      <td><%=list.getUserEmail() %></td>
			    </tr>
				<% 
			}
			
		%> --%>
		 
		  </tbody>
		</table>
		
	</div>
	<div class = "container">
		<div>
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">이름</label>
		  <input type="text" name = "userName" class="form-control" id="exampleFormControlInput1" id = "registerName">
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">나이</label>
		  <input type = "text" class="form-control" name = "userAge" id="exampleFormControlInput2" id = "registerAge">
		</div>
		<div class="mb-3">
			<label for="male" class="form-label">남자</label>
		 	<input type="radio" name = "userGender" value = "male" id = "male">
		 	<label for="female" class="form-label">여자</label>
		 	<input type="radio" name = "userGender" value = "female" id = "female">
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlTextarea3" class="form-label">이메일</label>
		  <input type="text" class="form-control" name = "userEmail" id="eexampleFormControlInput4" id = "registerEmail">
		</div>
		<button class="btn btn-outline-success" onclick="registerFunction();" type="button">Search</button>
		
	</div>
	</div>
</body>
</html>