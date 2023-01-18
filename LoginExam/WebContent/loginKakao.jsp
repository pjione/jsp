<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a id = "custom-login-btn" href = "javascript:kakaoLogin()">
	<img src = "kakao.png">
</a>

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
				location.href = 'loginKakaoCheck.jsp?mname=' + kakaoAccount.profile.nickname
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