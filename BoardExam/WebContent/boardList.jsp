<%@ page import = "jdbc.*" %>
<%@ page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // 전송 받는 데이터 한글 처리 
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
	<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th> 
      <th scope="col">작성일</th>
    </tr>
  </thead>
  <tbody>
  <%

	List<BoardDTO> bdtoList = BoardDAO.getList();


	for(BoardDTO list : bdtoList){
		%>
	 	<tr>
	      <th scope="row"><%=list.getBno() %></th>
	      <td><%=list.getBtitle() %></td>
	      <td><%=list.getBwriter() %></td>
	      <td><%=list.getBdate() %></td>
	    </tr>
		<% 
	}
	
%>
 
  </tbody>
</table>
</body>
</html>