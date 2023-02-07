<%@page import="jdbc.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage = "page_error_page.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main page</title>
</head>
<body>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>    
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<link href="css/font.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<div class = "container bg-warning shadow mx-auto text-center">
		<h2>Group Talk</h2>
		<hr>
		<div class = "input-group">
			<input type = "hidden" id = "id" value = "z">
			<input id = "summernote" class = "form-control" type = "text" placeholder = "내용을 적으세요">
			<button type = "button" class = "btn btn-primary" onclick = "addItem()">추가</button>
		</div>
		<hr>
		<table align = center>
			<thead>
				<tr>
					<td><b>작성 메모 리스트</b></td>
				</tr>
			</thead>
			<tbody id = "ajaxTable"></tbody>
		</table>		
	</div>
	<script>
	function searchFunction(){
		$.ajax({
			type : 'post',
			url : 'feedall.jsp',
			success : function(data){
				var feeds = JSON.parse(data.trim());
				var str = "";
				
				for(var i=0; i<feeds.length; i++){
					str += "<tr><td colspan=3><hr></td></tr>";
					str += "<tr><td><small>" + feeds[i].id + "</small></td>";
					str += "<td></td>";
					str += "<td><small>" + feeds[i].ts + "</small></td></tr>";
					str += "<tr><td colspan=3>" + feeds[i].content + "</td></tr>";
				}$("#ajaxTable").html(str)
			}
		})
	}


	window.onload = function(){
		searchFunction();
	}
	function addItem(){
		 $.ajax({
			 type : 'post',
				url : "feedadd.jsp",
				data : {
					id:document.getElementById('id').value,
					content:$("#summernote").summernote("code")
				},
				dataType : 'text',
				success : function(result) {
					/* var content = document.getElementById('summernote');
					content.value = ""; */
					searchFunction();
					$("#summernote").summernote("reset");
				},
				error : function(error) {
					console.log(error);
				}
						
			});
		
		
	}
</script>
 <script>
 	
      $('#summernote').summernote({
    	  // 에디터 높이
    	  height: 100,
    	  // 에디터 한글 설정
    	  lang: "ko-KR",
    	  // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
    	  focus : true,
    	  toolbar: [
    		    // 글꼴 설정
    		    ['fontname', ['fontname']],
    		    // 글자 크기 설정
    		    ['fontsize', ['fontsize']],
    		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
    		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    		    // 글자색
    		    ['color', ['forecolor','color']],
    		    // 글머리 기호, 번호매기기, 문단정렬
    		    ['para', ['ul', 'ol', 'paragraph']],
    		    // 줄간격
    		    ['height', ['height']],
    		    // 그림첨부, 링크만들기, 동영상첨부
    		    ['insert',['picture','link','video']]
    		
    		    
    		  ],
   		  // 추가한 글꼴
   		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
   		 // 추가한 폰트사이즈
   		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
      });
    </script>
</body>
</html>