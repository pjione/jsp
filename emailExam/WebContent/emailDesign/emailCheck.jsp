<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import = "java.util.*" %> 
<%@ page import = "smtp.*" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<%
	request.setCharacterEncoding("utf-8");

	Map<String,String> emailInfo = new HashMap<>();
	
	emailInfo.put("from", request.getParameter("from"));
	emailInfo.put("to", request.getParameter("to"));
	emailInfo.put("subject", request.getParameter("subject"));
	//emailInfo.put("content", request.getParameter("content"));
	
	//emailInfo.put("format", "text/plain;charset=UTF-8"); //메일의 형식을 일단 text로 고정
	
	//html또는 text로 메일 전송 방법 설정
	
	String content = request.getParameter("content");
	String format = request.getParameter("format");
	
	if(format.equals("text")){
		emailInfo.put("content", request.getParameter("content")); //메일 내용
		emailInfo.put("format", "text/plain;charset=UTF-8"); //메일 형식
	} else if(format.equals("html")){
		//html형식으로 변환하여 저장
		content = content.replace("\r\n", "<br/>");
		String htmlContent = ""; //전체 내용을 html형식으로 바꾸어 저장할 변수
		
		//html 메일 탬플릿 파일 읽어오기
		String templatePath = application.getRealPath("/emailDesign/emailDesign.html");
		BufferedReader br = new BufferedReader(new FileReader(templatePath));
		
		String oneLine;
		while((oneLine = br.readLine()) != null){
			htmlContent += oneLine + "\n";
		}
		br.close();
		
		//읽어온 템플릿의 자리표시자인 _content_ 부분을 메일 내용으로 대체
		
		htmlContent = htmlContent.replace("__content__", content);
		
		//변경 내용 저장
		emailInfo.put("content",htmlContent);
		emailInfo.put("format","text/html;charset=UTF-8");
	}
	
	
	try{
		NaverSMTP smtpServer = new NaverSMTP(); //메일 전송 객체 설정
		smtpServer.emailSending(emailInfo);
		%>
		<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	이메일 전송 성공
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script>
	$(function(){
		$("#exampleModal").modal("show");
	})
</script>
		<% 
	} catch(Exception e){
		%>
				<!-- Modal -->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	이메일 전송 실패
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script>
	$(function(){
		$("#exampleModal2").modal("show");
	})
</script>
		<% 
	}
	
%>
