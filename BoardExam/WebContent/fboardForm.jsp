<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
	<div class = "container">
		<form action = "fboardInsert.jsp" method = "post" enctype = "multipart/form-data">
		<div class="mb-3">
		  <label for="exampleFormControlInput1" class="form-label">제목</label>
		  <input type="text" name = "fbtitle" class="form-control" id="exampleFormControlInput1">
		</div>
		<div class="mb-3">
		  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
		  <textarea class="form-control" name = "fbcontent" id="exampleFormControlTextarea1" rows="3"></textarea>
		</div>
		<div class="input-group">
  			<input type="file" class="form-control" name = "fbfile" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
  			<button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon04">Button</button>
		</div>
		<div class="input-group">
  			<input type="file" class="form-control" name = "fbfile2" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
  			<button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon04">Button</button>
		</div>
		<button type="submit" class="btn btn-primary">등록</button>
	</form>
	</div>
</body>
</html>