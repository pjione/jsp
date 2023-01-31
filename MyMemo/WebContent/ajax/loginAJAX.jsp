<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 
</head>
<body class="text-center">
	<%@ include file = "/header.jsp" %>
	<!-- Custom styles for this template -->
	<link href="../sign-in.css" rel="stylesheet">
	<main class="form-signin w-100 m-auto">
		
	    <img class="mb-4" src="http://austiny.snu.ac.kr/image/mine.jpg" alt="" width="72" height="57">
	    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
	
	    <div class="form-floating">
	      <input type="text" class="form-control" id="id" name = "id">
	      <label for="id">아이디</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" name = "password" id = "password">
	      <label for="password">패스워드</label>
	    </div>
	    <button class="w-100 btn btn-lg btn-primary" onclick = "loginProcess()" type="submit">Log in</button>
	    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
	  
  </main>
  <%@ include file = "/footer.jsp" %>
  <script>
function loginProcess(){
	 $.ajax({
		 	type : 'post',
			url : "loginCheckAJAX.jsp",
			data : {
				id:encodeURIComponent(document.getElementById('id').value),
				password:(document.getElementById('password').value)
			},
			dataType : 'text',
			success : function(data) {
				alert("로그인 성공")

			},
			error : function(error) {
				console.log(error);
			}
					
		});
	
	
}

	
</script>
</body>
</html>