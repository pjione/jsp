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
	<%@ include file = "/header.jsp" %>
	<link href="/css/sign-in.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<% sid = (String)session.getAttribute("id"); %>
	<%if(sid != null){	
		session.setAttribute("id", sid);
	} else{ %>
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
		    <h1 class="modal-title fs-5" id="exampleModalLabel">회원 전용 메뉴</h1>
		    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
		    	로그인이 필요합니다.
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
	<% }%>
	<div class = "container m-auto">	
		<main class="form-signin w-100 m-auto">
		    <h1 class="h3 mb-3 fw-normal">Group Talk</h1>
		    <div>
		      <input type = "hidden" id = "id" value = "<%=sid%>">
		    </div>
		    <div>
		      	<textarea id="summernote" name = "content" class="form-control"></textarea> 
		    </div>
		    <button type = "button" class="btn btn-lg btn-primary" onclick = "addItem()">추가</button>
  		</main>
		<table align = center class = "my-5">
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
			url : '/feed/feedall.jsp',
			success : function(data){
				var feeds = JSON.parse(data.trim());
				var str = "";
				
				for(var i=0; i<feeds.length; i++){
					str += "<tr><td colspan=3><hr></td></tr>";
					str += "<tr><td><small>" + feeds[i].id + "</small></td>";
					str += "<td></td>";
					str += "<td><small>" + feeds[i].ts + "</small></td></tr>";
					str += "<tr><td colspan=3>" + feeds[i].content + "</td></tr>";
					str += "<tr><td colspan=3>";
					if ("<%=sid%>" == feeds[i].id) {
						str += "<div onclick='delItem(\"" + feeds[i].no + "\")'><span class ='bg-warning text-danger'>Delete</span></div>";
					}
					str += "</td></tr>"
				}$("#ajaxTable").html(str)
			}
		});
	}


	window.onload = function(){
		searchFunction();
	}
	function addItem(){
		 $.ajax({
			 type : 'post',
				url : "/feed/feedadd.jsp",
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
	 function delItem(no){
		 $.ajax({
			 type : 'post',
				url : "/feed/feeddel.jsp",
				data : {
					no:no
				},
				dataType : 'text',
				success : function(result) {
					searchFunction();
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
    	  width: 360,
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
    		    //['para', ['ul', 'ol', 'paragraph']],
    		    // 줄간격
    		    //['height', ['height']],
    		    // 그림첨부, 링크만들기, 동영상첨부
    		    ['insert',['picture']]
    		    //['insert',['picture','link','video']]
    		  ],
   		  // 추가한 글꼴
   		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
   		 // 추가한 폰트사이즈
   		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
      });
    </script>
    <%@ include file = "/footer.jsp" %>
</body>
</html>