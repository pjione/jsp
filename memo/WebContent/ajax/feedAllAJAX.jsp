<%@page import="java.util.List"%>
<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				url : 'feedAllCheckAJAX.jsp',
				success : function(data){
					var feeds = JSON.parse(data.trim());
					var str = "";
					
					for(var i=0; i<feeds.length; i++){
						str += "<tr><td>" + feeds[i].no + "</td>";
						str += "<td>" + feeds[i].id + "</td>";
						str += "<td>" + feeds[i].content + "</td>";
						str += "<td>" + feeds[i].ts + "</td></tr>";
						
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