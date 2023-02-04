<%@page import="java.util.List"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<%@ include file = "/header.jsp" %>
	
	<table align = center>
		<thead></thead>
		<tbody id = "ajaxTable"></tbody>
	</table>
	
	<%@ include file = "/footer.jsp" %>
	<script>
		function searchFunction(){
			$.ajax({
				type : 'post',
				url : 'userCheckAJAX.jsp',
				success : function(data){
					var user = JSON.parse(data.trim());
					var str = "";
					str += "<tr><td><b>전체 회원 목록</b></td></tr>"
					for(var i=0; i<user.length; i++){
						str += "<tr><td colspan=3><hr></td></tr>"
						str += "<tr><td>" + user[i].id + "</td>";
						str += "<td>" + user[i].name + "</td>";
						str += "<td><small>" + user[i].ts + "</small></td></tr>";
						
						
					}$("#ajaxTable").html(str)
				}
			})
		}
	
	
		window.onload = function(){
			searchFunction();
		}
	</script>
</body>
</html>