<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모작성</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<%@ include file = "header.jsp" %>
	<link href="sign-in.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	
	<main class="form-signin w-100 m-auto">
		<form action = "feedCheck.jsp" method = "post">
	    <h1 class="h3 mb-3 fw-normal">메모 작성</h1>
	    <div>
	      <input type="hidden" name = id value = <%=sid %> readonly>
	    </div>
	    <div>
	      	<textarea id="summernote" name = "content" class="form-control" rows="5"></textarea> 
	    </div>
	    <button class="w-100 btn btn-lg btn-primary" type="submit">업로드하기</button>
	    <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
	  </form>
  </main>
	   <script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>
     <%@ include file = "footer.jsp" %>
</body>
</html>

