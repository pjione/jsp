<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
 <body class = "text-center">
  <div class = "container" style = "margin : 80px">
	<form action = "loginCheck.jsp">
	    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
	    <div class="form-floating">
	      <input type="text" class="form-control" id="floatingInput" name = "mid">
	      <label for="floatingInput">아이디</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="floatingPassword" name = "mpass">
	      <label for="floatingPassword">비밀번호</label>
	    </div>
	
	    <div class="checkbox mb-3">
	      <label>
	        <input type="checkbox" value="remember-me"> Remember me
	      </label>
	    </div>
	    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
	    <div style = "margin : 80px">
		    <a id = "custom-login-btn" href = "javascript:kakaoLogin()">
				<img src = "kakao.png">
			</a>
		</div>
	    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
	</form> 
 </div>
 

<script src = "http://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	//발급 받은 키
	Kakao.init("b228c636b51d3c9d389fa37c9bd68e8e");
	
	function kakaoLogin(){
		window.Kakao.Auth.login({
			//개발자 사이트에서 체크한 항목들과 반드시 일치해야 한다.
			scope:'profile_nickname, account_email, gender',
			success: function(authObj){
				window.Kakao.API.request({
				url:'/v2/user/me',
				success:res=>{const kakaoAccount = res.kakao_account;
				location.href = 'loginCheckKakao.jsp?mname=' + kakaoAccount.profile.nickname
														+ '&memail=' + kakaoAccount.email
														+ '&mgender=' + kakaoAccount.gender
				}
			});
			}
		});
	}
</script>
</body>
</html>