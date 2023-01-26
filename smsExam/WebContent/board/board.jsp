<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>


<div class="alert alert-warning" role="alert">
	<div class = "container">
		<h1 class = "display-3">게시판</h1>
	</div>
</div>
<div class = "container">
	<form action = "boardCheck2.jsp">
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">글 제목</label>
		  <input type="text" name="subject" class="form-control" id="exampleFormControlInput1">
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">글 내용</label>
		  <textarea name="content" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
		</div>	
		
		<input type = "submit" class = "btn btn-primary" value = "등록">
		<input type = "reset" class = "btn btn-warning" value = "취소">
	</form>	
</div>
	
	
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>